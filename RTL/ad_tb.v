`timescale 1ns/1ps

module tb_ad9235_driver;

// 信号声明
reg clk;               // 100 MHz 时钟
reg rst_n;             // 低有效复位
reg [11:0] adc_data;   // AD9235 并行数据
reg cdsclk1;           // CCD 时序作为 ADC 采样时钟
wire adcclk;           // 送给 AD9235 的时钟（与 cdsclk1 同步）
wire [11:0] pixel_data; // 采集到的像素数据
wire pixel_valid;      // 数据有效

// 例化待测模块
ad9235_driver uut (
    .clk(clk),
    .rst_n(rst_n),
    .adc_data(adc_data),
    .cdsclk1(cdsclk1),
    .adcclk(adcclk),
    .pixel_data(pixel_data),
    .pixel_valid(pixel_valid)
);

// 时钟生成 100MHz -> 周期 10ns
initial clk = 0;
always #5 clk = ~clk;

// cdsclk1 生成 10MHz 时钟
always #50 cdsclk1 = ~cdsclk1;

// 仿真过程
initial begin
    // 初始复位
    rst_n = 0;
    adc_data = 12'd0;
    cdsclk1 = 0;
    #20;
    rst_n = 1; // 解除复位

    // 激励数据，模拟 ADC 数据输入
    #100 adc_data = 12'd1024;
    #100 adc_data = 12'd2048;
    #100 adc_data = 12'd4096;
    #100 adc_data = 12'd8192;

    // 运行一段时间观察波形
    #500000;

    // 结束仿真
    $stop;
end

// 波形输出
initial begin
    $dumpfile("ad9235_driver_tb.vcd");
    $dumpvars(0, tb_ad9235_driver);
end

endmodule
