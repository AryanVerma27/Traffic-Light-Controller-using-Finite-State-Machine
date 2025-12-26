module traffic_light_controller_tb;
    reg clk, rst, sensor;
    wire NS_Red, NS_Yellow, NS_Green;
    wire EW_Red, EW_Yellow, EW_Green;

    traffic_light_controller uut (
        .clk(clk), .rst(rst), .sensor(sensor),
        .NS_Red(NS_Red), .NS_Yellow(NS_Yellow), .NS_Green(NS_Green),
        .EW_Red(EW_Red), .EW_Yellow(EW_Yellow), .EW_Green(EW_Green)
    );

    // Clock generation (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 1; sensor = 0;
        #10 rst = 0;
        #400; // Observe transitions
        $finish;
    end

    initial begin
        $dumpfile("traffic_light.vcd");
        $dumpvars(0, traffic_light_controller_tb);
    end
endmodule
