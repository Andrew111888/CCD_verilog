`timescale 1ns/1ps

module tb_ccd_driver;

// �ź�����
reg clk;
reg rst_n;
wire cdsclk1;
wire cdsclk2;
wire ROG;
wire SH;

// ��������ģ��
ccd_driver uut (
    .clk(clk),
    .rst_n(rst_n),
    .cdsclk1(cdsclk1),
    .cdsclk2(cdsclk2),
    .ROG(ROG),
    .SH(SH)
);

// ʱ������ 100MHz -> ����10ns
initial clk = 0;
always #5 clk = ~clk;

// �������
initial begin
    // ��ʼ��λ
    rst_n = 0;
    #100;
    rst_n = 1;

    // ����һ��ʱ��۲첨��
    #500000;

    // ��������
    $stop;
end

// �������
initial begin
    $dumpfile("ccd_driver_tb.vcd");
    $dumpvars(0, tb_ccd_driver);
end

endmodule
