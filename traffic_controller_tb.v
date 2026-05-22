`timescale 1ns / 1ps

module Complex_Traffic_Controller_TB;

    reg clk, rst;

    wire [2:0] m1_light;
    wire [2:0] mt_light;
    wire [2:0] m2_light;
    wire [2:0] s_light;

    complex_traffic_controller dut (
        .clk(clk), 
        .rst(rst), 
        .m1_light(m1_light), 
        .mt_light(mt_light), 
        .m2_light(m2_light),
        .s_light(s_light)
    );

    initial begin
        clk = 1'b0;
        forever #(1000000000/2) clk = ~clk; 
    end

    initial begin
        rst = 0;
        
        #1000000000; 
        rst = 1;     
        
        #1000000000; 
        rst = 0;     

        #(64'd1000000000 * 200); 
        
        $finish;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | M1=%b | MT=%b | M2=%b | S=%b", 
                 $time, rst, m1_light, mt_light, m2_light, s_light);
    end

endmodule