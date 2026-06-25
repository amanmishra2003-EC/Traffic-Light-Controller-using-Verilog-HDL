`timescale 1ns / 1ps



module tb_traffic_light_controller ;

reg clk , rst ;
reg Ta , Tb ;
wire [1:0] La , Lb ;
wire [1:0] state_out;

traffic_light_controller dut(
        .clk(clk) ,
        .rst(rst),
        .Ta(Ta),
        .Tb(Tb),
        .La(La) ,
        .Lb(Lb) ,
        .state_out(state_out) 
        ) ;

always #5 clk = ~clk ;
        
initial begin

clk = 0 ;
rst = 0 ;
Ta  = 0 ;
Tb  = 0 ;

         $monitor("Time=%0t clk=%b rst=%b Ta=%b Tb=%b state_out =%b La=%b Lb=%b ", $time ,clk ,rst , Ta , Tb , state_out ,La ,Lb );
        
rst = 1 ;
#10 ;
rst = 0;

Ta = 1;
Tb = 0;
#20;

Ta = 0;
#10;

#10;

Tb = 1;
#20;

Tb = 0;
#10;

#10;



$finish ;
end



endmodule
