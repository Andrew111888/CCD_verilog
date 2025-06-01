module ad9235_driver (
    input wire clk,             // 100 MHz
    input wire rst_n,           // 低有效复位
    input wire [11:0] adc_data, // AD9235 并行数据
    input wire cdsclk1,         // CCD 时序作为 ADC 采样时钟
    output reg adcclk,          // 送给 AD9235 的时钟（与 cdsclk1 同步）
    output reg [11:0] pixel_data, // 采集到的像素数据
    output reg pixel_valid        // 数据有效
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            adcclk <= 0;
        else
            adcclk <= cdsclk1;  // 直接把 cdsclk1 作为 ADC 时钟输出
    end

    always @(posedge cdsclk1 or negedge rst_n) begin
        if (!rst_n) begin
            pixel_data <= 12'd0;
            pixel_valid <= 0;
        end else begin
            pixel_data <= adc_data;
            pixel_valid <= 1;
        end
    end

endmodule
