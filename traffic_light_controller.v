`timescale 1ns / 1ps


module traffic_light_controller(
       input clk , rst ,
       input Ta , Tb ,
       output reg [1:0] La , Lb ,
       output wire [1:0] state_out


);

parameter [1:0] s0 = 2'b00 ;
parameter [1:0] s1 = 2'b01 ;
parameter [1:0] s2 = 2'b10 ;
parameter [1:0] s3 = 2'b11 ;

parameter [1:0] GREEN  = 2'b00 ;
parameter [1:0] YELLOW = 2'b01 ;
parameter [1:0] RED    = 2'b10 ;

reg [1:0] state ;

always@(posedge clk or posedge rst)begin

if(rst) begin
    state <= s0 ;
    end
    else begin
        case(state) 
        s0 : begin
           if(Ta) begin
           state <= s0 ;
           end
           else begin 
           state <= s1 ;
           end
           end
           
         s1 : begin
            state <= s2 ;
            end
            
         s2 : begin
            if(Tb) begin
            state <= s2 ;
            end
            else begin 
            state <= s3 ;
            end
            end
            
         s3 : begin
            state <= s0 ;
            end
         
         default : begin
                 state <= s0 ;
                 end 
            
       endcase
   end
   end

always@(*) begin
case(state) 

s0 : begin
   La = GREEN ;
   Lb = RED   ;
   end
   
s1 : begin
   La = YELLOW ;
   Lb = RED    ;
   end
   
s2 : begin 
   La = RED    ;
   Lb = GREEN ;
   end
   
s3 : begin
   La = RED    ;
   Lb = YELLOW ;
   end
   
default : begin 
        La = RED ;
        Lb = RED   ;
        end
   
   endcase 
   end
          
assign state_out = state;

endmodule
