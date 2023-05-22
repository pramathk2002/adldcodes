module car_parking(clk,password,actual_password,front_sensor,back_sensor,car);
input clk;
input[7:0] car;
input[7:0] password;
input[7:0] actual_password;
output reg front_sensor;
output reg back_sensor;
integer k=1;
integer p=0;
always @(posedge clk)
begin
if (car==8'b00000001)
begin 
 front_sensor=k;
#3 $display("front_sensor=%d",k);
#3 $display("enter the password");
 if (password==actual_password )
 begin
 back_sensor=k;
 front_sensor=p;
#3 $display("back_sensor=%d",k);
#3 $display("front_sensor=%d",p);
#3 $display("Car is parked");
 end

 else
 begin
#3 $display("Renter the password");
 end
end
else
begin
#3 $display("Car hasn't arrived at the gate");
end
end
endmodule

module car_parking_tb;
reg clk;
reg[7:0] car;
reg[7:0] password;
reg[7:0] actual_password;
wire front_sensor;
wire back_sensor;
car_parking test(clk,password,actual_password,front_sensor,back_sensor,car);
initial
clk=0;
always #30 clk=~clk;
initial
begin
actual_password=8'b00001111;
password=8'b00001111;
car=8'b00000001;
#70 $finish;
end
endmodule




