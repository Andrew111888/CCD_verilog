module ccd_driver (
    input wire clk,         // 100 MHz
    input wire rst_n,       // 低有效复位
    output reg cdsclk1,     // CCD 时钟1 (P1H/P2H)
    output reg cdsclk2,     // CCD 时钟2 (P2H/P1H)
    output reg ROG,         // CCD ROG 复位门控
    output reg SH           // CCD SH 信号
);

parameter [5:0] CLK_DIV = 6'd50;
reg [5:0] clk_div_cnt;

parameter [14:0] FRAME_MAX = 15'd19999;
reg [14:0] frame_cnt;

// clk_div_cnt 计数逻辑
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        clk_div_cnt <= 0;
    else if (clk_div_cnt == (CLK_DIV - 1))
        clk_div_cnt <= 0;
    else
        clk_div_cnt <= clk_div_cnt + 1;
end

// cdsclk1/2 输出翻转
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cdsclk1 <= 0;
        cdsclk2 <= 1;
    end else if (clk_div_cnt == (CLK_DIV - 1)) begin
        cdsclk1 <= ~cdsclk1;
        cdsclk2 <= ~cdsclk2;
    end
end

// frame_cnt 计数逻辑
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        frame_cnt <= 0;
    else if (frame_cnt == FRAME_MAX)
        frame_cnt <= 0;
    else
        frame_cnt <= frame_cnt + 1;
end

// ROG 和 SH 控制逻辑
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        ROG <= 1'b0;
        SH  <= 1'b0;
    end else begin
        ROG <= (frame_cnt < 100);
        SH  <= (frame_cnt > 500 && frame_cnt < 1000);
    end
end


endmodule
