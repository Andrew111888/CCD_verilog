`timescale 1ns/1ps

module tb_ccd_driver;

// 信号声明
reg clk;
reg rst_n;
wire cdsclk1;
wire cdsclk2;
wire ROG;
wire SH;

// 例化待测模块
ccd_driver uut (
    .clk(clk),
    .rst_n(rst_n),
    .cdsclk1(cdsclk1),
    .cdsclk2(cdsclk2),
    .ROG(ROG),
    .SH(SH)
);

// 时钟生成 100MHz -> 周期10ns
initial clk = 0;
always #5 clk = ~clk;

// 仿真过程
initial begin
    // 初始复位
    rst_n = 0;
    #100;
    rst_n = 1;

    // 运行一段时间观察波形
    #500000;

    // 结束仿真
    $stop;
end

// 波形输出
initial begin
    $dumpfile("ccd_driver_tb.vcd");
    $dumpvars(0, tb_ccd_driver);
end

endmodule
