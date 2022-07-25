// file: param.v
`ifndef CPU_PARAM
`define CPU_PARAM

    // syntax: `define <macro name> <parameter>

    // define instruction type
    `define LWINST      4'b0000
    `define JALRINST    4'b0100
    `define SFORMAT     4'b0011
    `define JFORMAT     4'b0101
    `define BFORMAT     4'b0111
    `define NIFORMAT    4'b1100
    `define UFORMAT     4'b1101
    `define RFORMAT     4'b1111
    `define NONETYPE    4'b1010

    // define ALU operation
    `define ADD     4'b0000
    `define SUB     4'b0001
    `define AND     4'b0010
    `define OR      4'b0011
    `define XOR     4'b0100
    `define SLL     4'b0101
    `define SRL     4'b0110
    `define SRA     4'b0111
    `define ALUA    4'b1000
    `define ALUB    4'b1001
    `define NONEOP  4'b1010

    // define ALU source select
    `define ALUA_RD1    1'b0;
    `define ALUA_PC     1'b1;
    `define ALUB_RD2    1'b0;
    `define ALUB_IMM    1'b1;

    // define DATA write back to register
    `define WB_ALU  2'b00
    `define WB_IO   2'b01
    `define WB_PC4  2'b10
    `define WB_NONE 2'b11

    // define status code of each stages
    /**
     * STATE_IDLE:  Indicates that a stage will be set to the init state,
     *              and pass the IDLE signal to the next stage.
     * STATE_PAUS:  A stage will just hold the data and Any stage in the pipeline
     *              can automatically resume from a pause and pass the pause 
     *              signal to the next stage.
     * STATE_WORK:  Stage works.
     */
    `define STATE_IDLE 'b001
    `define STATE_PAUS 'b010
    `define STATE_WORK 'b100

`endif
