module traffic_light_controller (
    input clk,              // Clock input
    input rst,              // Synchronous reset
    input sensor,           // Traffic sensor (unused in base design)
    output reg NS_Red,      // North-South Red light
    output reg NS_Yellow,   // North-South Yellow light
    output reg NS_Green,    // North-South Green light
    output reg EW_Red,      // East-West Red light
    output reg EW_Yellow,   // East-West Yellow light
    output reg EW_Green     // East-West Green light
);

    // State encoding
    localparam NS_GREEN  = 2'b00;
    localparam NS_YELLOW = 2'b01;
    localparam EW_GREEN  = 2'b10;
    localparam EW_YELLOW = 2'b11;

    // Timing parameters
    localparam GREEN_TIME  = 30; 
    localparam YELLOW_TIME = 5;  

    reg [1:0] state, next_state;
    reg [5:0] counter; 

    // Sequential logic: State and counter update
    always @(posedge clk) begin
        if (rst) begin
            state <= NS_GREEN; 
            counter <= 0;
        end else begin
            state <= next_state;
            counter <= counter + 1;
        end
    end

    // Combinational logic: Next state and counter reset
    always @(*) begin
        case (state)
            NS_GREEN: begin
                if (counter >= GREEN_TIME - 1) begin
                    next_state = NS_YELLOW;
                    counter = 0; 
                end else next_state = NS_GREEN;
            end
            NS_YELLOW: begin
                if (counter >= YELLOW_TIME - 1) begin
                    next_state = EW_GREEN;
                    counter = 0;
                end else next_state = NS_YELLOW;
            end
            EW_GREEN: begin
                if (counter >= GREEN_TIME - 1) begin
                    next_state = EW_YELLOW;
                    counter = 0;
                end else next_state = EW_GREEN;
            end
            EW_YELLOW: begin
                if (counter >= YELLOW_TIME - 1) begin
                    next_state = NS_GREEN;
                    counter = 0;
                end else next_state = EW_YELLOW;
            end
            default: next_state = NS_GREEN;
        endcase
    end

    // Output logic
    always @(*) begin
        NS_Red = 0; NS_Yellow = 0; NS_Green = 0;
        EW_Red = 0; EW_Yellow = 0; EW_Green = 0;
        case (state)
            NS_GREEN:  begin NS_Green = 1; EW_Red = 1; end
            NS_YELLOW: begin NS_Yellow = 1; EW_Red = 1; end
            EW_GREEN:  begin EW_Green = 1; NS_Red = 1; end
            EW_YELLOW: begin EW_Yellow = 1; NS_Red = 1; end
        endcase
    end
endmodule
