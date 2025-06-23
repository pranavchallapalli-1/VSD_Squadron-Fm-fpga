module top (
  output wire led_red  ,
  output wire led_blue , 
  output wire led_green , 
  input wire hw_clk,  
  output wire testwire
);

  wire  int_osc ;
  reg  [27:0] frequency_counter_i;

  assign testwire = frequency_counter_i[5];
 // counter
  always @(posedge int_osc) begin
    frequency_counter_i <= frequency_counter_i + 1'b1;
  end

// internal osscilator
  SB_HFOSC #(.CLKHF_DIV ("0b10")) u_SB_HFOSC ( .CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

//led driver
  SB_RGBA_DRV RGB_DRIVER (
    .RGBLEDEN(1'b1),
    .RGB0PWM (1'b0), 
    .RGB1PWM (1'b0), 
    .RGB2PWM (1'b1), 
    .CURREN  (1'b1),
    .RGB0    (led_red), 
    .RGB1    (led_green),
    .RGB2    (led_blue)
  );
  defparam RGB_DRIVER.RGB0_CURRENT = "0b000001";
  defparam RGB_DRIVER.RGB1_CURRENT = "0b000001";
  defparam RGB_DRIVER.RGB2_CURRENT = "0b000001";

endmodule
