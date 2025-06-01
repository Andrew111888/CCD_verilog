`timescale 1ns/1ps

module tb_ad9235_driver;

// �ź�����
reg clk;               // 100 MHz ʱ��
reg rst_n;             // ����Ч��λ
reg [11:0] adc_data;   // AD9235 ��������
reg cdsclk1;           // CCD ʱ����Ϊ ADC ����ʱ��
wire adcclk;           // �͸� AD9235 ��ʱ�ӣ��� cdsclk1 ͬ����
wire [11:0] pixel_data; // �ɼ�������������
wire pixel_valid;      // ������Ч

// ��������ģ��
ad9235_driver uut (
    .clk(clk),
    .rst_n(rst_n),
    .adc_data(adc_data),
    .cdsclk1(cdsclk1),
    .adcclk(adcclk),
    .pixel_data(pixel_data),
    .pixel_valid(pixel_valid)
);

// ʱ������ 100MHz -> ���� 10ns
initial clk = 0;
always #5 clk = ~clk;

// cdsclk1 ���� 10MHz ʱ��
always #50 cdsclk1 = ~cdsclk1;

// �������
initial begin
    // ��ʼ��λ
    rst_n = 0;
    adc_data = 12'd0;
    cdsclk1 = 0;
    #20;
    rst_n = 1; // �����λ

    // �������ݣ�ģ�� ADC ��������
    #100 adc_data = 12'd1024;
    #100 adc_data = 12'd2048;
    #100 adc_data = 12'd4096;
    #100 adc_data = 12'd8192;

    // ����һ��ʱ��۲첨��
    #500000;

    // ��������
    $stop;
end

// �������
initial begin
    $dumpfile("ad9235_driver_tb.vcd");
    $dumpvars(0, tb_ad9235_driver);
end

endmodule
