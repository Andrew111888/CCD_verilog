module top (
    input wire clk,              // 外部输入时钟
    input wire rst,              // 外部输入复位
    input wire [11:0] data,      // 外部输入 ADC 数据
    output wire sload,           // 输出 sload 控制信号（固定为0）
    output wire sclk,            // 输出 sclk 控制信号（固定为0）
    output wire cdsclk2,         // CCD 时钟2 输出
    output wire cdsclk1,         // CCD 时钟1 输出
    output wire adcclk,          // ADC 时钟输出
    output wire CLK,             // CCD SH 信号输出
    output wire ROG              // CCD ROG 复位门控输出
);

    // 内部连线定义
    wire net_clk;                // PAD 输入时钟
    wire net_rst;                // PAD 输入复位
    wire [11:0] net_data;        // PAD 输入数据
    wire net_cdsclk1;            // CCD 驱动输出信号
    wire net_cdsclk2;
    wire net_adcclk;
    wire net_CLK;
    wire net_ROG;

    // ========= 输入 PAD 例化 =========
    PIW clk_pad (.PAD(clk), .C(net_clk));    // 时钟 PAD
    PIW rst_pad (.PAD(rst), .C(net_rst));    // 复位 PAD

    // ADC 并行数据输入 PAD
    PIW data_pad_0 (.PAD(data[0]), .C(net_data[0]));
    PIW data_pad_1 (.PAD(data[1]), .C(net_data[1]));
    PIW data_pad_2 (.PAD(data[2]), .C(net_data[2]));
    PIW data_pad_3 (.PAD(data[3]), .C(net_data[3]));
    PIW data_pad_4 (.PAD(data[4]), .C(net_data[4]));
    PIW data_pad_5 (.PAD(data[5]), .C(net_data[5]));
    PIW data_pad_6 (.PAD(data[6]), .C(net_data[6]));
    PIW data_pad_7 (.PAD(data[7]), .C(net_data[7]));
    PIW data_pad_8 (.PAD(data[8]), .C(net_data[8]));
    PIW data_pad_9 (.PAD(data[9]), .C(net_data[9]));
    PIW data_pad_10 (.PAD(data[10]), .C(net_data[10]));
    PIW data_pad_11 (.PAD(data[11]), .C(net_data[11]));

    // ========= 输出 PAD 例化 =========
    PO16W sload_o (.PAD(sload), .I(1'b0));      // 固定低电平
    PO16W sclk_o  (.PAD(sclk),  .I(1'b0));      // 固定低电平
    PO16W cdsclk2_o (.PAD(cdsclk2), .I(net_cdsclk2));  // 连接 CCD 驱动输出
    PO16W cdsclk1_o (.PAD(cdsclk1), .I(net_cdsclk1));
    PO16W adcclk_o  (.PAD(adcclk),  .I(net_adcclk));
    PO16W CLK_o     (.PAD(CLK),     .I(net_CLK));
    PO16W ROG_o     (.PAD(ROG),     .I(net_ROG));

    // ========= CCD 驱动模块例化 =========
    ccd_driver CCD_DRV (
        .clk(net_clk),               // 输入时钟
        .rst_n(~net_rst),            // 低有效复位（取反）
        .cdsclk1(net_cdsclk1),       // CCD 时序输出
        .cdsclk2(net_cdsclk2),
        .ROG(net_ROG),
        .SH(net_CLK)
    );

    // ========= ADC 驱动模块例化 =========
    ad9235_driver ADC_DRV (
        .clk(net_clk),               // 输入时钟
        .rst_n(~net_rst),            // 低有效复位
        .adc_data(net_data),         // 并行 ADC 数据输入
        .cdsclk1(net_cdsclk1),       // CCD 时钟1 作为 ADC 采样时钟
        .adcclk(net_adcclk),         // ADC 时钟输出
        .pixel_data(),               // 暂未连接后续像素数据
        .pixel_valid()               // 暂未连接数据有效信号
    );

endmodule
