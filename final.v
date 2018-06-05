
//
// Verilog description for cell master,
// Sun May 13 12:26:22 2018
//
// LeonardoSpectrum Level 3, 2017a.2
//

module Ram ( input CLK, input WR, input [16:0] Address, input [7:0] Din, input [39:0] Dout );

reg [7:0] VMem [0:131100];

initial begin
	$readmemh("memory.list", VMem);
end

assign Dout = {VMem[Address], VMem[Address + 1], VMem[Address + 2], VMem[Address + 3], VMem[Address + 4]};

always @(CLK or WR)
  if (!CLK && WR)
    VMem[Address] = Din;

endmodule
module master ( rst, clk, filter, start, instr, stride) ;

    input rst ;
    input clk ;
    input filter ;
    input start ;
    input instr ;
    input [1:0]stride ;
    //output [7:0]cacheRegOut ;
    //output [16:0]ramaddr ;
    //input [39:0]ramDataOut ;

    wire enableA, rowCounterRst, accFinish, enableP, aluReset, windRst, aluStart,
         cacheWrite, cacheRegEnable, k, r, pcInImageEnable, pcOutImageEnable,
         dataOut_0__7, dataOut_0__6, dataOut_0__5, dataOut_0__4, dataOut_0__3,
         dataOut_0__2, dataOut_0__1, dataOut_0__0, dataOut_1__7, dataOut_1__6,
         dataOut_1__5, dataOut_1__4, dataOut_1__3, dataOut_1__2, dataOut_1__1,
         dataOut_1__0, dataOut_2__7, dataOut_2__6, dataOut_2__5, dataOut_2__4,
         dataOut_2__3, dataOut_2__2, dataOut_2__1, dataOut_2__0, dataOut_3__7,
         dataOut_3__6, dataOut_3__5, dataOut_3__4, dataOut_3__3, dataOut_3__2,
         dataOut_3__1, dataOut_3__0, dataOut_4__7, dataOut_4__6, dataOut_4__5,
         dataOut_4__4, dataOut_4__3, dataOut_4__2, dataOut_4__1, dataOut_4__0,
         dataOut_5__7, dataOut_5__6, dataOut_5__5, dataOut_5__4, dataOut_5__3,
         dataOut_5__2, dataOut_5__1, dataOut_5__0, dataOut_6__7, dataOut_6__6,
         dataOut_6__5, dataOut_6__4, dataOut_6__3, dataOut_6__2, dataOut_6__1,
         dataOut_6__0, dataOut_7__7, dataOut_7__6, dataOut_7__5, dataOut_7__4,
         dataOut_7__3, dataOut_7__2, dataOut_7__1, dataOut_7__0, dataOut_8__7,
         dataOut_8__6, dataOut_8__5, dataOut_8__4, dataOut_8__3, dataOut_8__2,
         dataOut_8__1, dataOut_8__0, dataOut_9__7, dataOut_9__6, dataOut_9__5,
         dataOut_9__4, dataOut_9__3, dataOut_9__2, dataOut_9__1, dataOut_9__0,
         dataOut_10__7, dataOut_10__6, dataOut_10__5, dataOut_10__4,
         dataOut_10__3, dataOut_10__2, dataOut_10__1, dataOut_10__0,
         dataOut_11__7, dataOut_11__6, dataOut_11__5, dataOut_11__4,
         dataOut_11__3, dataOut_11__2, dataOut_11__1, dataOut_11__0,
         dataOut_12__7, dataOut_12__6, dataOut_12__5, dataOut_12__4,
         dataOut_12__3, dataOut_12__2, dataOut_12__1, dataOut_12__0,
         dataOut_13__7, dataOut_13__6, dataOut_13__5, dataOut_13__4,
         dataOut_13__3, dataOut_13__2, dataOut_13__1, dataOut_13__0,
         dataOut_14__7, dataOut_14__6, dataOut_14__5, dataOut_14__4,
         dataOut_14__3, dataOut_14__2, dataOut_14__1, dataOut_14__0,
         dataOut_15__7, dataOut_15__6, dataOut_15__5, dataOut_15__4,
         dataOut_15__3, dataOut_15__2, dataOut_15__1, dataOut_15__0,
         dataOut_16__7, dataOut_16__6, dataOut_16__5, dataOut_16__4,
         dataOut_16__3, dataOut_16__2, dataOut_16__1, dataOut_16__0,
         dataOut_17__7, dataOut_17__6, dataOut_17__5, dataOut_17__4,
         dataOut_17__3, dataOut_17__2, dataOut_17__1, dataOut_17__0,
         dataOut_18__7, dataOut_18__6, dataOut_18__5, dataOut_18__4,
         dataOut_18__3, dataOut_18__2, dataOut_18__1, dataOut_18__0,
         dataOut_19__7, dataOut_19__6, dataOut_19__5, dataOut_19__4,
         dataOut_19__3, dataOut_19__2, dataOut_19__1, dataOut_19__0,
         dataOut_20__7, dataOut_20__6, dataOut_20__5, dataOut_20__4,
         dataOut_20__3, dataOut_20__2, dataOut_20__1, dataOut_20__0,
         dataOut_21__7, dataOut_21__6, dataOut_21__5, dataOut_21__4,
         dataOut_21__3, dataOut_21__2, dataOut_21__1, dataOut_21__0,
         dataOut_22__7, dataOut_22__6, dataOut_22__5, dataOut_22__4,
         dataOut_22__3, dataOut_22__2, dataOut_22__1, dataOut_22__0,
         dataOut_23__7, dataOut_23__6, dataOut_23__5, dataOut_23__4,
         dataOut_23__3, dataOut_23__2, dataOut_23__1, dataOut_23__0,
         dataOut_24__7, dataOut_24__6, dataOut_24__5, dataOut_24__4, rEnb,
         dataOut_24__3, dataOut_24__2, dataOut_24__1, dataOut_24__0, cacheAdrr_4,
         cacheAdrr_3, cacheAdrr_2, cacheAdrr_1, cacheAdrr_0, aluDataOut_7,
         aluDataOut_6, aluDataOut_5, aluDataOut_4, aluDataOut_3, aluDataOut_2,
         aluDataOut_1, aluDataOut_0, rowCounterOut_2, rowCounterOut_1,
         rowCounterOut_0, windCounterOut_7, windCounterOut_6, windCounterOut_5,
         windCounterOut_4, windCounterOut_3, windCounterOut_2, windCounterOut_1,
         windCounterOut_0, doneCounterOut_7, doneCounterOut_6, doneCounterOut_5,
         doneCounterOut_4, doneCounterOut_3, doneCounterOut_2, doneCounterOut_1,
         doneCounterOut_0,ramaddr_0,ramaddr_1,ramaddr_2,ramaddr_3,ramaddr_4,ramaddr_5,ramaddr_6,ramaddr_7,ramaddr_8,ramaddr_9,ramaddr_10,ramaddr_11,ramaddr_12,ramaddr_13,ramaddr_14,ramaddr_15,ramaddr_16,MemDout_39,MemDout_38,MemDout_37,MemDout_36,MemDout_35,MemDout_34,MemDout_33,MemDout_32,
             MemDout_31,MemDout_30,MemDout_29,MemDout_28,MemDout_27,MemDout_26,MemDout_25,MemDout_24,
             MemDout_23,MemDout_22,MemDout_21,MemDout_20,MemDout_19,MemDout_18,MemDout_17,MemDout_16,
             MemDout_15,MemDout_14,MemDout_13,MemDout_12,MemDout_11,MemDout_10,MemDout_9, MemDout_8,
             MemDout_7,MemDout_6,MemDout_5,MemDout_4,MemDout_3, MemDout_2,MemDout_1,MemDout_0,MemDin_7,MemDin_6,MemDin_5,MemDin_4,
             MemDin_3,MemDin_2,MemDin_1,MemDin_0, done, GND, nx10, nx828, nx830, nx839, nx841, nx843,
         nx845;
    wire [5:0] \$dummy ;



Ram  ram (.CLK (clk), .WR (\$dummy [3]), .Address ({ramaddr_16,ramaddr_15,ramaddr_14,ramaddr_13,
             ramaddr_12,ramaddr_11,ramaddr_10,ramaddr_9,ramaddr_8,
             ramaddr_7,ramaddr_6,ramaddr_5,ramaddr_4,ramaddr_3,
             ramaddr_2,ramaddr_1,ramaddr_0}),
            .Dout ({MemDout_39,MemDout_38,MemDout_37,MemDout_36,MemDout_35,MemDout_34,MemDout_33,MemDout_32,
             MemDout_31,MemDout_30,MemDout_29,MemDout_28,MemDout_27,MemDout_26,MemDout_25,MemDout_24,
             MemDout_23,MemDout_22,MemDout_21,MemDout_20,MemDout_19,MemDout_18,MemDout_17,MemDout_16,
             MemDout_15,MemDout_14,MemDout_13,MemDout_12,MemDout_11,MemDout_10,MemDout_9, MemDout_8,
             MemDout_7,MemDout_6,MemDout_5,MemDout_4,MemDout_3, MemDout_2,MemDout_1,MemDout_0}),.Din ({MemDin_7,MemDin_6,MemDin_5,MemDin_4,
             MemDin_3,MemDin_2,MemDin_1,MemDin_0})) ;

    state finiteState (.clk (clk), .rst (rst), .filter (filter), .accFinish (
          accFinish), .done (done), .instr (instr), .start (start), .stride ({
          stride[1],stride[0]}), .rowCounterRst (rowCounterRst), .windCounterRst (
          \$dummy [0]), .doneCounterRst (\$dummy [1]), .pcInImageEnable (
          pcInImageEnable), .pcOutImageEnable (pcOutImageEnable), .cacheRegEnable (
          cacheRegEnable), .rowCounterEnable (\$dummy [2]), .cacheWrite (
          cacheWrite), .enableA (enableA), .enableP (enableP),.rEnb(rEnb), .k (k), .ramWrite (
          \$dummy [3]), .aluReset (aluReset), .aluStart (aluStart), .pcSrc (
          \$dummy [4]), .readFilter (\$dummy [5]), .rowCounterOut ({
          rowCounterOut_2,rowCounterOut_1,nx845}), .windCounterOut ({
          windCounterOut_7,windCounterOut_6,windCounterOut_5,windCounterOut_4,
          windCounterOut_3,windCounterOut_2,windCounterOut_1,windCounterOut_0})
          , .doneCounterOut ({doneCounterOut_7, doneCounterOut_6, doneCounterOut_5,
         doneCounterOut_4, doneCounterOut_3, doneCounterOut_2, doneCounterOut_1,
         doneCounterOut_0})) ;
    cache_8 Mycache (.clk (clk), .wr (cacheWrite), .address ({cacheAdrr_4,
            cacheAdrr_3,cacheAdrr_2,cacheAdrr_1,cacheAdrr_0}), .data_in ({
           MemDout_7,MemDout_6,MemDout_5,MemDout_4,MemDout_3,MemDout_2,MemDout_1,MemDout_0,
             MemDout_15,MemDout_14,MemDout_13,MemDout_12,MemDout_11,MemDout_10,MemDout_9,MemDout_8,
             MemDout_23,MemDout_22,MemDout_21,MemDout_20,MemDout_19,MemDout_18,MemDout_17,MemDout_16,
             MemDout_31,MemDout_30,MemDout_29,MemDout_28,MemDout_27,MemDout_26,MemDout_25, MemDout_24,
             MemDout_39,MemDout_38,MemDout_37,MemDout_36,MemDout_35, MemDout_34,MemDout_33,MemDout_32}), .dataOut_0__7 (
            dataOut_0__7), .dataOut_0__6 (dataOut_0__6), .dataOut_0__5 (
            dataOut_0__5), .dataOut_0__4 (dataOut_0__4), .dataOut_0__3 (
            dataOut_0__3), .dataOut_0__2 (dataOut_0__2), .dataOut_0__1 (
            dataOut_0__1), .dataOut_0__0 (dataOut_0__0), .dataOut_1__7 (
            dataOut_1__7), .dataOut_1__6 (dataOut_1__6), .dataOut_1__5 (
            dataOut_1__5), .dataOut_1__4 (dataOut_1__4), .dataOut_1__3 (
            dataOut_1__3), .dataOut_1__2 (dataOut_1__2), .dataOut_1__1 (
            dataOut_1__1), .dataOut_1__0 (dataOut_1__0), .dataOut_2__7 (
            dataOut_2__7), .dataOut_2__6 (dataOut_2__6), .dataOut_2__5 (
            dataOut_2__5), .dataOut_2__4 (dataOut_2__4), .dataOut_2__3 (
            dataOut_2__3), .dataOut_2__2 (dataOut_2__2), .dataOut_2__1 (
            dataOut_2__1), .dataOut_2__0 (dataOut_2__0), .dataOut_3__7 (
            dataOut_3__7), .dataOut_3__6 (dataOut_3__6), .dataOut_3__5 (
            dataOut_3__5), .dataOut_3__4 (dataOut_3__4), .dataOut_3__3 (
            dataOut_3__3), .dataOut_3__2 (dataOut_3__2), .dataOut_3__1 (
            dataOut_3__1), .dataOut_3__0 (dataOut_3__0), .dataOut_4__7 (
            dataOut_4__7), .dataOut_4__6 (dataOut_4__6), .dataOut_4__5 (
            dataOut_4__5), .dataOut_4__4 (dataOut_4__4), .dataOut_4__3 (
            dataOut_4__3), .dataOut_4__2 (dataOut_4__2), .dataOut_4__1 (
            dataOut_4__1), .dataOut_4__0 (dataOut_4__0), .dataOut_5__7 (
            dataOut_5__7), .dataOut_5__6 (dataOut_5__6), .dataOut_5__5 (
            dataOut_5__5), .dataOut_5__4 (dataOut_5__4), .dataOut_5__3 (
            dataOut_5__3), .dataOut_5__2 (dataOut_5__2), .dataOut_5__1 (
            dataOut_5__1), .dataOut_5__0 (dataOut_5__0), .dataOut_6__7 (
            dataOut_6__7), .dataOut_6__6 (dataOut_6__6), .dataOut_6__5 (
            dataOut_6__5), .dataOut_6__4 (dataOut_6__4), .dataOut_6__3 (
            dataOut_6__3), .dataOut_6__2 (dataOut_6__2), .dataOut_6__1 (
            dataOut_6__1), .dataOut_6__0 (dataOut_6__0), .dataOut_7__7 (
            dataOut_7__7), .dataOut_7__6 (dataOut_7__6), .dataOut_7__5 (
            dataOut_7__5), .dataOut_7__4 (dataOut_7__4), .dataOut_7__3 (
            dataOut_7__3), .dataOut_7__2 (dataOut_7__2), .dataOut_7__1 (
            dataOut_7__1), .dataOut_7__0 (dataOut_7__0), .dataOut_8__7 (
            dataOut_8__7), .dataOut_8__6 (dataOut_8__6), .dataOut_8__5 (
            dataOut_8__5), .dataOut_8__4 (dataOut_8__4), .dataOut_8__3 (
            dataOut_8__3), .dataOut_8__2 (dataOut_8__2), .dataOut_8__1 (
            dataOut_8__1), .dataOut_8__0 (dataOut_8__0), .dataOut_9__7 (
            dataOut_9__7), .dataOut_9__6 (dataOut_9__6), .dataOut_9__5 (
            dataOut_9__5), .dataOut_9__4 (dataOut_9__4), .dataOut_9__3 (
            dataOut_9__3), .dataOut_9__2 (dataOut_9__2), .dataOut_9__1 (
            dataOut_9__1), .dataOut_9__0 (dataOut_9__0), .dataOut_10__7 (
            dataOut_10__7), .dataOut_10__6 (dataOut_10__6), .dataOut_10__5 (
            dataOut_10__5), .dataOut_10__4 (dataOut_10__4), .dataOut_10__3 (
            dataOut_10__3), .dataOut_10__2 (dataOut_10__2), .dataOut_10__1 (
            dataOut_10__1), .dataOut_10__0 (dataOut_10__0), .dataOut_11__7 (
            dataOut_11__7), .dataOut_11__6 (dataOut_11__6), .dataOut_11__5 (
            dataOut_11__5), .dataOut_11__4 (dataOut_11__4), .dataOut_11__3 (
            dataOut_11__3), .dataOut_11__2 (dataOut_11__2), .dataOut_11__1 (
            dataOut_11__1), .dataOut_11__0 (dataOut_11__0), .dataOut_12__7 (
            dataOut_12__7), .dataOut_12__6 (dataOut_12__6), .dataOut_12__5 (
            dataOut_12__5), .dataOut_12__4 (dataOut_12__4), .dataOut_12__3 (
            dataOut_12__3), .dataOut_12__2 (dataOut_12__2), .dataOut_12__1 (
            dataOut_12__1), .dataOut_12__0 (dataOut_12__0), .dataOut_13__7 (
            dataOut_13__7), .dataOut_13__6 (dataOut_13__6), .dataOut_13__5 (
            dataOut_13__5), .dataOut_13__4 (dataOut_13__4), .dataOut_13__3 (
            dataOut_13__3), .dataOut_13__2 (dataOut_13__2), .dataOut_13__1 (
            dataOut_13__1), .dataOut_13__0 (dataOut_13__0), .dataOut_14__7 (
            dataOut_14__7), .dataOut_14__6 (dataOut_14__6), .dataOut_14__5 (
            dataOut_14__5), .dataOut_14__4 (dataOut_14__4), .dataOut_14__3 (
            dataOut_14__3), .dataOut_14__2 (dataOut_14__2), .dataOut_14__1 (
            dataOut_14__1), .dataOut_14__0 (dataOut_14__0), .dataOut_15__7 (
            dataOut_15__7), .dataOut_15__6 (dataOut_15__6), .dataOut_15__5 (
            dataOut_15__5), .dataOut_15__4 (dataOut_15__4), .dataOut_15__3 (
            dataOut_15__3), .dataOut_15__2 (dataOut_15__2), .dataOut_15__1 (
            dataOut_15__1), .dataOut_15__0 (dataOut_15__0), .dataOut_16__7 (
            dataOut_16__7), .dataOut_16__6 (dataOut_16__6), .dataOut_16__5 (
            dataOut_16__5), .dataOut_16__4 (dataOut_16__4), .dataOut_16__3 (
            dataOut_16__3), .dataOut_16__2 (dataOut_16__2), .dataOut_16__1 (
            dataOut_16__1), .dataOut_16__0 (dataOut_16__0), .dataOut_17__7 (
            dataOut_17__7), .dataOut_17__6 (dataOut_17__6), .dataOut_17__5 (
            dataOut_17__5), .dataOut_17__4 (dataOut_17__4), .dataOut_17__3 (
            dataOut_17__3), .dataOut_17__2 (dataOut_17__2), .dataOut_17__1 (
            dataOut_17__1), .dataOut_17__0 (dataOut_17__0), .dataOut_18__7 (
            dataOut_18__7), .dataOut_18__6 (dataOut_18__6), .dataOut_18__5 (
            dataOut_18__5), .dataOut_18__4 (dataOut_18__4), .dataOut_18__3 (
            dataOut_18__3), .dataOut_18__2 (dataOut_18__2), .dataOut_18__1 (
            dataOut_18__1), .dataOut_18__0 (dataOut_18__0), .dataOut_19__7 (
            dataOut_19__7), .dataOut_19__6 (dataOut_19__6), .dataOut_19__5 (
            dataOut_19__5), .dataOut_19__4 (dataOut_19__4), .dataOut_19__3 (
            dataOut_19__3), .dataOut_19__2 (dataOut_19__2), .dataOut_19__1 (
            dataOut_19__1), .dataOut_19__0 (dataOut_19__0), .dataOut_20__7 (
            dataOut_20__7), .dataOut_20__6 (dataOut_20__6), .dataOut_20__5 (
            dataOut_20__5), .dataOut_20__4 (dataOut_20__4), .dataOut_20__3 (
            dataOut_20__3), .dataOut_20__2 (dataOut_20__2), .dataOut_20__1 (
            dataOut_20__1), .dataOut_20__0 (dataOut_20__0), .dataOut_21__7 (
            dataOut_21__7), .dataOut_21__6 (dataOut_21__6), .dataOut_21__5 (
            dataOut_21__5), .dataOut_21__4 (dataOut_21__4), .dataOut_21__3 (
            dataOut_21__3), .dataOut_21__2 (dataOut_21__2), .dataOut_21__1 (
            dataOut_21__1), .dataOut_21__0 (dataOut_21__0), .dataOut_22__7 (
            dataOut_22__7), .dataOut_22__6 (dataOut_22__6), .dataOut_22__5 (
            dataOut_22__5), .dataOut_22__4 (dataOut_22__4), .dataOut_22__3 (
            dataOut_22__3), .dataOut_22__2 (dataOut_22__2), .dataOut_22__1 (
            dataOut_22__1), .dataOut_22__0 (dataOut_22__0), .dataOut_23__7 (
            dataOut_23__7), .dataOut_23__6 (dataOut_23__6), .dataOut_23__5 (
            dataOut_23__5), .dataOut_23__4 (dataOut_23__4), .dataOut_23__3 (
            dataOut_23__3), .dataOut_23__2 (dataOut_23__2), .dataOut_23__1 (
            dataOut_23__1), .dataOut_23__0 (dataOut_23__0), .dataOut_24__7 (
            dataOut_24__7), .dataOut_24__6 (dataOut_24__6), .dataOut_24__5 (
            dataOut_24__5), .dataOut_24__4 (dataOut_24__4), .dataOut_24__3 (
            dataOut_24__3), .dataOut_24__2 (dataOut_24__2), .dataOut_24__1 (
            dataOut_24__1), .dataOut_24__0 (dataOut_24__0)) ;
    cacheReg cacheReg1 (.Clk (clk), .Rst (rst), .e (cacheRegEnable), .d ({
             aluDataOut_7,aluDataOut_6,aluDataOut_5,aluDataOut_4,aluDataOut_3,
             aluDataOut_2,aluDataOut_1,aluDataOut_0}), .q ({MemDin_7,MemDin_6,MemDin_5,MemDin_4,
             MemDin_3,MemDin_2,MemDin_1,MemDin_0})) ;
    UpdatePc updatePc1 (.K (nx839), .R (nx843), .F (filter), .stride ({stride[1]
             ,stride[0]}), .Read_F (enableA), .CLK (clk), .RST (rst), .PC_en (
             pcInImageEnable), .PC_en2 (pcOutImageEnable), .Filter (filter), .pcSrc (
             pcOutImageEnable), .ramAddr ({ramaddr_16,ramaddr_15,ramaddr_14,ramaddr_13,
             ramaddr_12,ramaddr_11,ramaddr_10,ramaddr_9,ramaddr_8,
             ramaddr_7,ramaddr_6,ramaddr_5,ramaddr_4,ramaddr_3,
             ramaddr_2,ramaddr_1,ramaddr_0})) ;
    Main counters (.CLK (clk), .filter (filter), .rowCounterRst (rowCounterRst)
         , .windCounterRst (windRst), .doneCounterRst (rowCounterRst), .En_Window (
         nx843), .En_Done (nx839), .rowCounterEnable (pcInImageEnable),.stride ({stride[1]
             ,stride[0]}), .cacheAddr (
         {cacheAdrr_4,cacheAdrr_3,cacheAdrr_2,cacheAdrr_1,cacheAdrr_0}), .DoneOut (
         {doneCounterOut_7,doneCounterOut_6,doneCounterOut_5,doneCounterOut_4,
         doneCounterOut_3,doneCounterOut_2,doneCounterOut_1,doneCounterOut_0}),
         .WindowOut ({windCounterOut_7,windCounterOut_6,windCounterOut_5,
         windCounterOut_4,windCounterOut_3,windCounterOut_2,windCounterOut_1,
         windCounterOut_0}), .rowOut ({rowCounterOut_2,rowCounterOut_1,
         rowCounterOut_0})) ;
    accelerator Accelerator1 (.clk (clk), .rst (rst), .enp (enableP), .ena (
                enableA), .rstcnt (aluReset), .enablecnt (aluStart), .inst (
                instr), .f (filter), .input_0__7 (dataOut_0__7), .input_0__6 (
                dataOut_0__6), .input_0__5 (dataOut_0__5), .input_0__4 (
                dataOut_0__4), .input_0__3 (dataOut_0__3), .input_0__2 (
                dataOut_0__2), .input_0__1 (dataOut_0__1), .input_0__0 (
                dataOut_0__0), .input_1__7 (dataOut_1__7), .input_1__6 (
                dataOut_1__6), .input_1__5 (dataOut_1__5), .input_1__4 (
                dataOut_1__4), .input_1__3 (dataOut_1__3), .input_1__2 (
                dataOut_1__2), .input_1__1 (dataOut_1__1), .input_1__0 (
                dataOut_1__0), .input_2__7 (dataOut_2__7), .input_2__6 (
                dataOut_2__6), .input_2__5 (dataOut_2__5), .input_2__4 (
                dataOut_2__4), .input_2__3 (dataOut_2__3), .input_2__2 (
                dataOut_2__2), .input_2__1 (dataOut_2__1), .input_2__0 (
                dataOut_2__0), .input_3__7 (dataOut_3__7), .input_3__6 (
                dataOut_3__6), .input_3__5 (dataOut_3__5), .input_3__4 (
                dataOut_3__4), .input_3__3 (dataOut_3__3), .input_3__2 (
                dataOut_3__2), .input_3__1 (dataOut_3__1), .input_3__0 (
                dataOut_3__0), .input_4__7 (dataOut_4__7), .input_4__6 (
                dataOut_4__6), .input_4__5 (dataOut_4__5), .input_4__4 (
                dataOut_4__4), .input_4__3 (dataOut_4__3), .input_4__2 (
                dataOut_4__2), .input_4__1 (dataOut_4__1), .input_4__0 (
                dataOut_4__0), .input_5__7 (dataOut_5__7), .input_5__6 (
                dataOut_5__6), .input_5__5 (dataOut_5__5), .input_5__4 (
                dataOut_5__4), .input_5__3 (dataOut_5__3), .input_5__2 (
                dataOut_5__2), .input_5__1 (dataOut_5__1), .input_5__0 (
                dataOut_5__0), .input_6__7 (dataOut_6__7), .input_6__6 (
                dataOut_6__6), .input_6__5 (dataOut_6__5), .input_6__4 (
                dataOut_6__4), .input_6__3 (dataOut_6__3), .input_6__2 (
                dataOut_6__2), .input_6__1 (dataOut_6__1), .input_6__0 (
                dataOut_6__0), .input_7__7 (dataOut_7__7), .input_7__6 (
                dataOut_7__6), .input_7__5 (dataOut_7__5), .input_7__4 (
                dataOut_7__4), .input_7__3 (dataOut_7__3), .input_7__2 (
                dataOut_7__2), .input_7__1 (dataOut_7__1), .input_7__0 (
                dataOut_7__0), .input_8__7 (dataOut_8__7), .input_8__6 (
                dataOut_8__6), .input_8__5 (dataOut_8__5), .input_8__4 (
                dataOut_8__4), .input_8__3 (dataOut_8__3), .input_8__2 (
                dataOut_8__2), .input_8__1 (dataOut_8__1), .input_8__0 (
                dataOut_8__0), .input_9__7 (dataOut_9__7), .input_9__6 (
                dataOut_9__6), .input_9__5 (dataOut_9__5), .input_9__4 (
                dataOut_9__4), .input_9__3 (dataOut_9__3), .input_9__2 (
                dataOut_9__2), .input_9__1 (dataOut_9__1), .input_9__0 (
                dataOut_9__0), .input_10__7 (dataOut_10__7), .input_10__6 (
                dataOut_10__6), .input_10__5 (dataOut_10__5), .input_10__4 (
                dataOut_10__4), .input_10__3 (dataOut_10__3), .input_10__2 (
                dataOut_10__2), .input_10__1 (dataOut_10__1), .input_10__0 (
                dataOut_10__0), .input_11__7 (dataOut_11__7), .input_11__6 (
                dataOut_11__6), .input_11__5 (dataOut_11__5), .input_11__4 (
                dataOut_11__4), .input_11__3 (dataOut_11__3), .input_11__2 (
                dataOut_11__2), .input_11__1 (dataOut_11__1), .input_11__0 (
                dataOut_11__0), .input_12__7 (dataOut_12__7), .input_12__6 (
                dataOut_12__6), .input_12__5 (dataOut_12__5), .input_12__4 (
                dataOut_12__4), .input_12__3 (dataOut_12__3), .input_12__2 (
                dataOut_12__2), .input_12__1 (dataOut_12__1), .input_12__0 (
                dataOut_12__0), .input_13__7 (dataOut_13__7), .input_13__6 (
                dataOut_13__6), .input_13__5 (dataOut_13__5), .input_13__4 (
                dataOut_13__4), .input_13__3 (dataOut_13__3), .input_13__2 (
                dataOut_13__2), .input_13__1 (dataOut_13__1), .input_13__0 (
                dataOut_13__0), .input_14__7 (dataOut_14__7), .input_14__6 (
                dataOut_14__6), .input_14__5 (dataOut_14__5), .input_14__4 (
                dataOut_14__4), .input_14__3 (dataOut_14__3), .input_14__2 (
                dataOut_14__2), .input_14__1 (dataOut_14__1), .input_14__0 (
                dataOut_14__0), .input_15__7 (dataOut_15__7), .input_15__6 (
                dataOut_15__6), .input_15__5 (dataOut_15__5), .input_15__4 (
                dataOut_15__4), .input_15__3 (dataOut_15__3), .input_15__2 (
                dataOut_15__2), .input_15__1 (dataOut_15__1), .input_15__0 (
                dataOut_15__0), .input_16__7 (dataOut_16__7), .input_16__6 (
                dataOut_16__6), .input_16__5 (dataOut_16__5), .input_16__4 (
                dataOut_16__4), .input_16__3 (dataOut_16__3), .input_16__2 (
                dataOut_16__2), .input_16__1 (dataOut_16__1), .input_16__0 (
                dataOut_16__0), .input_17__7 (dataOut_17__7), .input_17__6 (
                dataOut_17__6), .input_17__5 (dataOut_17__5), .input_17__4 (
                dataOut_17__4), .input_17__3 (dataOut_17__3), .input_17__2 (
                dataOut_17__2), .input_17__1 (dataOut_17__1), .input_17__0 (
                dataOut_17__0), .input_18__7 (dataOut_18__7), .input_18__6 (
                dataOut_18__6), .input_18__5 (dataOut_18__5), .input_18__4 (
                dataOut_18__4), .input_18__3 (dataOut_18__3), .input_18__2 (
                dataOut_18__2), .input_18__1 (dataOut_18__1), .input_18__0 (
                dataOut_18__0), .input_19__7 (dataOut_19__7), .input_19__6 (
                dataOut_19__6), .input_19__5 (dataOut_19__5), .input_19__4 (
                dataOut_19__4), .input_19__3 (dataOut_19__3), .input_19__2 (
                dataOut_19__2), .input_19__1 (dataOut_19__1), .input_19__0 (
                dataOut_19__0), .input_20__7 (dataOut_20__7), .input_20__6 (
                dataOut_20__6), .input_20__5 (dataOut_20__5), .input_20__4 (
                dataOut_20__4), .input_20__3 (dataOut_20__3), .input_20__2 (
                dataOut_20__2), .input_20__1 (dataOut_20__1), .input_20__0 (
                dataOut_20__0), .input_21__7 (dataOut_21__7), .input_21__6 (
                dataOut_21__6), .input_21__5 (dataOut_21__5), .input_21__4 (
                dataOut_21__4), .input_21__3 (dataOut_21__3), .input_21__2 (
                dataOut_21__2), .input_21__1 (dataOut_21__1), .input_21__0 (
                dataOut_21__0), .input_22__7 (dataOut_22__7), .input_22__6 (
                dataOut_22__6), .input_22__5 (dataOut_22__5), .input_22__4 (
                dataOut_22__4), .input_22__3 (dataOut_22__3), .input_22__2 (
                dataOut_22__2), .input_22__1 (dataOut_22__1), .input_22__0 (
                dataOut_22__0), .input_23__7 (dataOut_23__7), .input_23__6 (
                dataOut_23__6), .input_23__5 (dataOut_23__5), .input_23__4 (
                dataOut_23__4), .input_23__3 (dataOut_23__3), .input_23__2 (
                dataOut_23__2), .input_23__1 (dataOut_23__1), .input_23__0 (
                dataOut_23__0), .input_24__7 (dataOut_24__7), .input_24__6 (
                dataOut_24__6), .input_24__5 (dataOut_24__5), .input_24__4 (
                dataOut_24__4), .input_24__3 (dataOut_24__3), .input_24__2 (
                dataOut_24__2), .input_24__1 (dataOut_24__1), .input_24__0 (
                dataOut_24__0), .result ({aluDataOut_7,aluDataOut_6,aluDataOut_5
                ,aluDataOut_4,aluDataOut_3,aluDataOut_2,aluDataOut_1,
                aluDataOut_0}), .finishacc (accFinish)) ;
    fake_gnd ix809 (.Y (GND)) ;
    nor02_2x ix17 (.Y (done), .A0 (nx828), .A1 (nx830)) ;
    nand04 ix829 (.Y (nx828), .A0 (doneCounterOut_0), .A1 (doneCounterOut_2), .A2 (
           doneCounterOut_3), .A3 (doneCounterOut_4)) ;
    nand04 ix831 (.Y (nx830), .A0 (doneCounterOut_5), .A1 (doneCounterOut_6), .A2 (
           doneCounterOut_7), .A3 (nx10)) ;
    xor2 ix11 (.Y (nx10), .A0 (doneCounterOut_1), .A1 (filter)) ;
    or02 ix1 (.Y (windRst), .A0 (rowCounterRst), .A1 (nx841)) ;
    buf02 ix838 (.Y (nx839), .A (k)) ;
    buf02 ix840 (.Y (nx841), .A (k)) ;
    buf02 ix842 (.Y (nx843), .A (rEnb)) ;
    buf02 ix844 (.Y (nx845), .A (rowCounterOut_0)) ;
endmodule


module accelerator ( clk, rst, enp, ena, rstcnt, enablecnt, inst, f, input_0__7,
                     input_0__6, input_0__5, input_0__4, input_0__3, input_0__2,
                     input_0__1, input_0__0, input_1__7, input_1__6, input_1__5,
                     input_1__4, input_1__3, input_1__2, input_1__1, input_1__0,
                     input_2__7, input_2__6, input_2__5, input_2__4, input_2__3,
                     input_2__2, input_2__1, input_2__0, input_3__7, input_3__6,
                     input_3__5, input_3__4, input_3__3, input_3__2, input_3__1,
                     input_3__0, input_4__7, input_4__6, input_4__5, input_4__4,
                     input_4__3, input_4__2, input_4__1, input_4__0, input_5__7,
                     input_5__6, input_5__5, input_5__4, input_5__3, input_5__2,
                     input_5__1, input_5__0, input_6__7, input_6__6, input_6__5,
                     input_6__4, input_6__3, input_6__2, input_6__1, input_6__0,
                     input_7__7, input_7__6, input_7__5, input_7__4, input_7__3,
                     input_7__2, input_7__1, input_7__0, input_8__7, input_8__6,
                     input_8__5, input_8__4, input_8__3, input_8__2, input_8__1,
                     input_8__0, input_9__7, input_9__6, input_9__5, input_9__4,
                     input_9__3, input_9__2, input_9__1, input_9__0, input_10__7,
                     input_10__6, input_10__5, input_10__4, input_10__3,
                     input_10__2, input_10__1, input_10__0, input_11__7,
                     input_11__6, input_11__5, input_11__4, input_11__3,
                     input_11__2, input_11__1, input_11__0, input_12__7,
                     input_12__6, input_12__5, input_12__4, input_12__3,
                     input_12__2, input_12__1, input_12__0, input_13__7,
                     input_13__6, input_13__5, input_13__4, input_13__3,
                     input_13__2, input_13__1, input_13__0, input_14__7,
                     input_14__6, input_14__5, input_14__4, input_14__3,
                     input_14__2, input_14__1, input_14__0, input_15__7,
                     input_15__6, input_15__5, input_15__4, input_15__3,
                     input_15__2, input_15__1, input_15__0, input_16__7,
                     input_16__6, input_16__5, input_16__4, input_16__3,
                     input_16__2, input_16__1, input_16__0, input_17__7,
                     input_17__6, input_17__5, input_17__4, input_17__3,
                     input_17__2, input_17__1, input_17__0, input_18__7,
                     input_18__6, input_18__5, input_18__4, input_18__3,
                     input_18__2, input_18__1, input_18__0, input_19__7,
                     input_19__6, input_19__5, input_19__4, input_19__3,
                     input_19__2, input_19__1, input_19__0, input_20__7,
                     input_20__6, input_20__5, input_20__4, input_20__3,
                     input_20__2, input_20__1, input_20__0, input_21__7,
                     input_21__6, input_21__5, input_21__4, input_21__3,
                     input_21__2, input_21__1, input_21__0, input_22__7,
                     input_22__6, input_22__5, input_22__4, input_22__3,
                     input_22__2, input_22__1, input_22__0, input_23__7,
                     input_23__6, input_23__5, input_23__4, input_23__3,
                     input_23__2, input_23__1, input_23__0, input_24__7,
                     input_24__6, input_24__5, input_24__4, input_24__3,
                     input_24__2, input_24__1, input_24__0, result, finishacc
                      ) ;

    input clk ;
    input rst ;
    input enp ;
    input ena ;
    input rstcnt ;
    input enablecnt ;
    input inst ;
    input f ;
    input input_0__7 ;
    input input_0__6 ;
    input input_0__5 ;
    input input_0__4 ;
    input input_0__3 ;
    input input_0__2 ;
    input input_0__1 ;
    input input_0__0 ;
    input input_1__7 ;
    input input_1__6 ;
    input input_1__5 ;
    input input_1__4 ;
    input input_1__3 ;
    input input_1__2 ;
    input input_1__1 ;
    input input_1__0 ;
    input input_2__7 ;
    input input_2__6 ;
    input input_2__5 ;
    input input_2__4 ;
    input input_2__3 ;
    input input_2__2 ;
    input input_2__1 ;
    input input_2__0 ;
    input input_3__7 ;
    input input_3__6 ;
    input input_3__5 ;
    input input_3__4 ;
    input input_3__3 ;
    input input_3__2 ;
    input input_3__1 ;
    input input_3__0 ;
    input input_4__7 ;
    input input_4__6 ;
    input input_4__5 ;
    input input_4__4 ;
    input input_4__3 ;
    input input_4__2 ;
    input input_4__1 ;
    input input_4__0 ;
    input input_5__7 ;
    input input_5__6 ;
    input input_5__5 ;
    input input_5__4 ;
    input input_5__3 ;
    input input_5__2 ;
    input input_5__1 ;
    input input_5__0 ;
    input input_6__7 ;
    input input_6__6 ;
    input input_6__5 ;
    input input_6__4 ;
    input input_6__3 ;
    input input_6__2 ;
    input input_6__1 ;
    input input_6__0 ;
    input input_7__7 ;
    input input_7__6 ;
    input input_7__5 ;
    input input_7__4 ;
    input input_7__3 ;
    input input_7__2 ;
    input input_7__1 ;
    input input_7__0 ;
    input input_8__7 ;
    input input_8__6 ;
    input input_8__5 ;
    input input_8__4 ;
    input input_8__3 ;
    input input_8__2 ;
    input input_8__1 ;
    input input_8__0 ;
    input input_9__7 ;
    input input_9__6 ;
    input input_9__5 ;
    input input_9__4 ;
    input input_9__3 ;
    input input_9__2 ;
    input input_9__1 ;
    input input_9__0 ;
    input input_10__7 ;
    input input_10__6 ;
    input input_10__5 ;
    input input_10__4 ;
    input input_10__3 ;
    input input_10__2 ;
    input input_10__1 ;
    input input_10__0 ;
    input input_11__7 ;
    input input_11__6 ;
    input input_11__5 ;
    input input_11__4 ;
    input input_11__3 ;
    input input_11__2 ;
    input input_11__1 ;
    input input_11__0 ;
    input input_12__7 ;
    input input_12__6 ;
    input input_12__5 ;
    input input_12__4 ;
    input input_12__3 ;
    input input_12__2 ;
    input input_12__1 ;
    input input_12__0 ;
    input input_13__7 ;
    input input_13__6 ;
    input input_13__5 ;
    input input_13__4 ;
    input input_13__3 ;
    input input_13__2 ;
    input input_13__1 ;
    input input_13__0 ;
    input input_14__7 ;
    input input_14__6 ;
    input input_14__5 ;
    input input_14__4 ;
    input input_14__3 ;
    input input_14__2 ;
    input input_14__1 ;
    input input_14__0 ;
    input input_15__7 ;
    input input_15__6 ;
    input input_15__5 ;
    input input_15__4 ;
    input input_15__3 ;
    input input_15__2 ;
    input input_15__1 ;
    input input_15__0 ;
    input input_16__7 ;
    input input_16__6 ;
    input input_16__5 ;
    input input_16__4 ;
    input input_16__3 ;
    input input_16__2 ;
    input input_16__1 ;
    input input_16__0 ;
    input input_17__7 ;
    input input_17__6 ;
    input input_17__5 ;
    input input_17__4 ;
    input input_17__3 ;
    input input_17__2 ;
    input input_17__1 ;
    input input_17__0 ;
    input input_18__7 ;
    input input_18__6 ;
    input input_18__5 ;
    input input_18__4 ;
    input input_18__3 ;
    input input_18__2 ;
    input input_18__1 ;
    input input_18__0 ;
    input input_19__7 ;
    input input_19__6 ;
    input input_19__5 ;
    input input_19__4 ;
    input input_19__3 ;
    input input_19__2 ;
    input input_19__1 ;
    input input_19__0 ;
    input input_20__7 ;
    input input_20__6 ;
    input input_20__5 ;
    input input_20__4 ;
    input input_20__3 ;
    input input_20__2 ;
    input input_20__1 ;
    input input_20__0 ;
    input input_21__7 ;
    input input_21__6 ;
    input input_21__5 ;
    input input_21__4 ;
    input input_21__3 ;
    input input_21__2 ;
    input input_21__1 ;
    input input_21__0 ;
    input input_22__7 ;
    input input_22__6 ;
    input input_22__5 ;
    input input_22__4 ;
    input input_22__3 ;
    input input_22__2 ;
    input input_22__1 ;
    input input_22__0 ;
    input input_23__7 ;
    input input_23__6 ;
    input input_23__5 ;
    input input_23__4 ;
    input input_23__3 ;
    input input_23__2 ;
    input input_23__1 ;
    input input_23__0 ;
    input input_24__7 ;
    input input_24__6 ;
    input input_24__5 ;
    input input_24__4 ;
    input input_24__3 ;
    input input_24__2 ;
    input input_24__1 ;
    input input_24__0 ;
    output [7:0]result ;
    output finishacc ;

    wire finishmul, rstcnt1, outcnt1_3, outcnt1_2, outcnt1_1, outcnt1_0,
         outalu_0__12, outalu_0__7, outalu_0__6, outalu_0__5, outalu_0__4,
         outalu_0__3, outalu_0__2, outalu_0__1, outalu_0__0, outalu_1__12,
         outalu_1__7, outalu_1__6, outalu_1__5, outalu_1__4, outalu_1__3,
         outalu_1__2, outalu_1__1, outalu_1__0, outalu_2__12, outalu_2__7,
         outalu_2__6, outalu_2__5, outalu_2__4, outalu_2__3, outalu_2__2,
         outalu_2__1, outalu_2__0, outalu_3__12, outalu_3__7, outalu_3__6,
         outalu_3__5, outalu_3__4, outalu_3__3, outalu_3__2, outalu_3__1,
         outalu_3__0, outalu_4__12, outalu_4__7, outalu_4__6, outalu_4__5,
         outalu_4__4, outalu_4__3, outalu_4__2, outalu_4__1, outalu_4__0,
         outalu_5__12, outalu_5__7, outalu_5__6, outalu_5__5, outalu_5__4,
         outalu_5__3, outalu_5__2, outalu_5__1, outalu_5__0, outalu_6__12,
         outalu_6__7, outalu_6__6, outalu_6__5, outalu_6__4, outalu_6__3,
         outalu_6__2, outalu_6__1, outalu_6__0, outalu_7__12, outalu_7__7,
         outalu_7__6, outalu_7__5, outalu_7__4, outalu_7__3, outalu_7__2,
         outalu_7__1, outalu_7__0, outalu_8__12, outalu_8__7, outalu_8__6,
         outalu_8__5, outalu_8__4, outalu_8__3, outalu_8__2, outalu_8__1,
         outalu_8__0, outalu_9__12, outalu_9__7, outalu_9__6, outalu_9__5,
         outalu_9__4, outalu_9__3, outalu_9__2, outalu_9__1, outalu_9__0,
         outalu_10__12, outalu_10__7, outalu_10__6, outalu_10__5, outalu_10__4,
         outalu_10__3, outalu_10__2, outalu_10__1, outalu_10__0, outalu_11__12,
         outalu_11__7, outalu_11__6, outalu_11__5, outalu_11__4, outalu_11__3,
         outalu_11__2, outalu_11__1, outalu_11__0, outalu_12__12, outalu_12__7,
         outalu_12__6, outalu_12__5, outalu_12__4, outalu_12__3, outalu_12__2,
         outalu_12__1, outalu_12__0, outalu_13__12, outalu_13__7, outalu_13__6,
         outalu_13__5, outalu_13__4, outalu_13__3, outalu_13__2, outalu_13__1,
         outalu_13__0, outalu_14__12, outalu_14__7, outalu_14__6, outalu_14__5,
         outalu_14__4, outalu_14__3, outalu_14__2, outalu_14__1, outalu_14__0,
         outalu_15__12, outalu_15__7, outalu_15__6, outalu_15__5, outalu_15__4,
         outalu_15__3, outalu_15__2, outalu_15__1, outalu_15__0, outalu_16__12,
         outalu_16__7, outalu_16__6, outalu_16__5, outalu_16__4, outalu_16__3,
         outalu_16__2, outalu_16__1, outalu_16__0, outalu_17__12, outalu_17__7,
         outalu_17__6, outalu_17__5, outalu_17__4, outalu_17__3, outalu_17__2,
         outalu_17__1, outalu_17__0, outalu_18__12, outalu_18__7, outalu_18__6,
         outalu_18__5, outalu_18__4, outalu_18__3, outalu_18__2, outalu_18__1,
         outalu_18__0, outalu_19__12, outalu_19__7, outalu_19__6, outalu_19__5,
         outalu_19__4, outalu_19__3, outalu_19__2, outalu_19__1, outalu_19__0,
         outalu_20__12, outalu_20__7, outalu_20__6, outalu_20__5, outalu_20__4,
         outalu_20__3, outalu_20__2, outalu_20__1, outalu_20__0, outalu_21__12,
         outalu_21__7, outalu_21__6, outalu_21__5, outalu_21__4, outalu_21__3,
         outalu_21__2, outalu_21__1, outalu_21__0, outalu_22__12, outalu_22__7,
         outalu_22__6, outalu_22__5, outalu_22__4, outalu_22__3, outalu_22__2,
         outalu_22__1, outalu_22__0, outalu_23__12, outalu_23__7, outalu_23__6,
         outalu_23__5, outalu_23__4, outalu_23__3, outalu_23__2, outalu_23__1,
         outalu_23__0, outalu_24__12, outalu_24__7, outalu_24__6, outalu_24__5,
         outalu_24__4, outalu_24__3, outalu_24__2, outalu_24__1, outalu_24__0,
         nx698, nx8, nx723, nx725, nx727, nx729, nx731, nx737, nx739, nx741,
         nx743, nx745, nx747, nx749, nx751, nx753, nx755, nx757;
    wire [99:0] \$dummy ;




    General_Counter_4 cnt1 (.EN (nx757), .CLK (clk), .RST (rstcnt1), .\Output  (
                      {outcnt1_3,outcnt1_2,outcnt1_1,outcnt1_0})) ;
    alu loop1_0_alu0 (.Clk (clk), .Rst (rst), .ena (nx739), .enp (nx749), .finishmul (
        nx725), .inp ({input_0__7,input_0__6,input_0__5,input_0__4,input_0__3,
        input_0__2,input_0__1,input_0__0}), .res ({outalu_0__12,\$dummy [0],
        \$dummy [1],\$dummy [2],\$dummy [3],outalu_0__7,outalu_0__6,outalu_0__5,
        outalu_0__4,outalu_0__3,outalu_0__2,outalu_0__1,outalu_0__0})) ;
    alu loop1_1_alu0 (.Clk (clk), .Rst (rst), .ena (nx739), .enp (nx749), .finishmul (
        nx725), .inp ({input_1__7,input_1__6,input_1__5,input_1__4,input_1__3,
        input_1__2,input_1__1,input_1__0}), .res ({outalu_1__12,\$dummy [4],
        \$dummy [5],\$dummy [6],\$dummy [7],outalu_1__7,outalu_1__6,outalu_1__5,
        outalu_1__4,outalu_1__3,outalu_1__2,outalu_1__1,outalu_1__0})) ;
    alu loop1_2_alu0 (.Clk (clk), .Rst (rst), .ena (nx739), .enp (nx749), .finishmul (
        nx725), .inp ({input_2__7,input_2__6,input_2__5,input_2__4,input_2__3,
        input_2__2,input_2__1,input_2__0}), .res ({outalu_2__12,\$dummy [8],
        \$dummy [9],\$dummy [10],\$dummy [11],outalu_2__7,outalu_2__6,
        outalu_2__5,outalu_2__4,outalu_2__3,outalu_2__2,outalu_2__1,outalu_2__0}
        )) ;
    alu loop1_3_alu0 (.Clk (clk), .Rst (rst), .ena (nx739), .enp (nx749), .finishmul (
        nx725), .inp ({input_3__7,input_3__6,input_3__5,input_3__4,input_3__3,
        input_3__2,input_3__1,input_3__0}), .res ({outalu_3__12,\$dummy [12],
        \$dummy [13],\$dummy [14],\$dummy [15],outalu_3__7,outalu_3__6,
        outalu_3__5,outalu_3__4,outalu_3__3,outalu_3__2,outalu_3__1,outalu_3__0}
        )) ;
    alu loop1_4_alu0 (.Clk (clk), .Rst (rst), .ena (nx739), .enp (nx749), .finishmul (
        nx725), .inp ({input_4__7,input_4__6,input_4__5,input_4__4,input_4__3,
        input_4__2,input_4__1,input_4__0}), .res ({outalu_4__12,\$dummy [16],
        \$dummy [17],\$dummy [18],\$dummy [19],outalu_4__7,outalu_4__6,
        outalu_4__5,outalu_4__4,outalu_4__3,outalu_4__2,outalu_4__1,outalu_4__0}
        )) ;
    alu loop1_5_alu0 (.Clk (clk), .Rst (rst), .ena (nx739), .enp (nx749), .finishmul (
        nx725), .inp ({input_5__7,input_5__6,input_5__5,input_5__4,input_5__3,
        input_5__2,input_5__1,input_5__0}), .res ({outalu_5__12,\$dummy [20],
        \$dummy [21],\$dummy [22],\$dummy [23],outalu_5__7,outalu_5__6,
        outalu_5__5,outalu_5__4,outalu_5__3,outalu_5__2,outalu_5__1,outalu_5__0}
        )) ;
    alu loop1_6_alu0 (.Clk (clk), .Rst (rst), .ena (nx739), .enp (nx749), .finishmul (
        nx725), .inp ({input_6__7,input_6__6,input_6__5,input_6__4,input_6__3,
        input_6__2,input_6__1,input_6__0}), .res ({outalu_6__12,\$dummy [24],
        \$dummy [25],\$dummy [26],\$dummy [27],outalu_6__7,outalu_6__6,
        outalu_6__5,outalu_6__4,outalu_6__3,outalu_6__2,outalu_6__1,outalu_6__0}
        )) ;
    alu loop1_7_alu0 (.Clk (clk), .Rst (rst), .ena (nx741), .enp (nx751), .finishmul (
        nx727), .inp ({input_7__7,input_7__6,input_7__5,input_7__4,input_7__3,
        input_7__2,input_7__1,input_7__0}), .res ({outalu_7__12,\$dummy [28],
        \$dummy [29],\$dummy [30],\$dummy [31],outalu_7__7,outalu_7__6,
        outalu_7__5,outalu_7__4,outalu_7__3,outalu_7__2,outalu_7__1,outalu_7__0}
        )) ;
    alu loop1_8_alu0 (.Clk (clk), .Rst (rst), .ena (nx741), .enp (nx751), .finishmul (
        nx727), .inp ({input_8__7,input_8__6,input_8__5,input_8__4,input_8__3,
        input_8__2,input_8__1,input_8__0}), .res ({outalu_8__12,\$dummy [32],
        \$dummy [33],\$dummy [34],\$dummy [35],outalu_8__7,outalu_8__6,
        outalu_8__5,outalu_8__4,outalu_8__3,outalu_8__2,outalu_8__1,outalu_8__0}
        )) ;
    alu loop1_9_alu0 (.Clk (clk), .Rst (rst), .ena (nx741), .enp (nx751), .finishmul (
        nx727), .inp ({input_9__7,input_9__6,input_9__5,input_9__4,input_9__3,
        input_9__2,input_9__1,input_9__0}), .res ({outalu_9__12,\$dummy [36],
        \$dummy [37],\$dummy [38],\$dummy [39],outalu_9__7,outalu_9__6,
        outalu_9__5,outalu_9__4,outalu_9__3,outalu_9__2,outalu_9__1,outalu_9__0}
        )) ;
    alu loop1_10_alu0 (.Clk (clk), .Rst (rst), .ena (nx741), .enp (nx751), .finishmul (
        nx727), .inp ({input_10__7,input_10__6,input_10__5,input_10__4,
        input_10__3,input_10__2,input_10__1,input_10__0}), .res ({outalu_10__12,
        \$dummy [40],\$dummy [41],\$dummy [42],\$dummy [43],outalu_10__7,
        outalu_10__6,outalu_10__5,outalu_10__4,outalu_10__3,outalu_10__2,
        outalu_10__1,outalu_10__0})) ;
    alu loop1_11_alu0 (.Clk (clk), .Rst (rst), .ena (nx741), .enp (nx751), .finishmul (
        nx727), .inp ({input_11__7,input_11__6,input_11__5,input_11__4,
        input_11__3,input_11__2,input_11__1,input_11__0}), .res ({outalu_11__12,
        \$dummy [44],\$dummy [45],\$dummy [46],\$dummy [47],outalu_11__7,
        outalu_11__6,outalu_11__5,outalu_11__4,outalu_11__3,outalu_11__2,
        outalu_11__1,outalu_11__0})) ;
    alu loop1_12_alu0 (.Clk (clk), .Rst (rst), .ena (nx741), .enp (nx751), .finishmul (
        nx727), .inp ({input_12__7,input_12__6,input_12__5,input_12__4,
        input_12__3,input_12__2,input_12__1,input_12__0}), .res ({outalu_12__12,
        \$dummy [48],\$dummy [49],\$dummy [50],\$dummy [51],outalu_12__7,
        outalu_12__6,outalu_12__5,outalu_12__4,outalu_12__3,outalu_12__2,
        outalu_12__1,outalu_12__0})) ;
    alu loop1_13_alu0 (.Clk (clk), .Rst (rst), .ena (nx741), .enp (nx751), .finishmul (
        nx727), .inp ({input_13__7,input_13__6,input_13__5,input_13__4,
        input_13__3,input_13__2,input_13__1,input_13__0}), .res ({outalu_13__12,
        \$dummy [52],\$dummy [53],\$dummy [54],\$dummy [55],outalu_13__7,
        outalu_13__6,outalu_13__5,outalu_13__4,outalu_13__3,outalu_13__2,
        outalu_13__1,outalu_13__0})) ;
    alu loop1_14_alu0 (.Clk (clk), .Rst (rst), .ena (nx743), .enp (nx753), .finishmul (
        nx729), .inp ({input_14__7,input_14__6,input_14__5,input_14__4,
        input_14__3,input_14__2,input_14__1,input_14__0}), .res ({outalu_14__12,
        \$dummy [56],\$dummy [57],\$dummy [58],\$dummy [59],outalu_14__7,
        outalu_14__6,outalu_14__5,outalu_14__4,outalu_14__3,outalu_14__2,
        outalu_14__1,outalu_14__0})) ;
    alu loop1_15_alu0 (.Clk (clk), .Rst (rst), .ena (nx743), .enp (nx753), .finishmul (
        nx729), .inp ({input_15__7,input_15__6,input_15__5,input_15__4,
        input_15__3,input_15__2,input_15__1,input_15__0}), .res ({outalu_15__12,
        \$dummy [60],\$dummy [61],\$dummy [62],\$dummy [63],outalu_15__7,
        outalu_15__6,outalu_15__5,outalu_15__4,outalu_15__3,outalu_15__2,
        outalu_15__1,outalu_15__0})) ;
    alu loop1_16_alu0 (.Clk (clk), .Rst (rst), .ena (nx743), .enp (nx753), .finishmul (
        nx729), .inp ({input_16__7,input_16__6,input_16__5,input_16__4,
        input_16__3,input_16__2,input_16__1,input_16__0}), .res ({outalu_16__12,
        \$dummy [64],\$dummy [65],\$dummy [66],\$dummy [67],outalu_16__7,
        outalu_16__6,outalu_16__5,outalu_16__4,outalu_16__3,outalu_16__2,
        outalu_16__1,outalu_16__0})) ;
    alu loop1_17_alu0 (.Clk (clk), .Rst (rst), .ena (nx743), .enp (nx753), .finishmul (
        nx729), .inp ({input_17__7,input_17__6,input_17__5,input_17__4,
        input_17__3,input_17__2,input_17__1,input_17__0}), .res ({outalu_17__12,
        \$dummy [68],\$dummy [69],\$dummy [70],\$dummy [71],outalu_17__7,
        outalu_17__6,outalu_17__5,outalu_17__4,outalu_17__3,outalu_17__2,
        outalu_17__1,outalu_17__0})) ;
    alu loop1_18_alu0 (.Clk (clk), .Rst (rst), .ena (nx743), .enp (nx753), .finishmul (
        nx729), .inp ({input_18__7,input_18__6,input_18__5,input_18__4,
        input_18__3,input_18__2,input_18__1,input_18__0}), .res ({outalu_18__12,
        \$dummy [72],\$dummy [73],\$dummy [74],\$dummy [75],outalu_18__7,
        outalu_18__6,outalu_18__5,outalu_18__4,outalu_18__3,outalu_18__2,
        outalu_18__1,outalu_18__0})) ;
    alu loop1_19_alu0 (.Clk (clk), .Rst (rst), .ena (nx743), .enp (nx753), .finishmul (
        nx729), .inp ({input_19__7,input_19__6,input_19__5,input_19__4,
        input_19__3,input_19__2,input_19__1,input_19__0}), .res ({outalu_19__12,
        \$dummy [76],\$dummy [77],\$dummy [78],\$dummy [79],outalu_19__7,
        outalu_19__6,outalu_19__5,outalu_19__4,outalu_19__3,outalu_19__2,
        outalu_19__1,outalu_19__0})) ;
    alu loop1_20_alu0 (.Clk (clk), .Rst (rst), .ena (nx743), .enp (nx753), .finishmul (
        nx729), .inp ({input_20__7,input_20__6,input_20__5,input_20__4,
        input_20__3,input_20__2,input_20__1,input_20__0}), .res ({outalu_20__12,
        \$dummy [80],\$dummy [81],\$dummy [82],\$dummy [83],outalu_20__7,
        outalu_20__6,outalu_20__5,outalu_20__4,outalu_20__3,outalu_20__2,
        outalu_20__1,outalu_20__0})) ;
    alu loop1_21_alu0 (.Clk (clk), .Rst (rst), .ena (nx745), .enp (nx755), .finishmul (
        nx731), .inp ({input_21__7,input_21__6,input_21__5,input_21__4,
        input_21__3,input_21__2,input_21__1,input_21__0}), .res ({outalu_21__12,
        \$dummy [84],\$dummy [85],\$dummy [86],\$dummy [87],outalu_21__7,
        outalu_21__6,outalu_21__5,outalu_21__4,outalu_21__3,outalu_21__2,
        outalu_21__1,outalu_21__0})) ;
    alu loop1_22_alu0 (.Clk (clk), .Rst (rst), .ena (nx745), .enp (nx755), .finishmul (
        nx731), .inp ({input_22__7,input_22__6,input_22__5,input_22__4,
        input_22__3,input_22__2,input_22__1,input_22__0}), .res ({outalu_22__12,
        \$dummy [88],\$dummy [89],\$dummy [90],\$dummy [91],outalu_22__7,
        outalu_22__6,outalu_22__5,outalu_22__4,outalu_22__3,outalu_22__2,
        outalu_22__1,outalu_22__0})) ;
    alu loop1_23_alu0 (.Clk (clk), .Rst (rst), .ena (nx745), .enp (nx755), .finishmul (
        nx731), .inp ({input_23__7,input_23__6,input_23__5,input_23__4,
        input_23__3,input_23__2,input_23__1,input_23__0}), .res ({outalu_23__12,
        \$dummy [92],\$dummy [93],\$dummy [94],\$dummy [95],outalu_23__7,
        outalu_23__6,outalu_23__5,outalu_23__4,outalu_23__3,outalu_23__2,
        outalu_23__1,outalu_23__0})) ;
    alu loop1_24_alu0 (.Clk (clk), .Rst (rst), .ena (nx745), .enp (nx755), .finishmul (
        nx731), .inp ({input_24__7,input_24__6,input_24__5,input_24__4,
        input_24__3,input_24__2,input_24__1,input_24__0}), .res ({outalu_24__12,
        \$dummy [96],\$dummy [97],\$dummy [98],\$dummy [99],outalu_24__7,
        outalu_24__6,outalu_24__5,outalu_24__4,outalu_24__3,outalu_24__2,
        outalu_24__1,outalu_24__0})) ;
    sumplus sum (.clk (nx698), .inst (inst), .f (f), .input_0__12 (outalu_0__12)
            , .input_0__11 (outalu_0__12), .input_0__10 (outalu_0__12), .input_0__9 (
            outalu_0__12), .input_0__8 (outalu_0__12), .input_0__7 (outalu_0__7)
            , .input_0__6 (outalu_0__6), .input_0__5 (outalu_0__5), .input_0__4 (
            outalu_0__4), .input_0__3 (outalu_0__3), .input_0__2 (outalu_0__2),
            .input_0__1 (outalu_0__1), .input_0__0 (outalu_0__0), .input_1__12 (
            outalu_1__12), .input_1__11 (outalu_1__12), .input_1__10 (
            outalu_1__12), .input_1__9 (outalu_1__12), .input_1__8 (outalu_1__12
            ), .input_1__7 (outalu_1__7), .input_1__6 (outalu_1__6), .input_1__5 (
            outalu_1__5), .input_1__4 (outalu_1__4), .input_1__3 (outalu_1__3),
            .input_1__2 (outalu_1__2), .input_1__1 (outalu_1__1), .input_1__0 (
            outalu_1__0), .input_2__12 (outalu_2__12), .input_2__11 (
            outalu_2__12), .input_2__10 (outalu_2__12), .input_2__9 (
            outalu_2__12), .input_2__8 (outalu_2__12), .input_2__7 (outalu_2__7)
            , .input_2__6 (outalu_2__6), .input_2__5 (outalu_2__5), .input_2__4 (
            outalu_2__4), .input_2__3 (outalu_2__3), .input_2__2 (outalu_2__2),
            .input_2__1 (outalu_2__1), .input_2__0 (outalu_2__0), .input_3__12 (
            outalu_3__12), .input_3__11 (outalu_3__12), .input_3__10 (
            outalu_3__12), .input_3__9 (outalu_3__12), .input_3__8 (outalu_3__12
            ), .input_3__7 (outalu_3__7), .input_3__6 (outalu_3__6), .input_3__5 (
            outalu_3__5), .input_3__4 (outalu_3__4), .input_3__3 (outalu_3__3),
            .input_3__2 (outalu_3__2), .input_3__1 (outalu_3__1), .input_3__0 (
            outalu_3__0), .input_4__12 (outalu_4__12), .input_4__11 (
            outalu_4__12), .input_4__10 (outalu_4__12), .input_4__9 (
            outalu_4__12), .input_4__8 (outalu_4__12), .input_4__7 (outalu_4__7)
            , .input_4__6 (outalu_4__6), .input_4__5 (outalu_4__5), .input_4__4 (
            outalu_4__4), .input_4__3 (outalu_4__3), .input_4__2 (outalu_4__2),
            .input_4__1 (outalu_4__1), .input_4__0 (outalu_4__0), .input_5__12 (
            outalu_5__12), .input_5__11 (outalu_5__12), .input_5__10 (
            outalu_5__12), .input_5__9 (outalu_5__12), .input_5__8 (outalu_5__12
            ), .input_5__7 (outalu_5__7), .input_5__6 (outalu_5__6), .input_5__5 (
            outalu_5__5), .input_5__4 (outalu_5__4), .input_5__3 (outalu_5__3),
            .input_5__2 (outalu_5__2), .input_5__1 (outalu_5__1), .input_5__0 (
            outalu_5__0), .input_6__12 (outalu_6__12), .input_6__11 (
            outalu_6__12), .input_6__10 (outalu_6__12), .input_6__9 (
            outalu_6__12), .input_6__8 (outalu_6__12), .input_6__7 (outalu_6__7)
            , .input_6__6 (outalu_6__6), .input_6__5 (outalu_6__5), .input_6__4 (
            outalu_6__4), .input_6__3 (outalu_6__3), .input_6__2 (outalu_6__2),
            .input_6__1 (outalu_6__1), .input_6__0 (outalu_6__0), .input_7__12 (
            outalu_7__12), .input_7__11 (outalu_7__12), .input_7__10 (
            outalu_7__12), .input_7__9 (outalu_7__12), .input_7__8 (outalu_7__12
            ), .input_7__7 (outalu_7__7), .input_7__6 (outalu_7__6), .input_7__5 (
            outalu_7__5), .input_7__4 (outalu_7__4), .input_7__3 (outalu_7__3),
            .input_7__2 (outalu_7__2), .input_7__1 (outalu_7__1), .input_7__0 (
            outalu_7__0), .input_8__12 (outalu_8__12), .input_8__11 (
            outalu_8__12), .input_8__10 (outalu_8__12), .input_8__9 (
            outalu_8__12), .input_8__8 (outalu_8__12), .input_8__7 (outalu_8__7)
            , .input_8__6 (outalu_8__6), .input_8__5 (outalu_8__5), .input_8__4 (
            outalu_8__4), .input_8__3 (outalu_8__3), .input_8__2 (outalu_8__2),
            .input_8__1 (outalu_8__1), .input_8__0 (outalu_8__0), .input_9__12 (
            outalu_9__12), .input_9__11 (outalu_9__12), .input_9__10 (
            outalu_9__12), .input_9__9 (outalu_9__12), .input_9__8 (outalu_9__12
            ), .input_9__7 (outalu_9__7), .input_9__6 (outalu_9__6), .input_9__5 (
            outalu_9__5), .input_9__4 (outalu_9__4), .input_9__3 (outalu_9__3),
            .input_9__2 (outalu_9__2), .input_9__1 (outalu_9__1), .input_9__0 (
            outalu_9__0), .input_10__12 (outalu_10__12), .input_10__11 (
            outalu_10__12), .input_10__10 (outalu_10__12), .input_10__9 (
            outalu_10__12), .input_10__8 (outalu_10__12), .input_10__7 (
            outalu_10__7), .input_10__6 (outalu_10__6), .input_10__5 (
            outalu_10__5), .input_10__4 (outalu_10__4), .input_10__3 (
            outalu_10__3), .input_10__2 (outalu_10__2), .input_10__1 (
            outalu_10__1), .input_10__0 (outalu_10__0), .input_11__12 (
            outalu_11__12), .input_11__11 (outalu_11__12), .input_11__10 (
            outalu_11__12), .input_11__9 (outalu_11__12), .input_11__8 (
            outalu_11__12), .input_11__7 (outalu_11__7), .input_11__6 (
            outalu_11__6), .input_11__5 (outalu_11__5), .input_11__4 (
            outalu_11__4), .input_11__3 (outalu_11__3), .input_11__2 (
            outalu_11__2), .input_11__1 (outalu_11__1), .input_11__0 (
            outalu_11__0), .input_12__12 (outalu_12__12), .input_12__11 (
            outalu_12__12), .input_12__10 (outalu_12__12), .input_12__9 (
            outalu_12__12), .input_12__8 (outalu_12__12), .input_12__7 (
            outalu_12__7), .input_12__6 (outalu_12__6), .input_12__5 (
            outalu_12__5), .input_12__4 (outalu_12__4), .input_12__3 (
            outalu_12__3), .input_12__2 (outalu_12__2), .input_12__1 (
            outalu_12__1), .input_12__0 (outalu_12__0), .input_13__12 (
            outalu_13__12), .input_13__11 (outalu_13__12), .input_13__10 (
            outalu_13__12), .input_13__9 (outalu_13__12), .input_13__8 (
            outalu_13__12), .input_13__7 (outalu_13__7), .input_13__6 (
            outalu_13__6), .input_13__5 (outalu_13__5), .input_13__4 (
            outalu_13__4), .input_13__3 (outalu_13__3), .input_13__2 (
            outalu_13__2), .input_13__1 (outalu_13__1), .input_13__0 (
            outalu_13__0), .input_14__12 (outalu_14__12), .input_14__11 (
            outalu_14__12), .input_14__10 (outalu_14__12), .input_14__9 (
            outalu_14__12), .input_14__8 (outalu_14__12), .input_14__7 (
            outalu_14__7), .input_14__6 (outalu_14__6), .input_14__5 (
            outalu_14__5), .input_14__4 (outalu_14__4), .input_14__3 (
            outalu_14__3), .input_14__2 (outalu_14__2), .input_14__1 (
            outalu_14__1), .input_14__0 (outalu_14__0), .input_15__12 (
            outalu_15__12), .input_15__11 (outalu_15__12), .input_15__10 (
            outalu_15__12), .input_15__9 (outalu_15__12), .input_15__8 (
            outalu_15__12), .input_15__7 (outalu_15__7), .input_15__6 (
            outalu_15__6), .input_15__5 (outalu_15__5), .input_15__4 (
            outalu_15__4), .input_15__3 (outalu_15__3), .input_15__2 (
            outalu_15__2), .input_15__1 (outalu_15__1), .input_15__0 (
            outalu_15__0), .input_16__12 (outalu_16__12), .input_16__11 (
            outalu_16__12), .input_16__10 (outalu_16__12), .input_16__9 (
            outalu_16__12), .input_16__8 (outalu_16__12), .input_16__7 (
            outalu_16__7), .input_16__6 (outalu_16__6), .input_16__5 (
            outalu_16__5), .input_16__4 (outalu_16__4), .input_16__3 (
            outalu_16__3), .input_16__2 (outalu_16__2), .input_16__1 (
            outalu_16__1), .input_16__0 (outalu_16__0), .input_17__12 (
            outalu_17__12), .input_17__11 (outalu_17__12), .input_17__10 (
            outalu_17__12), .input_17__9 (outalu_17__12), .input_17__8 (
            outalu_17__12), .input_17__7 (outalu_17__7), .input_17__6 (
            outalu_17__6), .input_17__5 (outalu_17__5), .input_17__4 (
            outalu_17__4), .input_17__3 (outalu_17__3), .input_17__2 (
            outalu_17__2), .input_17__1 (outalu_17__1), .input_17__0 (
            outalu_17__0), .input_18__12 (outalu_18__12), .input_18__11 (
            outalu_18__12), .input_18__10 (outalu_18__12), .input_18__9 (
            outalu_18__12), .input_18__8 (outalu_18__12), .input_18__7 (
            outalu_18__7), .input_18__6 (outalu_18__6), .input_18__5 (
            outalu_18__5), .input_18__4 (outalu_18__4), .input_18__3 (
            outalu_18__3), .input_18__2 (outalu_18__2), .input_18__1 (
            outalu_18__1), .input_18__0 (outalu_18__0), .input_19__12 (
            outalu_19__12), .input_19__11 (outalu_19__12), .input_19__10 (
            outalu_19__12), .input_19__9 (outalu_19__12), .input_19__8 (
            outalu_19__12), .input_19__7 (outalu_19__7), .input_19__6 (
            outalu_19__6), .input_19__5 (outalu_19__5), .input_19__4 (
            outalu_19__4), .input_19__3 (outalu_19__3), .input_19__2 (
            outalu_19__2), .input_19__1 (outalu_19__1), .input_19__0 (
            outalu_19__0), .input_20__12 (outalu_20__12), .input_20__11 (
            outalu_20__12), .input_20__10 (outalu_20__12), .input_20__9 (
            outalu_20__12), .input_20__8 (outalu_20__12), .input_20__7 (
            outalu_20__7), .input_20__6 (outalu_20__6), .input_20__5 (
            outalu_20__5), .input_20__4 (outalu_20__4), .input_20__3 (
            outalu_20__3), .input_20__2 (outalu_20__2), .input_20__1 (
            outalu_20__1), .input_20__0 (outalu_20__0), .input_21__12 (
            outalu_21__12), .input_21__11 (outalu_21__12), .input_21__10 (
            outalu_21__12), .input_21__9 (outalu_21__12), .input_21__8 (
            outalu_21__12), .input_21__7 (outalu_21__7), .input_21__6 (
            outalu_21__6), .input_21__5 (outalu_21__5), .input_21__4 (
            outalu_21__4), .input_21__3 (outalu_21__3), .input_21__2 (
            outalu_21__2), .input_21__1 (outalu_21__1), .input_21__0 (
            outalu_21__0), .input_22__12 (outalu_22__12), .input_22__11 (
            outalu_22__12), .input_22__10 (outalu_22__12), .input_22__9 (
            outalu_22__12), .input_22__8 (outalu_22__12), .input_22__7 (
            outalu_22__7), .input_22__6 (outalu_22__6), .input_22__5 (
            outalu_22__5), .input_22__4 (outalu_22__4), .input_22__3 (
            outalu_22__3), .input_22__2 (outalu_22__2), .input_22__1 (
            outalu_22__1), .input_22__0 (outalu_22__0), .input_23__12 (
            outalu_23__12), .input_23__11 (outalu_23__12), .input_23__10 (
            outalu_23__12), .input_23__9 (outalu_23__12), .input_23__8 (
            outalu_23__12), .input_23__7 (outalu_23__7), .input_23__6 (
            outalu_23__6), .input_23__5 (outalu_23__5), .input_23__4 (
            outalu_23__4), .input_23__3 (outalu_23__3), .input_23__2 (
            outalu_23__2), .input_23__1 (outalu_23__1), .input_23__0 (
            outalu_23__0), .input_24__12 (outalu_24__12), .input_24__11 (
            outalu_24__12), .input_24__10 (outalu_24__12), .input_24__9 (
            outalu_24__12), .input_24__8 (outalu_24__12), .input_24__7 (
            outalu_24__7), .input_24__6 (outalu_24__6), .input_24__5 (
            outalu_24__5), .input_24__4 (outalu_24__4), .input_24__3 (
            outalu_24__3), .input_24__2 (outalu_24__2), .input_24__1 (
            outalu_24__1), .input_24__0 (outalu_24__0), .outf ({result[7],
            result[6],result[5],result[4],result[3],result[2],result[1],
            result[0]})) ;
    fake_gnd ix699 (.Y (nx698)) ;
    or02 ix1 (.Y (rstcnt1), .A0 (rst), .A1 (rstcnt)) ;
    ao21 ix13 (.Y (finishmul), .A0 (outcnt1_3), .A1 (nx8), .B0 (inst)) ;
    or03 ix9 (.Y (nx8), .A0 (outcnt1_1), .A1 (outcnt1_2), .A2 (outcnt1_0)) ;
    ao21 ix5 (.Y (finishacc), .A0 (nx757), .A1 (inst), .B0 (outcnt1_3)) ;
    inv01 ix722 (.Y (nx723), .A (finishmul)) ;
    inv02 ix724 (.Y (nx725), .A (nx723)) ;
    inv02 ix726 (.Y (nx727), .A (nx723)) ;
    inv02 ix728 (.Y (nx729), .A (nx723)) ;
    inv02 ix730 (.Y (nx731), .A (nx723)) ;
    inv01 ix736 (.Y (nx737), .A (ena)) ;
    inv01 ix738 (.Y (nx739), .A (nx737)) ;
    inv01 ix740 (.Y (nx741), .A (nx737)) ;
    inv01 ix742 (.Y (nx743), .A (nx737)) ;
    inv01 ix744 (.Y (nx745), .A (nx737)) ;
    inv01 ix746 (.Y (nx747), .A (enp)) ;
    inv01 ix748 (.Y (nx749), .A (nx747)) ;
    inv01 ix750 (.Y (nx751), .A (nx747)) ;
    inv01 ix752 (.Y (nx753), .A (nx747)) ;
    inv01 ix754 (.Y (nx755), .A (nx747)) ;
    buf02 ix756 (.Y (nx757), .A (enablecnt)) ;
endmodule


module sumplus ( clk, inst, f, input_0__12, input_0__11, input_0__10, input_0__9,
                 input_0__8, input_0__7, input_0__6, input_0__5, input_0__4,
                 input_0__3, input_0__2, input_0__1, input_0__0, input_1__12,
                 input_1__11, input_1__10, input_1__9, input_1__8, input_1__7,
                 input_1__6, input_1__5, input_1__4, input_1__3, input_1__2,
                 input_1__1, input_1__0, input_2__12, input_2__11, input_2__10,
                 input_2__9, input_2__8, input_2__7, input_2__6, input_2__5,
                 input_2__4, input_2__3, input_2__2, input_2__1, input_2__0,
                 input_3__12, input_3__11, input_3__10, input_3__9, input_3__8,
                 input_3__7, input_3__6, input_3__5, input_3__4, input_3__3,
                 input_3__2, input_3__1, input_3__0, input_4__12, input_4__11,
                 input_4__10, input_4__9, input_4__8, input_4__7, input_4__6,
                 input_4__5, input_4__4, input_4__3, input_4__2, input_4__1,
                 input_4__0, input_5__12, input_5__11, input_5__10, input_5__9,
                 input_5__8, input_5__7, input_5__6, input_5__5, input_5__4,
                 input_5__3, input_5__2, input_5__1, input_5__0, input_6__12,
                 input_6__11, input_6__10, input_6__9, input_6__8, input_6__7,
                 input_6__6, input_6__5, input_6__4, input_6__3, input_6__2,
                 input_6__1, input_6__0, input_7__12, input_7__11, input_7__10,
                 input_7__9, input_7__8, input_7__7, input_7__6, input_7__5,
                 input_7__4, input_7__3, input_7__2, input_7__1, input_7__0,
                 input_8__12, input_8__11, input_8__10, input_8__9, input_8__8,
                 input_8__7, input_8__6, input_8__5, input_8__4, input_8__3,
                 input_8__2, input_8__1, input_8__0, input_9__12, input_9__11,
                 input_9__10, input_9__9, input_9__8, input_9__7, input_9__6,
                 input_9__5, input_9__4, input_9__3, input_9__2, input_9__1,
                 input_9__0, input_10__12, input_10__11, input_10__10,
                 input_10__9, input_10__8, input_10__7, input_10__6, input_10__5,
                 input_10__4, input_10__3, input_10__2, input_10__1, input_10__0,
                 input_11__12, input_11__11, input_11__10, input_11__9,
                 input_11__8, input_11__7, input_11__6, input_11__5, input_11__4,
                 input_11__3, input_11__2, input_11__1, input_11__0,
                 input_12__12, input_12__11, input_12__10, input_12__9,
                 input_12__8, input_12__7, input_12__6, input_12__5, input_12__4,
                 input_12__3, input_12__2, input_12__1, input_12__0,
                 input_13__12, input_13__11, input_13__10, input_13__9,
                 input_13__8, input_13__7, input_13__6, input_13__5, input_13__4,
                 input_13__3, input_13__2, input_13__1, input_13__0,
                 input_14__12, input_14__11, input_14__10, input_14__9,
                 input_14__8, input_14__7, input_14__6, input_14__5, input_14__4,
                 input_14__3, input_14__2, input_14__1, input_14__0,
                 input_15__12, input_15__11, input_15__10, input_15__9,
                 input_15__8, input_15__7, input_15__6, input_15__5, input_15__4,
                 input_15__3, input_15__2, input_15__1, input_15__0,
                 input_16__12, input_16__11, input_16__10, input_16__9,
                 input_16__8, input_16__7, input_16__6, input_16__5, input_16__4,
                 input_16__3, input_16__2, input_16__1, input_16__0,
                 input_17__12, input_17__11, input_17__10, input_17__9,
                 input_17__8, input_17__7, input_17__6, input_17__5, input_17__4,
                 input_17__3, input_17__2, input_17__1, input_17__0,
                 input_18__12, input_18__11, input_18__10, input_18__9,
                 input_18__8, input_18__7, input_18__6, input_18__5, input_18__4,
                 input_18__3, input_18__2, input_18__1, input_18__0,
                 input_19__12, input_19__11, input_19__10, input_19__9,
                 input_19__8, input_19__7, input_19__6, input_19__5, input_19__4,
                 input_19__3, input_19__2, input_19__1, input_19__0,
                 input_20__12, input_20__11, input_20__10, input_20__9,
                 input_20__8, input_20__7, input_20__6, input_20__5, input_20__4,
                 input_20__3, input_20__2, input_20__1, input_20__0,
                 input_21__12, input_21__11, input_21__10, input_21__9,
                 input_21__8, input_21__7, input_21__6, input_21__5, input_21__4,
                 input_21__3, input_21__2, input_21__1, input_21__0,
                 input_22__12, input_22__11, input_22__10, input_22__9,
                 input_22__8, input_22__7, input_22__6, input_22__5, input_22__4,
                 input_22__3, input_22__2, input_22__1, input_22__0,
                 input_23__12, input_23__11, input_23__10, input_23__9,
                 input_23__8, input_23__7, input_23__6, input_23__5, input_23__4,
                 input_23__3, input_23__2, input_23__1, input_23__0,
                 input_24__12, input_24__11, input_24__10, input_24__9,
                 input_24__8, input_24__7, input_24__6, input_24__5, input_24__4,
                 input_24__3, input_24__2, input_24__1, input_24__0, outf ) ;

    input clk ;
    input inst ;
    input f ;
    input input_0__12 ;
    input input_0__11 ;
    input input_0__10 ;
    input input_0__9 ;
    input input_0__8 ;
    input input_0__7 ;
    input input_0__6 ;
    input input_0__5 ;
    input input_0__4 ;
    input input_0__3 ;
    input input_0__2 ;
    input input_0__1 ;
    input input_0__0 ;
    input input_1__12 ;
    input input_1__11 ;
    input input_1__10 ;
    input input_1__9 ;
    input input_1__8 ;
    input input_1__7 ;
    input input_1__6 ;
    input input_1__5 ;
    input input_1__4 ;
    input input_1__3 ;
    input input_1__2 ;
    input input_1__1 ;
    input input_1__0 ;
    input input_2__12 ;
    input input_2__11 ;
    input input_2__10 ;
    input input_2__9 ;
    input input_2__8 ;
    input input_2__7 ;
    input input_2__6 ;
    input input_2__5 ;
    input input_2__4 ;
    input input_2__3 ;
    input input_2__2 ;
    input input_2__1 ;
    input input_2__0 ;
    input input_3__12 ;
    input input_3__11 ;
    input input_3__10 ;
    input input_3__9 ;
    input input_3__8 ;
    input input_3__7 ;
    input input_3__6 ;
    input input_3__5 ;
    input input_3__4 ;
    input input_3__3 ;
    input input_3__2 ;
    input input_3__1 ;
    input input_3__0 ;
    input input_4__12 ;
    input input_4__11 ;
    input input_4__10 ;
    input input_4__9 ;
    input input_4__8 ;
    input input_4__7 ;
    input input_4__6 ;
    input input_4__5 ;
    input input_4__4 ;
    input input_4__3 ;
    input input_4__2 ;
    input input_4__1 ;
    input input_4__0 ;
    input input_5__12 ;
    input input_5__11 ;
    input input_5__10 ;
    input input_5__9 ;
    input input_5__8 ;
    input input_5__7 ;
    input input_5__6 ;
    input input_5__5 ;
    input input_5__4 ;
    input input_5__3 ;
    input input_5__2 ;
    input input_5__1 ;
    input input_5__0 ;
    input input_6__12 ;
    input input_6__11 ;
    input input_6__10 ;
    input input_6__9 ;
    input input_6__8 ;
    input input_6__7 ;
    input input_6__6 ;
    input input_6__5 ;
    input input_6__4 ;
    input input_6__3 ;
    input input_6__2 ;
    input input_6__1 ;
    input input_6__0 ;
    input input_7__12 ;
    input input_7__11 ;
    input input_7__10 ;
    input input_7__9 ;
    input input_7__8 ;
    input input_7__7 ;
    input input_7__6 ;
    input input_7__5 ;
    input input_7__4 ;
    input input_7__3 ;
    input input_7__2 ;
    input input_7__1 ;
    input input_7__0 ;
    input input_8__12 ;
    input input_8__11 ;
    input input_8__10 ;
    input input_8__9 ;
    input input_8__8 ;
    input input_8__7 ;
    input input_8__6 ;
    input input_8__5 ;
    input input_8__4 ;
    input input_8__3 ;
    input input_8__2 ;
    input input_8__1 ;
    input input_8__0 ;
    input input_9__12 ;
    input input_9__11 ;
    input input_9__10 ;
    input input_9__9 ;
    input input_9__8 ;
    input input_9__7 ;
    input input_9__6 ;
    input input_9__5 ;
    input input_9__4 ;
    input input_9__3 ;
    input input_9__2 ;
    input input_9__1 ;
    input input_9__0 ;
    input input_10__12 ;
    input input_10__11 ;
    input input_10__10 ;
    input input_10__9 ;
    input input_10__8 ;
    input input_10__7 ;
    input input_10__6 ;
    input input_10__5 ;
    input input_10__4 ;
    input input_10__3 ;
    input input_10__2 ;
    input input_10__1 ;
    input input_10__0 ;
    input input_11__12 ;
    input input_11__11 ;
    input input_11__10 ;
    input input_11__9 ;
    input input_11__8 ;
    input input_11__7 ;
    input input_11__6 ;
    input input_11__5 ;
    input input_11__4 ;
    input input_11__3 ;
    input input_11__2 ;
    input input_11__1 ;
    input input_11__0 ;
    input input_12__12 ;
    input input_12__11 ;
    input input_12__10 ;
    input input_12__9 ;
    input input_12__8 ;
    input input_12__7 ;
    input input_12__6 ;
    input input_12__5 ;
    input input_12__4 ;
    input input_12__3 ;
    input input_12__2 ;
    input input_12__1 ;
    input input_12__0 ;
    input input_13__12 ;
    input input_13__11 ;
    input input_13__10 ;
    input input_13__9 ;
    input input_13__8 ;
    input input_13__7 ;
    input input_13__6 ;
    input input_13__5 ;
    input input_13__4 ;
    input input_13__3 ;
    input input_13__2 ;
    input input_13__1 ;
    input input_13__0 ;
    input input_14__12 ;
    input input_14__11 ;
    input input_14__10 ;
    input input_14__9 ;
    input input_14__8 ;
    input input_14__7 ;
    input input_14__6 ;
    input input_14__5 ;
    input input_14__4 ;
    input input_14__3 ;
    input input_14__2 ;
    input input_14__1 ;
    input input_14__0 ;
    input input_15__12 ;
    input input_15__11 ;
    input input_15__10 ;
    input input_15__9 ;
    input input_15__8 ;
    input input_15__7 ;
    input input_15__6 ;
    input input_15__5 ;
    input input_15__4 ;
    input input_15__3 ;
    input input_15__2 ;
    input input_15__1 ;
    input input_15__0 ;
    input input_16__12 ;
    input input_16__11 ;
    input input_16__10 ;
    input input_16__9 ;
    input input_16__8 ;
    input input_16__7 ;
    input input_16__6 ;
    input input_16__5 ;
    input input_16__4 ;
    input input_16__3 ;
    input input_16__2 ;
    input input_16__1 ;
    input input_16__0 ;
    input input_17__12 ;
    input input_17__11 ;
    input input_17__10 ;
    input input_17__9 ;
    input input_17__8 ;
    input input_17__7 ;
    input input_17__6 ;
    input input_17__5 ;
    input input_17__4 ;
    input input_17__3 ;
    input input_17__2 ;
    input input_17__1 ;
    input input_17__0 ;
    input input_18__12 ;
    input input_18__11 ;
    input input_18__10 ;
    input input_18__9 ;
    input input_18__8 ;
    input input_18__7 ;
    input input_18__6 ;
    input input_18__5 ;
    input input_18__4 ;
    input input_18__3 ;
    input input_18__2 ;
    input input_18__1 ;
    input input_18__0 ;
    input input_19__12 ;
    input input_19__11 ;
    input input_19__10 ;
    input input_19__9 ;
    input input_19__8 ;
    input input_19__7 ;
    input input_19__6 ;
    input input_19__5 ;
    input input_19__4 ;
    input input_19__3 ;
    input input_19__2 ;
    input input_19__1 ;
    input input_19__0 ;
    input input_20__12 ;
    input input_20__11 ;
    input input_20__10 ;
    input input_20__9 ;
    input input_20__8 ;
    input input_20__7 ;
    input input_20__6 ;
    input input_20__5 ;
    input input_20__4 ;
    input input_20__3 ;
    input input_20__2 ;
    input input_20__1 ;
    input input_20__0 ;
    input input_21__12 ;
    input input_21__11 ;
    input input_21__10 ;
    input input_21__9 ;
    input input_21__8 ;
    input input_21__7 ;
    input input_21__6 ;
    input input_21__5 ;
    input input_21__4 ;
    input input_21__3 ;
    input input_21__2 ;
    input input_21__1 ;
    input input_21__0 ;
    input input_22__12 ;
    input input_22__11 ;
    input input_22__10 ;
    input input_22__9 ;
    input input_22__8 ;
    input input_22__7 ;
    input input_22__6 ;
    input input_22__5 ;
    input input_22__4 ;
    input input_22__3 ;
    input input_22__2 ;
    input input_22__1 ;
    input input_22__0 ;
    input input_23__12 ;
    input input_23__11 ;
    input input_23__10 ;
    input input_23__9 ;
    input input_23__8 ;
    input input_23__7 ;
    input input_23__6 ;
    input input_23__5 ;
    input input_23__4 ;
    input input_23__3 ;
    input input_23__2 ;
    input input_23__1 ;
    input input_23__0 ;
    input input_24__12 ;
    input input_24__11 ;
    input input_24__10 ;
    input input_24__9 ;
    input input_24__8 ;
    input input_24__7 ;
    input input_24__6 ;
    input input_24__5 ;
    input input_24__4 ;
    input input_24__3 ;
    input input_24__2 ;
    input input_24__1 ;
    input input_24__0 ;
    output [7:0]outf ;

    wire n1_7, n1_6, n1_5, n1_4, n1_3, n1_2, n1_1, n1_0, n2_7, n2_6, n2_5, n2_4,
         n2_3, n2_2, n2_1, n2_0, n3_7, n3_6, n3_5, n4_7, n4_6, n4_5, n4_4, n4_3,
         acc_11__12, acc_11__11, acc_11__10, acc_11__9, acc_11__8, acc_11__7,
         acc_11__6, acc_11__5, acc_11__4, acc_11__3, acc_11__2, acc_11__1,
         acc_11__0, acc_10__12, acc_10__11, acc_10__10, acc_10__9, acc_10__8,
         acc_10__7, acc_10__6, acc_10__5, acc_10__4, acc_10__3, acc_10__2,
         acc_10__1, acc_10__0, acc_9__12, acc_9__11, acc_9__10, acc_9__9,
         acc_9__8, acc_9__7, acc_9__6, acc_9__5, acc_9__4, acc_9__3, acc_9__2,
         acc_9__1, acc_9__0, acc_8__12, acc_8__11, acc_8__10, acc_8__9, acc_8__8,
         acc_8__7, acc_8__6, acc_8__5, acc_8__4, acc_8__3, acc_8__2, acc_8__1,
         acc_8__0, acc_7__12, acc_7__11, acc_7__10, acc_7__9, acc_7__8, acc_7__7,
         acc_7__6, acc_7__5, acc_7__4, acc_7__3, acc_7__2, acc_7__1, acc_7__0,
         acc_6__12, acc_6__11, acc_6__10, acc_6__9, acc_6__8, acc_6__7, acc_6__6,
         acc_6__5, acc_6__4, acc_6__3, acc_6__2, acc_6__1, acc_6__0, acc_5__12,
         acc_5__11, acc_5__10, acc_5__9, acc_5__8, acc_5__7, acc_5__6, acc_5__5,
         acc_5__4, acc_5__3, acc_5__2, acc_5__1, acc_5__0, acc_4__12, acc_4__11,
         acc_4__10, acc_4__9, acc_4__8, acc_4__7, acc_4__6, acc_4__5, acc_4__4,
         acc_4__3, acc_4__2, acc_4__1, acc_4__0, acc_3__12, acc_3__11, acc_3__10,
         acc_3__9, acc_3__8, acc_3__7, acc_3__6, acc_3__5, acc_3__4, acc_3__3,
         acc_3__2, acc_3__1, acc_3__0, acc_2__12, acc_2__11, acc_2__10, acc_2__9,
         acc_2__8, acc_2__7, acc_2__6, acc_2__5, acc_2__4, acc_2__3, acc_2__2,
         acc_2__1, acc_2__0, acc_1__12, acc_1__11, acc_1__10, acc_1__9, acc_1__8,
         acc_1__7, acc_1__6, acc_1__5, acc_1__4, acc_1__3, acc_1__2, acc_1__1,
         acc_1__0, acc_0__12, acc_0__11, acc_0__10, acc_0__9, acc_0__8, acc_0__7,
         acc_0__6, acc_0__5, acc_0__4, acc_0__3, acc_0__2, acc_0__1, acc_0__0,
         acc1_5__12, acc1_5__11, acc1_5__10, acc1_5__9, acc1_5__8, acc1_5__7,
         acc1_5__6, acc1_5__5, acc1_5__4, acc1_5__3, acc1_5__2, acc1_5__1,
         acc1_5__0, acc1_4__12, acc1_4__11, acc1_4__10, acc1_4__9, acc1_4__8,
         acc1_4__7, acc1_4__6, acc1_4__5, acc1_4__4, acc1_4__3, acc1_4__2,
         acc1_4__1, acc1_4__0, acc1_3__12, acc1_3__11, acc1_3__10, acc1_3__9,
         acc1_3__8, acc1_3__7, acc1_3__6, acc1_3__5, acc1_3__4, acc1_3__3,
         acc1_3__2, acc1_3__1, acc1_3__0, acc1_2__12, acc1_2__11, acc1_2__10,
         acc1_2__9, acc1_2__8, acc1_2__7, acc1_2__6, acc1_2__5, acc1_2__4,
         acc1_2__3, acc1_2__2, acc1_2__1, acc1_2__0, acc1_1__12, acc1_1__11,
         acc1_1__10, acc1_1__9, acc1_1__8, acc1_1__7, acc1_1__6, acc1_1__5,
         acc1_1__4, acc1_1__3, acc1_1__2, acc1_1__1, acc1_1__0, acc1_0__12,
         acc1_0__11, acc1_0__10, acc1_0__9, acc1_0__8, acc1_0__7, acc1_0__6,
         acc1_0__5, acc1_0__4, acc1_0__3, acc1_0__2, acc1_0__1, acc1_0__0,
         acc2_2__12, acc2_2__11, acc2_2__10, acc2_2__9, acc2_2__8, acc2_2__7,
         acc2_2__6, acc2_2__5, acc2_2__4, acc2_2__3, acc2_2__2, acc2_2__1,
         acc2_2__0, acc2_1__12, acc2_1__11, acc2_1__10, acc2_1__9, acc2_1__8,
         acc2_1__7, acc2_1__6, acc2_1__5, acc2_1__4, acc2_1__3, acc2_1__2,
         acc2_1__1, acc2_1__0, acc2_0__12, acc2_0__11, acc2_0__10, acc2_0__9,
         acc2_0__8, acc2_0__7, acc2_0__6, acc2_0__5, acc2_0__4, acc2_0__3,
         acc2_0__2, acc2_0__1, acc2_0__0, acc3_1__12, acc3_1__11, acc3_1__10,
         acc3_1__9, acc3_1__8, acc3_1__7, acc3_1__6, acc3_1__5, acc3_1__4,
         acc3_1__3, acc3_1__2, acc3_1__1, acc3_1__0, acc3_0__12, acc3_0__11;



    mux4edit_8 mux (.IN1 ({n1_7,n1_6,n1_5,n1_4,n1_3,n1_2,n1_1,n1_0}), .IN2 ({
               n2_7,n2_6,n2_5,n2_4,n2_3,n2_2,n2_1,n2_0}), .IN3 ({n3_7,n3_6,n3_5,
               n1_7,n1_6,n1_5,n1_4,n1_3}), .IN4 ({n4_7,n4_6,n4_5,n4_4,n4_3,n2_7,
               n2_6,n2_5}), .SEl ({inst,f}), .OUT1 ({outf[7],outf[6],outf[5],
               outf[4],outf[3],outf[2],outf[1],outf[0]})) ;
    MYNADDER_13 a0 (.A ({input_0__12,input_0__11,input_0__10,input_0__9,
                input_0__8,input_0__7,input_0__6,input_0__5,input_0__4,
                input_0__3,input_0__2,input_0__1,input_0__0}), .B ({input_1__12,
                input_1__11,input_1__10,input_1__9,input_1__8,input_1__7,
                input_1__6,input_1__5,input_1__4,input_1__3,input_1__2,
                input_1__1,input_1__0}), .S ({acc_0__12,acc_0__11,acc_0__10,
                acc_0__9,acc_0__8,acc_0__7,acc_0__6,acc_0__5,acc_0__4,acc_0__3,
                acc_0__2,acc_0__1,acc_0__0})) ;
    MYNADDER_13 a1 (.A ({input_2__12,input_2__11,input_2__10,input_2__9,
                input_2__8,input_2__7,input_2__6,input_2__5,input_2__4,
                input_2__3,input_2__2,input_2__1,input_2__0}), .B ({input_5__12,
                input_5__11,input_5__10,input_5__9,input_5__8,input_5__7,
                input_5__6,input_5__5,input_5__4,input_5__3,input_5__2,
                input_5__1,input_5__0}), .S ({acc_1__12,acc_1__11,acc_1__10,
                acc_1__9,acc_1__8,acc_1__7,acc_1__6,acc_1__5,acc_1__4,acc_1__3,
                acc_1__2,acc_1__1,acc_1__0})) ;
    MYNADDER_13 a2 (.A ({input_6__12,input_6__11,input_6__10,input_6__9,
                input_6__8,input_6__7,input_6__6,input_6__5,input_6__4,
                input_6__3,input_6__2,input_6__1,input_6__0}), .B ({input_7__12,
                input_7__11,input_7__10,input_7__9,input_7__8,input_7__7,
                input_7__6,input_7__5,input_7__4,input_7__3,input_7__2,
                input_7__1,input_7__0}), .S ({acc_2__12,acc_2__11,acc_2__10,
                acc_2__9,acc_2__8,acc_2__7,acc_2__6,acc_2__5,acc_2__4,acc_2__3,
                acc_2__2,acc_2__1,acc_2__0})) ;
    MYNADDER_13 a3 (.A ({input_10__12,input_10__11,input_10__10,input_10__9,
                input_10__8,input_10__7,input_10__6,input_10__5,input_10__4,
                input_10__3,input_10__2,input_10__1,input_10__0}), .B ({
                input_11__12,input_11__11,input_11__10,input_11__9,input_11__8,
                input_11__7,input_11__6,input_11__5,input_11__4,input_11__3,
                input_11__2,input_11__1,input_11__0}), .S ({acc_3__12,acc_3__11,
                acc_3__10,acc_3__9,acc_3__8,acc_3__7,acc_3__6,acc_3__5,acc_3__4,
                acc_3__3,acc_3__2,acc_3__1,acc_3__0})) ;
    MYNADDER_13 a4 (.A ({input_3__12,input_3__11,input_3__10,input_3__9,
                input_3__8,input_3__7,input_3__6,input_3__5,input_3__4,
                input_3__3,input_3__2,input_3__1,input_3__0}), .B ({input_4__12,
                input_4__11,input_4__10,input_4__9,input_4__8,input_4__7,
                input_4__6,input_4__5,input_4__4,input_4__3,input_4__2,
                input_4__1,input_4__0}), .S ({acc_4__12,acc_4__11,acc_4__10,
                acc_4__9,acc_4__8,acc_4__7,acc_4__6,acc_4__5,acc_4__4,acc_4__3,
                acc_4__2,acc_4__1,acc_4__0})) ;
    MYNADDER_13 a5 (.A ({input_8__12,input_8__11,input_8__10,input_8__9,
                input_8__8,input_8__7,input_8__6,input_8__5,input_8__4,
                input_8__3,input_8__2,input_8__1,input_8__0}), .B ({input_9__12,
                input_9__11,input_9__10,input_9__9,input_9__8,input_9__7,
                input_9__6,input_9__5,input_9__4,input_9__3,input_9__2,
                input_9__1,input_9__0}), .S ({acc_5__12,acc_5__11,acc_5__10,
                acc_5__9,acc_5__8,acc_5__7,acc_5__6,acc_5__5,acc_5__4,acc_5__3,
                acc_5__2,acc_5__1,acc_5__0})) ;
    MYNADDER_13 a6 (.A ({input_13__12,input_13__11,input_13__10,input_13__9,
                input_13__8,input_13__7,input_13__6,input_13__5,input_13__4,
                input_13__3,input_13__2,input_13__1,input_13__0}), .B ({
                input_14__12,input_14__11,input_14__10,input_14__9,input_14__8,
                input_14__7,input_14__6,input_14__5,input_14__4,input_14__3,
                input_14__2,input_14__1,input_14__0}), .S ({acc_6__12,acc_6__11,
                acc_6__10,acc_6__9,acc_6__8,acc_6__7,acc_6__6,acc_6__5,acc_6__4,
                acc_6__3,acc_6__2,acc_6__1,acc_6__0})) ;
    MYNADDER_13 a7 (.A ({input_15__12,input_15__11,input_15__10,input_15__9,
                input_15__8,input_15__7,input_15__6,input_15__5,input_15__4,
                input_15__3,input_15__2,input_15__1,input_15__0}), .B ({
                input_16__12,input_16__11,input_16__10,input_16__9,input_16__8,
                input_16__7,input_16__6,input_16__5,input_16__4,input_16__3,
                input_16__2,input_16__1,input_16__0}), .S ({acc_7__12,acc_7__11,
                acc_7__10,acc_7__9,acc_7__8,acc_7__7,acc_7__6,acc_7__5,acc_7__4,
                acc_7__3,acc_7__2,acc_7__1,acc_7__0})) ;
    MYNADDER_13 a8 (.A ({input_17__12,input_17__11,input_17__10,input_17__9,
                input_17__8,input_17__7,input_17__6,input_17__5,input_17__4,
                input_17__3,input_17__2,input_17__1,input_17__0}), .B ({
                input_18__12,input_18__11,input_18__10,input_18__9,input_18__8,
                input_18__7,input_18__6,input_18__5,input_18__4,input_18__3,
                input_18__2,input_18__1,input_18__0}), .S ({acc_8__12,acc_8__11,
                acc_8__10,acc_8__9,acc_8__8,acc_8__7,acc_8__6,acc_8__5,acc_8__4,
                acc_8__3,acc_8__2,acc_8__1,acc_8__0})) ;
    MYNADDER_13 a9 (.A ({input_19__12,input_19__11,input_19__10,input_19__9,
                input_19__8,input_19__7,input_19__6,input_19__5,input_19__4,
                input_19__3,input_19__2,input_19__1,input_19__0}), .B ({
                input_20__12,input_20__11,input_20__10,input_20__9,input_20__8,
                input_20__7,input_20__6,input_20__5,input_20__4,input_20__3,
                input_20__2,input_20__1,input_20__0}), .S ({acc_9__12,acc_9__11,
                acc_9__10,acc_9__9,acc_9__8,acc_9__7,acc_9__6,acc_9__5,acc_9__4,
                acc_9__3,acc_9__2,acc_9__1,acc_9__0})) ;
    MYNADDER_13 a10 (.A ({input_21__12,input_21__11,input_21__10,input_21__9,
                input_21__8,input_21__7,input_21__6,input_21__5,input_21__4,
                input_21__3,input_21__2,input_21__1,input_21__0}), .B ({
                input_22__12,input_22__11,input_22__10,input_22__9,input_22__8,
                input_22__7,input_22__6,input_22__5,input_22__4,input_22__3,
                input_22__2,input_22__1,input_22__0}), .S ({acc_10__12,
                acc_10__11,acc_10__10,acc_10__9,acc_10__8,acc_10__7,acc_10__6,
                acc_10__5,acc_10__4,acc_10__3,acc_10__2,acc_10__1,acc_10__0})) ;
    MYNADDER_13 a11 (.A ({input_23__12,input_23__11,input_23__10,input_23__9,
                input_23__8,input_23__7,input_23__6,input_23__5,input_23__4,
                input_23__3,input_23__2,input_23__1,input_23__0}), .B ({
                input_24__12,input_24__11,input_24__10,input_24__9,input_24__8,
                input_24__7,input_24__6,input_24__5,input_24__4,input_24__3,
                input_24__2,input_24__1,input_24__0}), .S ({acc_11__12,
                acc_11__11,acc_11__10,acc_11__9,acc_11__8,acc_11__7,acc_11__6,
                acc_11__5,acc_11__4,acc_11__3,acc_11__2,acc_11__1,acc_11__0})) ;
    MYNADDER_13 a12 (.A ({acc_0__12,acc_0__11,acc_0__10,acc_0__9,acc_0__8,
                acc_0__7,acc_0__6,acc_0__5,acc_0__4,acc_0__3,acc_0__2,acc_0__1,
                acc_0__0}), .B ({acc_1__12,acc_1__11,acc_1__10,acc_1__9,acc_1__8
                ,acc_1__7,acc_1__6,acc_1__5,acc_1__4,acc_1__3,acc_1__2,acc_1__1,
                acc_1__0}), .S ({acc1_0__12,acc1_0__11,acc1_0__10,acc1_0__9,
                acc1_0__8,acc1_0__7,acc1_0__6,acc1_0__5,acc1_0__4,acc1_0__3,
                acc1_0__2,acc1_0__1,acc1_0__0})) ;
    MYNADDER_13 a13 (.A ({acc_2__12,acc_2__11,acc_2__10,acc_2__9,acc_2__8,
                acc_2__7,acc_2__6,acc_2__5,acc_2__4,acc_2__3,acc_2__2,acc_2__1,
                acc_2__0}), .B ({acc_3__12,acc_3__11,acc_3__10,acc_3__9,acc_3__8
                ,acc_3__7,acc_3__6,acc_3__5,acc_3__4,acc_3__3,acc_3__2,acc_3__1,
                acc_3__0}), .S ({acc1_1__12,acc1_1__11,acc1_1__10,acc1_1__9,
                acc1_1__8,acc1_1__7,acc1_1__6,acc1_1__5,acc1_1__4,acc1_1__3,
                acc1_1__2,acc1_1__1,acc1_1__0})) ;
    MYNADDER_13 a14 (.A ({acc_4__12,acc_4__11,acc_4__10,acc_4__9,acc_4__8,
                acc_4__7,acc_4__6,acc_4__5,acc_4__4,acc_4__3,acc_4__2,acc_4__1,
                acc_4__0}), .B ({acc_5__12,acc_5__11,acc_5__10,acc_5__9,acc_5__8
                ,acc_5__7,acc_5__6,acc_5__5,acc_5__4,acc_5__3,acc_5__2,acc_5__1,
                acc_5__0}), .S ({acc1_2__12,acc1_2__11,acc1_2__10,acc1_2__9,
                acc1_2__8,acc1_2__7,acc1_2__6,acc1_2__5,acc1_2__4,acc1_2__3,
                acc1_2__2,acc1_2__1,acc1_2__0})) ;
    MYNADDER_13 a15 (.A ({acc_6__12,acc_6__11,acc_6__10,acc_6__9,acc_6__8,
                acc_6__7,acc_6__6,acc_6__5,acc_6__4,acc_6__3,acc_6__2,acc_6__1,
                acc_6__0}), .B ({acc_7__12,acc_7__11,acc_7__10,acc_7__9,acc_7__8
                ,acc_7__7,acc_7__6,acc_7__5,acc_7__4,acc_7__3,acc_7__2,acc_7__1,
                acc_7__0}), .S ({acc1_3__12,acc1_3__11,acc1_3__10,acc1_3__9,
                acc1_3__8,acc1_3__7,acc1_3__6,acc1_3__5,acc1_3__4,acc1_3__3,
                acc1_3__2,acc1_3__1,acc1_3__0})) ;
    MYNADDER_13 a16 (.A ({acc_8__12,acc_8__11,acc_8__10,acc_8__9,acc_8__8,
                acc_8__7,acc_8__6,acc_8__5,acc_8__4,acc_8__3,acc_8__2,acc_8__1,
                acc_8__0}), .B ({acc_9__12,acc_9__11,acc_9__10,acc_9__9,acc_9__8
                ,acc_9__7,acc_9__6,acc_9__5,acc_9__4,acc_9__3,acc_9__2,acc_9__1,
                acc_9__0}), .S ({acc1_4__12,acc1_4__11,acc1_4__10,acc1_4__9,
                acc1_4__8,acc1_4__7,acc1_4__6,acc1_4__5,acc1_4__4,acc1_4__3,
                acc1_4__2,acc1_4__1,acc1_4__0})) ;
    MYNADDER_13 a17 (.A ({acc_10__12,acc_10__11,acc_10__10,acc_10__9,acc_10__8,
                acc_10__7,acc_10__6,acc_10__5,acc_10__4,acc_10__3,acc_10__2,
                acc_10__1,acc_10__0}), .B ({acc_11__12,acc_11__11,acc_11__10,
                acc_11__9,acc_11__8,acc_11__7,acc_11__6,acc_11__5,acc_11__4,
                acc_11__3,acc_11__2,acc_11__1,acc_11__0}), .S ({acc1_5__12,
                acc1_5__11,acc1_5__10,acc1_5__9,acc1_5__8,acc1_5__7,acc1_5__6,
                acc1_5__5,acc1_5__4,acc1_5__3,acc1_5__2,acc1_5__1,acc1_5__0})) ;
    MYNADDER_13 a18 (.A ({acc1_0__12,acc1_0__11,acc1_0__10,acc1_0__9,acc1_0__8,
                acc1_0__7,acc1_0__6,acc1_0__5,acc1_0__4,acc1_0__3,acc1_0__2,
                acc1_0__1,acc1_0__0}), .B ({acc1_1__12,acc1_1__11,acc1_1__10,
                acc1_1__9,acc1_1__8,acc1_1__7,acc1_1__6,acc1_1__5,acc1_1__4,
                acc1_1__3,acc1_1__2,acc1_1__1,acc1_1__0}), .S ({acc2_0__12,
                acc2_0__11,acc2_0__10,acc2_0__9,acc2_0__8,acc2_0__7,acc2_0__6,
                acc2_0__5,acc2_0__4,acc2_0__3,acc2_0__2,acc2_0__1,acc2_0__0})) ;
    MYNADDER_13 a19 (.A ({acc1_2__12,acc1_2__11,acc1_2__10,acc1_2__9,acc1_2__8,
                acc1_2__7,acc1_2__6,acc1_2__5,acc1_2__4,acc1_2__3,acc1_2__2,
                acc1_2__1,acc1_2__0}), .B ({acc1_3__12,acc1_3__11,acc1_3__10,
                acc1_3__9,acc1_3__8,acc1_3__7,acc1_3__6,acc1_3__5,acc1_3__4,
                acc1_3__3,acc1_3__2,acc1_3__1,acc1_3__0}), .S ({acc2_1__12,
                acc2_1__11,acc2_1__10,acc2_1__9,acc2_1__8,acc2_1__7,acc2_1__6,
                acc2_1__5,acc2_1__4,acc2_1__3,acc2_1__2,acc2_1__1,acc2_1__0})) ;
    MYNADDER_13 a20 (.A ({acc1_4__12,acc1_4__11,acc1_4__10,acc1_4__9,acc1_4__8,
                acc1_4__7,acc1_4__6,acc1_4__5,acc1_4__4,acc1_4__3,acc1_4__2,
                acc1_4__1,acc1_4__0}), .B ({acc1_5__12,acc1_5__11,acc1_5__10,
                acc1_5__9,acc1_5__8,acc1_5__7,acc1_5__6,acc1_5__5,acc1_5__4,
                acc1_5__3,acc1_5__2,acc1_5__1,acc1_5__0}), .S ({acc2_2__12,
                acc2_2__11,acc2_2__10,acc2_2__9,acc2_2__8,acc2_2__7,acc2_2__6,
                acc2_2__5,acc2_2__4,acc2_2__3,acc2_2__2,acc2_2__1,acc2_2__0})) ;
    MYNADDER_13 a21 (.A ({acc2_0__12,acc2_0__11,acc2_0__10,acc2_0__9,acc2_0__8,
                acc2_0__7,acc2_0__6,acc2_0__5,acc2_0__4,acc2_0__3,acc2_0__2,
                acc2_0__1,acc2_0__0}), .B ({input_12__12,input_12__11,
                input_12__10,input_12__9,input_12__8,input_12__7,input_12__6,
                input_12__5,input_12__4,input_12__3,input_12__2,input_12__1,
                input_12__0}), .S ({acc3_0__12,acc3_0__11,n3_7,n3_6,n3_5,n1_7,
                n1_6,n1_5,n1_4,n1_3,n1_2,n1_1,n1_0})) ;
    MYNADDER_13 a22 (.A ({acc2_1__12,acc2_1__11,acc2_1__10,acc2_1__9,acc2_1__8,
                acc2_1__7,acc2_1__6,acc2_1__5,acc2_1__4,acc2_1__3,acc2_1__2,
                acc2_1__1,acc2_1__0}), .B ({acc2_2__12,acc2_2__11,acc2_2__10,
                acc2_2__9,acc2_2__8,acc2_2__7,acc2_2__6,acc2_2__5,acc2_2__4,
                acc2_2__3,acc2_2__2,acc2_2__1,acc2_2__0}), .S ({acc3_1__12,
                acc3_1__11,acc3_1__10,acc3_1__9,acc3_1__8,acc3_1__7,acc3_1__6,
                acc3_1__5,acc3_1__4,acc3_1__3,acc3_1__2,acc3_1__1,acc3_1__0})) ;
    MYNADDER_13 a23 (.A ({acc3_0__12,acc3_0__11,n3_7,n3_6,n3_5,n1_7,n1_6,n1_5,
                n1_4,n1_3,n1_2,n1_1,n1_0}), .B ({acc3_1__12,acc3_1__11,
                acc3_1__10,acc3_1__9,acc3_1__8,acc3_1__7,acc3_1__6,acc3_1__5,
                acc3_1__4,acc3_1__3,acc3_1__2,acc3_1__1,acc3_1__0}), .S ({n4_7,
                n4_6,n4_5,n4_4,n4_3,n2_7,n2_6,n2_5,n2_4,n2_3,n2_2,n2_1,n2_0})) ;
endmodule


module MYNADDER_13 ( A, B, S ) ;

    input [12:0]A ;
    input [12:0]B ;
    output [12:0]S ;

    wire TEMP_11, TEMP_10, TEMP_9, TEMP_8, TEMP_7, TEMP_6, TEMP_5, TEMP_4,
         TEMP_3, TEMP_2, TEMP_1, TEMP_0, cin;
    wire [0:0] \$dummy ;




    MYADDER ADD1 (.A (A[0]), .B (B[0]), .CIN (cin), .COUT (TEMP_0), .S (S[0])) ;
    MYADDER loop1_1_ADD (.A (A[1]), .B (B[1]), .CIN (TEMP_0), .COUT (TEMP_1), .S (
            S[1])) ;
    MYADDER loop1_2_ADD (.A (A[2]), .B (B[2]), .CIN (TEMP_1), .COUT (TEMP_2), .S (
            S[2])) ;
    MYADDER loop1_3_ADD (.A (A[3]), .B (B[3]), .CIN (TEMP_2), .COUT (TEMP_3), .S (
            S[3])) ;
    MYADDER loop1_4_ADD (.A (A[4]), .B (B[4]), .CIN (TEMP_3), .COUT (TEMP_4), .S (
            S[4])) ;
    MYADDER loop1_5_ADD (.A (A[5]), .B (B[5]), .CIN (TEMP_4), .COUT (TEMP_5), .S (
            S[5])) ;
    MYADDER loop1_6_ADD (.A (A[6]), .B (B[6]), .CIN (TEMP_5), .COUT (TEMP_6), .S (
            S[6])) ;
    MYADDER loop1_7_ADD (.A (A[7]), .B (B[7]), .CIN (TEMP_6), .COUT (TEMP_7), .S (
            S[7])) ;
    MYADDER loop1_8_ADD (.A (A[8]), .B (B[8]), .CIN (TEMP_7), .COUT (TEMP_8), .S (
            S[8])) ;
    MYADDER loop1_9_ADD (.A (A[9]), .B (B[9]), .CIN (TEMP_8), .COUT (TEMP_9), .S (
            S[9])) ;
    MYADDER loop1_10_ADD (.A (A[10]), .B (B[10]), .CIN (TEMP_9), .COUT (TEMP_10)
            , .S (S[10])) ;
    MYADDER loop1_11_ADD (.A (A[11]), .B (B[11]), .CIN (TEMP_10), .COUT (TEMP_11
            ), .S (S[11])) ;
    MYADDER loop1_12_ADD (.A (A[12]), .B (B[12]), .CIN (TEMP_11), .COUT (
            \$dummy [0]), .S (S[12])) ;
    fake_gnd ix100 (.Y (cin)) ;
endmodule


module mux4edit_8 ( IN1, IN2, IN3, IN4, SEl, OUT1 ) ;

    input [7:0]IN1 ;
    input [7:0]IN2 ;
    input [7:0]IN3 ;
    input [7:0]IN4 ;
    input [1:0]SEl ;
    output [7:0]OUT1 ;

    wire nx2, nx8, nx18, nx22, nx89, nx95, nx107, nx109, nx113, nx115, nx119,
         nx121, nx125, nx127, nx130, nx132, nx135, nx137, nx140, nx142, nx149,
         nx151, nx153, nx155;



    nand02 ix29 (.Y (OUT1[0]), .A0 (nx89), .A1 (nx95)) ;
    aoi22 ix90 (.Y (nx89), .A0 (IN1[0]), .A1 (nx18), .B0 (IN4[0]), .B1 (nx22)) ;
    nor02_2x ix19 (.Y (nx18), .A0 (SEl[1]), .A1 (SEl[0])) ;
    and02 ix23 (.Y (nx22), .A0 (SEl[1]), .A1 (SEl[0])) ;
    aoi22 ix96 (.Y (nx95), .A0 (IN2[0]), .A1 (nx153), .B0 (IN3[0]), .B1 (nx149)
          ) ;
    nand02 ix43 (.Y (OUT1[1]), .A0 (nx107), .A1 (nx109)) ;
    aoi22 ix108 (.Y (nx107), .A0 (IN1[1]), .A1 (nx18), .B0 (IN4[1]), .B1 (nx22)
          ) ;
    aoi22 ix110 (.Y (nx109), .A0 (IN2[1]), .A1 (nx153), .B0 (IN3[1]), .B1 (nx149
          )) ;
    nand02 ix57 (.Y (OUT1[2]), .A0 (nx113), .A1 (nx115)) ;
    aoi22 ix114 (.Y (nx113), .A0 (IN1[2]), .A1 (nx18), .B0 (IN4[2]), .B1 (nx22)
          ) ;
    aoi22 ix116 (.Y (nx115), .A0 (IN2[2]), .A1 (nx153), .B0 (IN3[2]), .B1 (nx149
          )) ;
    nand02 ix71 (.Y (OUT1[3]), .A0 (nx119), .A1 (nx121)) ;
    aoi22 ix120 (.Y (nx119), .A0 (IN1[3]), .A1 (nx18), .B0 (IN4[3]), .B1 (nx22)
          ) ;
    aoi22 ix122 (.Y (nx121), .A0 (IN2[3]), .A1 (nx153), .B0 (IN3[3]), .B1 (nx149
          )) ;
    nand02 ix85 (.Y (OUT1[4]), .A0 (nx125), .A1 (nx127)) ;
    aoi22 ix126 (.Y (nx125), .A0 (IN1[4]), .A1 (nx18), .B0 (IN4[4]), .B1 (nx22)
          ) ;
    aoi22 ix128 (.Y (nx127), .A0 (IN2[4]), .A1 (nx153), .B0 (IN3[4]), .B1 (nx149
          )) ;
    nand02 ix99 (.Y (OUT1[5]), .A0 (nx130), .A1 (nx132)) ;
    aoi22 ix131 (.Y (nx130), .A0 (IN1[5]), .A1 (nx18), .B0 (IN4[5]), .B1 (nx22)
          ) ;
    aoi22 ix133 (.Y (nx132), .A0 (IN2[5]), .A1 (nx153), .B0 (IN3[5]), .B1 (nx149
          )) ;
    nand02 ix113 (.Y (OUT1[6]), .A0 (nx135), .A1 (nx137)) ;
    aoi22 ix136 (.Y (nx135), .A0 (IN1[6]), .A1 (nx18), .B0 (IN4[6]), .B1 (nx22)
          ) ;
    aoi22 ix138 (.Y (nx137), .A0 (IN2[6]), .A1 (nx153), .B0 (IN3[6]), .B1 (nx149
          )) ;
    nand02 ix127 (.Y (OUT1[7]), .A0 (nx140), .A1 (nx142)) ;
    aoi22 ix141 (.Y (nx140), .A0 (IN1[7]), .A1 (nx18), .B0 (IN4[7]), .B1 (nx22)
          ) ;
    aoi22 ix143 (.Y (nx142), .A0 (IN2[7]), .A1 (nx155), .B0 (IN3[7]), .B1 (nx151
          )) ;
    nor02ii ix9 (.Y (nx8), .A0 (SEl[1]), .A1 (SEl[0])) ;
    nor02ii ix3 (.Y (nx2), .A0 (SEl[0]), .A1 (SEl[1])) ;
    buf02 ix148 (.Y (nx149), .A (nx2)) ;
    buf02 ix150 (.Y (nx151), .A (nx2)) ;
    buf02 ix152 (.Y (nx153), .A (nx8)) ;
    buf02 ix154 (.Y (nx155), .A (nx8)) ;
endmodule


module alu ( Clk, Rst, ena, enp, finishmul, inp, res ) ;

    input Clk ;
    input Rst ;
    input ena ;
    input enp ;
    input finishmul ;
    input [7:0]inp ;
    output [12:0]res ;

    wire outa_16, outa_15, outa_14, outa_13, outa_12, outa_11, outa_10, outa_9,
         outa_8, outa_7, outa_6, outa_5, outa_4, outa_3, outa_2, outa_1, outa_0,
         outp_16, outp_15, outp_14, outp_13, outp_12, outp_11, outp_10, outp_9,
         outp_0, s_16, s_15, s_14, s_13, s_12, s_11, s_10, s_9, invt_7, invt_6,
         invt_5, invt_4, invt_3, invt_2, invt_1, invt_0, enablep, outmux_16,
         outmux_15, outmux_14, outmux_13, outmux_12, outmux_11, outmux_10,
         outmux_9, outmux_8, outmux_7, outmux_6, outmux_5, outmux_4, outmux_3,
         outmux_2, outmux_1, outadder_16, outadder_15, outadder_14, outadder_13,
         outadder_12, outadder_11, outadder_10, outadder_9, outadder_8,
         outadder_7, outadder_6, outadder_5, outadder_4, outadder_3, outadder_2,
         outadder_1, outadder_0, inpadderB_16, inpadderB_15, inpadderB_14,
         inpadderB_13, inpadderB_12, inpadderB_11, inpadderB_10, inpadderB_9,
         inpadderB_8, inpadderB_7, inpadderB_6, inpadderB_5, inpadderB_4,
         inpadderB_3, inpadderB_2, inpadderB_1, inpadderB_0, inppfinal_15,
         inppfinal_14, inppfinal_13, inppfinal_12, inppfinal_11, inppfinal_10,
         inppfinal_9, inppfinal_8, inppfinal_7, inppfinal_6, inppfinal_5,
         inppfinal_4, inppfinal_3, inppfinal_2, inppfinal_1, inppfinal_0, PWR,
         nx34, nx408, nx443, nx445, nx447, nx449, nx451, nx453;
    wire [0:0] \$dummy ;




    assign res[11] = res[12] ;
    assign res[10] = res[12] ;
    assign res[9] = res[12] ;
    assign res[8] = res[12] ;
    my_nDFFfalling_17 p (.Clk (Clk), .Rst (Rst), .EN (enablep), .d ({
                      inppfinal_15,inppfinal_15,inppfinal_14,inppfinal_13,
                      inppfinal_12,inppfinal_11,inppfinal_10,inppfinal_9,
                      inppfinal_8,inppfinal_7,inppfinal_6,inppfinal_5,
                      inppfinal_4,inppfinal_3,inppfinal_2,inppfinal_1,
                      inppfinal_0}), .q ({outp_16,outp_15,outp_14,outp_13,
                      outp_12,outp_11,outp_10,outp_9,res[7],res[6],res[5],res[4]
                      ,res[3],res[2],res[1],res[0],outp_0})) ;
    my_nDFFfalling_17 a (.Clk (Clk), .Rst (Rst), .EN (ena), .d ({inp[7],inp[6],
                      inp[5],inp[4],inp[3],inp[2],inp[1],inp[0],res[12],res[12],
                      res[12],res[12],res[12],res[12],res[12],res[12],res[12]})
                      , .q ({outa_16,outa_15,outa_14,outa_13,outa_12,outa_11,
                      outa_10,outa_9,outa_8,outa_7,outa_6,outa_5,outa_4,outa_3,
                      outa_2,outa_1,outa_0})) ;
    MYNADDER_8 adder2 (.A ({res[12],res[12],res[12],res[12],res[12],res[12],
               res[12],PWR}), .B ({invt_7,invt_6,invt_5,invt_4,invt_3,invt_2,
               invt_1,invt_0}), .S ({s_16,s_15,s_14,s_13,s_12,s_11,s_10,s_9})) ;
    MYNADDER_17 adder1 (.A ({outp_16,outp_15,outp_14,outp_13,outp_12,outp_11,
                outp_10,outp_9,res[7],res[6],res[5],res[4],res[3],res[2],res[1],
                res[0],outp_0}), .B ({inpadderB_16,inpadderB_15,inpadderB_14,
                inpadderB_13,inpadderB_12,inpadderB_11,inpadderB_10,inpadderB_9,
                inpadderB_8,inpadderB_7,inpadderB_6,inpadderB_5,inpadderB_4,
                inpadderB_3,inpadderB_2,inpadderB_1,inpadderB_0}), .S ({
                outadder_16,outadder_15,outadder_14,outadder_13,outadder_12,
                outadder_11,outadder_10,outadder_9,outadder_8,outadder_7,
                outadder_6,outadder_5,outadder_4,outadder_3,outadder_2,
                outadder_1,outadder_0})) ;
    mux_4 mux (.IN1 ({outp_16,outp_15,outp_14,outp_13,outp_12,outp_11,outp_10,
          outp_9,res[7],res[6],res[5],res[4],res[3],res[2],res[1],res[0],outp_0}
          ), .IN2 ({outadder_16,outadder_15,outadder_14,outadder_13,outadder_12,
          outadder_11,outadder_10,outadder_9,outadder_8,outadder_7,outadder_6,
          outadder_5,outadder_4,outadder_3,outadder_2,outadder_1,outadder_0}), .SEl (
          {outp_0,res[0]}), .OUT1 ({outmux_16,outmux_15,outmux_14,outmux_13,
          outmux_12,outmux_11,outmux_10,outmux_9,outmux_8,outmux_7,outmux_6,
          outmux_5,outmux_4,outmux_3,outmux_2,outmux_1,\$dummy [0]})) ;
    fake_vcc ix317 (.Y (PWR)) ;
    fake_gnd ix315 (.Y (res[12])) ;
    nor02ii ix3 (.Y (inppfinal_0), .A0 (nx443), .A1 (outmux_1)) ;
    mux21_ni ix145 (.Y (inppfinal_1), .A0 (outmux_2), .A1 (inp[0]), .S0 (nx443)
             ) ;
    mux21_ni ix153 (.Y (inppfinal_2), .A0 (outmux_3), .A1 (inp[1]), .S0 (nx443)
             ) ;
    mux21_ni ix161 (.Y (inppfinal_3), .A0 (outmux_4), .A1 (inp[2]), .S0 (nx443)
             ) ;
    mux21_ni ix169 (.Y (inppfinal_4), .A0 (outmux_5), .A1 (inp[3]), .S0 (nx443)
             ) ;
    mux21_ni ix177 (.Y (inppfinal_5), .A0 (outmux_6), .A1 (inp[4]), .S0 (nx443)
             ) ;
    mux21_ni ix185 (.Y (inppfinal_6), .A0 (outmux_7), .A1 (inp[5]), .S0 (nx443)
             ) ;
    mux21_ni ix193 (.Y (inppfinal_7), .A0 (outmux_8), .A1 (inp[6]), .S0 (nx445)
             ) ;
    mux21_ni ix201 (.Y (inppfinal_8), .A0 (outmux_9), .A1 (inp[7]), .S0 (nx445)
             ) ;
    nor02ii ix7 (.Y (inppfinal_9), .A0 (nx445), .A1 (outmux_10)) ;
    nor02ii ix11 (.Y (inppfinal_10), .A0 (nx445), .A1 (outmux_11)) ;
    nor02ii ix15 (.Y (inppfinal_11), .A0 (nx445), .A1 (outmux_12)) ;
    nor02ii ix19 (.Y (inppfinal_12), .A0 (nx445), .A1 (outmux_13)) ;
    nor02ii ix23 (.Y (inppfinal_13), .A0 (nx445), .A1 (outmux_14)) ;
    nor02ii ix27 (.Y (inppfinal_14), .A0 (nx447), .A1 (outmux_15)) ;
    nor02ii ix31 (.Y (inppfinal_15), .A0 (nx447), .A1 (outmux_16)) ;
    nor02ii ix35 (.Y (nx34), .A0 (res[0]), .A1 (outp_0)) ;
    nand02 ix137 (.Y (enablep), .A0 (nx408), .A1 (finishmul)) ;
    inv01 ix409 (.Y (nx408), .A (enp)) ;
    inv01 ix411 (.Y (invt_0), .A (outa_9)) ;
    inv01 ix413 (.Y (invt_1), .A (outa_10)) ;
    inv01 ix415 (.Y (invt_2), .A (outa_11)) ;
    inv01 ix417 (.Y (invt_3), .A (outa_12)) ;
    inv01 ix419 (.Y (invt_4), .A (outa_13)) ;
    inv01 ix421 (.Y (invt_5), .A (outa_14)) ;
    inv01 ix423 (.Y (invt_6), .A (outa_15)) ;
    inv01 ix425 (.Y (invt_7), .A (outa_16)) ;
    nor02ii ix37 (.Y (inpadderB_0), .A0 (nx449), .A1 (outa_0)) ;
    nor02ii ix39 (.Y (inpadderB_1), .A0 (nx449), .A1 (outa_1)) ;
    nor02ii ix41 (.Y (inpadderB_2), .A0 (nx449), .A1 (outa_2)) ;
    nor02ii ix43 (.Y (inpadderB_3), .A0 (nx449), .A1 (outa_3)) ;
    nor02ii ix45 (.Y (inpadderB_4), .A0 (nx449), .A1 (outa_4)) ;
    nor02ii ix47 (.Y (inpadderB_5), .A0 (nx449), .A1 (outa_5)) ;
    nor02ii ix49 (.Y (inpadderB_6), .A0 (nx449), .A1 (outa_6)) ;
    nor02ii ix51 (.Y (inpadderB_7), .A0 (nx451), .A1 (outa_7)) ;
    nor02ii ix53 (.Y (inpadderB_8), .A0 (nx451), .A1 (outa_8)) ;
    mux21_ni ix61 (.Y (inpadderB_9), .A0 (outa_9), .A1 (s_9), .S0 (nx451)) ;
    mux21_ni ix69 (.Y (inpadderB_10), .A0 (outa_10), .A1 (s_10), .S0 (nx451)) ;
    mux21_ni ix77 (.Y (inpadderB_11), .A0 (outa_11), .A1 (s_11), .S0 (nx451)) ;
    mux21_ni ix85 (.Y (inpadderB_12), .A0 (outa_12), .A1 (s_12), .S0 (nx451)) ;
    mux21_ni ix93 (.Y (inpadderB_13), .A0 (outa_13), .A1 (s_13), .S0 (nx451)) ;
    mux21_ni ix101 (.Y (inpadderB_14), .A0 (outa_14), .A1 (s_14), .S0 (nx453)) ;
    mux21_ni ix109 (.Y (inpadderB_15), .A0 (outa_15), .A1 (s_15), .S0 (nx453)) ;
    mux21_ni ix117 (.Y (inpadderB_16), .A0 (outa_16), .A1 (s_16), .S0 (nx453)) ;
    inv02 ix442 (.Y (nx443), .A (nx408)) ;
    inv02 ix444 (.Y (nx445), .A (nx408)) ;
    inv02 ix446 (.Y (nx447), .A (nx408)) ;
    inv02 ix448 (.Y (nx449), .A (nx34)) ;
    inv02 ix450 (.Y (nx451), .A (nx34)) ;
    inv02 ix452 (.Y (nx453), .A (nx34)) ;
endmodule


module mux_4 ( IN1, IN2, SEl, OUT1 ) ;

    input [16:0]IN1 ;
    input [16:0]IN2 ;
    input [1:0]SEl ;
    output [16:0]OUT1 ;

    wire nx0, nx164, nx166, nx168;



    xnor2 ix1 (.Y (nx0), .A0 (SEl[1]), .A1 (SEl[0])) ;
    mux21_ni ix9 (.Y (OUT1[0]), .A0 (IN1[0]), .A1 (IN2[0]), .S0 (nx164)) ;
    mux21_ni ix17 (.Y (OUT1[1]), .A0 (IN1[1]), .A1 (IN2[1]), .S0 (nx164)) ;
    mux21_ni ix25 (.Y (OUT1[2]), .A0 (IN1[2]), .A1 (IN2[2]), .S0 (nx164)) ;
    mux21_ni ix33 (.Y (OUT1[3]), .A0 (IN1[3]), .A1 (IN2[3]), .S0 (nx164)) ;
    mux21_ni ix41 (.Y (OUT1[4]), .A0 (IN1[4]), .A1 (IN2[4]), .S0 (nx164)) ;
    mux21_ni ix49 (.Y (OUT1[5]), .A0 (IN1[5]), .A1 (IN2[5]), .S0 (nx164)) ;
    mux21_ni ix57 (.Y (OUT1[6]), .A0 (IN1[6]), .A1 (IN2[6]), .S0 (nx164)) ;
    mux21_ni ix65 (.Y (OUT1[7]), .A0 (IN1[7]), .A1 (IN2[7]), .S0 (nx166)) ;
    mux21_ni ix73 (.Y (OUT1[8]), .A0 (IN1[8]), .A1 (IN2[8]), .S0 (nx166)) ;
    mux21_ni ix81 (.Y (OUT1[9]), .A0 (IN1[9]), .A1 (IN2[9]), .S0 (nx166)) ;
    mux21_ni ix89 (.Y (OUT1[10]), .A0 (IN1[10]), .A1 (IN2[10]), .S0 (nx166)) ;
    mux21_ni ix97 (.Y (OUT1[11]), .A0 (IN1[11]), .A1 (IN2[11]), .S0 (nx166)) ;
    mux21_ni ix105 (.Y (OUT1[12]), .A0 (IN1[12]), .A1 (IN2[12]), .S0 (nx166)) ;
    mux21_ni ix113 (.Y (OUT1[13]), .A0 (IN1[13]), .A1 (IN2[13]), .S0 (nx166)) ;
    mux21_ni ix121 (.Y (OUT1[14]), .A0 (IN1[14]), .A1 (IN2[14]), .S0 (nx168)) ;
    mux21_ni ix129 (.Y (OUT1[15]), .A0 (IN1[15]), .A1 (IN2[15]), .S0 (nx168)) ;
    mux21_ni ix137 (.Y (OUT1[16]), .A0 (IN1[16]), .A1 (IN2[16]), .S0 (nx168)) ;
    inv02 ix163 (.Y (nx164), .A (nx0)) ;
    inv02 ix165 (.Y (nx166), .A (nx0)) ;
    inv02 ix167 (.Y (nx168), .A (nx0)) ;
endmodule


module MYNADDER_17 ( A, B, S ) ;

    input [16:0]A ;
    input [16:0]B ;
    output [16:0]S ;

    wire TEMP_15, TEMP_14, TEMP_13, TEMP_12, TEMP_11, TEMP_10, TEMP_9, TEMP_8,
         TEMP_7, TEMP_6, TEMP_5, TEMP_4, TEMP_3, TEMP_2, TEMP_1, TEMP_0, cin;
    wire [0:0] \$dummy ;




    MYADDER ADD1 (.A (A[0]), .B (B[0]), .CIN (cin), .COUT (TEMP_0), .S (S[0])) ;
    MYADDER loop1_1_ADD (.A (A[1]), .B (B[1]), .CIN (TEMP_0), .COUT (TEMP_1), .S (
            S[1])) ;
    MYADDER loop1_2_ADD (.A (A[2]), .B (B[2]), .CIN (TEMP_1), .COUT (TEMP_2), .S (
            S[2])) ;
    MYADDER loop1_3_ADD (.A (A[3]), .B (B[3]), .CIN (TEMP_2), .COUT (TEMP_3), .S (
            S[3])) ;
    MYADDER loop1_4_ADD (.A (A[4]), .B (B[4]), .CIN (TEMP_3), .COUT (TEMP_4), .S (
            S[4])) ;
    MYADDER loop1_5_ADD (.A (A[5]), .B (B[5]), .CIN (TEMP_4), .COUT (TEMP_5), .S (
            S[5])) ;
    MYADDER loop1_6_ADD (.A (A[6]), .B (B[6]), .CIN (TEMP_5), .COUT (TEMP_6), .S (
            S[6])) ;
    MYADDER loop1_7_ADD (.A (A[7]), .B (B[7]), .CIN (TEMP_6), .COUT (TEMP_7), .S (
            S[7])) ;
    MYADDER loop1_8_ADD (.A (A[8]), .B (B[8]), .CIN (TEMP_7), .COUT (TEMP_8), .S (
            S[8])) ;
    MYADDER loop1_9_ADD (.A (A[9]), .B (B[9]), .CIN (TEMP_8), .COUT (TEMP_9), .S (
            S[9])) ;
    MYADDER loop1_10_ADD (.A (A[10]), .B (B[10]), .CIN (TEMP_9), .COUT (TEMP_10)
            , .S (S[10])) ;
    MYADDER loop1_11_ADD (.A (A[11]), .B (B[11]), .CIN (TEMP_10), .COUT (TEMP_11
            ), .S (S[11])) ;
    MYADDER loop1_12_ADD (.A (A[12]), .B (B[12]), .CIN (TEMP_11), .COUT (TEMP_12
            ), .S (S[12])) ;
    MYADDER loop1_13_ADD (.A (A[13]), .B (B[13]), .CIN (TEMP_12), .COUT (TEMP_13
            ), .S (S[13])) ;
    MYADDER loop1_14_ADD (.A (A[14]), .B (B[14]), .CIN (TEMP_13), .COUT (TEMP_14
            ), .S (S[14])) ;
    MYADDER loop1_15_ADD (.A (A[15]), .B (B[15]), .CIN (TEMP_14), .COUT (TEMP_15
            ), .S (S[15])) ;
    MYADDER loop1_16_ADD (.A (A[16]), .B (B[16]), .CIN (TEMP_15), .COUT (
            \$dummy [0]), .S (S[16])) ;
    fake_gnd ix124 (.Y (cin)) ;
endmodule


module MYNADDER_8 ( A, B, S ) ;

    input [7:0]A ;
    input [7:0]B ;
    output [7:0]S ;

    wire TEMP_6, TEMP_5, TEMP_4, TEMP_3, TEMP_2, TEMP_1, TEMP_0, cin;
    wire [0:0] \$dummy ;




    MYADDER ADD1 (.A (A[0]), .B (B[0]), .CIN (cin), .COUT (TEMP_0), .S (S[0])) ;
    MYADDER loop1_1_ADD (.A (A[1]), .B (B[1]), .CIN (TEMP_0), .COUT (TEMP_1), .S (
            S[1])) ;
    MYADDER loop1_2_ADD (.A (A[2]), .B (B[2]), .CIN (TEMP_1), .COUT (TEMP_2), .S (
            S[2])) ;
    MYADDER loop1_3_ADD (.A (A[3]), .B (B[3]), .CIN (TEMP_2), .COUT (TEMP_3), .S (
            S[3])) ;
    MYADDER loop1_4_ADD (.A (A[4]), .B (B[4]), .CIN (TEMP_3), .COUT (TEMP_4), .S (
            S[4])) ;
    MYADDER loop1_5_ADD (.A (A[5]), .B (B[5]), .CIN (TEMP_4), .COUT (TEMP_5), .S (
            S[5])) ;
    MYADDER loop1_6_ADD (.A (A[6]), .B (B[6]), .CIN (TEMP_5), .COUT (TEMP_6), .S (
            S[6])) ;
    MYADDER loop1_7_ADD (.A (A[7]), .B (B[7]), .CIN (TEMP_6), .COUT (\$dummy [0]
            ), .S (S[7])) ;
    fake_gnd ix70 (.Y (cin)) ;
endmodule


module MYADDER ( A, B, CIN, COUT, S ) ;

    input A ;
    input B ;
    input CIN ;
    output COUT ;
    output S ;

    wire nx0, nx67;



    xnor2 ix9 (.Y (S), .A0 (nx67), .A1 (CIN)) ;
    xnor2 ix68 (.Y (nx67), .A0 (A), .A1 (B)) ;
    ao22 ix7 (.Y (COUT), .A0 (B), .A1 (A), .B0 (CIN), .B1 (nx0)) ;
    inv01 ix1 (.Y (nx0), .A (nx67)) ;
endmodule


module my_nDFFfalling_17 ( Clk, Rst, EN, d, q ) ;

    input Clk ;
    input Rst ;
    input EN ;
    input [16:0]d ;
    output [16:0]q ;

    wire nx242, nx252, nx262, nx272, nx282, nx292, nx302, nx312, nx322, nx332,
         nx342, nx352, nx362, nx372, nx382, nx392, nx402, nx470, nx472, nx474,
         nx480, nx482, nx484, nx486;
    wire [16:0] \$dummy ;




    dffr reg_q_0 (.Q (q[0]), .QB (\$dummy [0]), .D (nx242), .CLK (nx470), .R (
         Rst)) ;
    mux21_ni ix243 (.Y (nx242), .A0 (q[0]), .A1 (d[0]), .S0 (nx482)) ;
    dffr reg_q_1 (.Q (q[1]), .QB (\$dummy [1]), .D (nx252), .CLK (nx470), .R (
         Rst)) ;
    mux21_ni ix253 (.Y (nx252), .A0 (q[1]), .A1 (d[1]), .S0 (nx482)) ;
    dffr reg_q_2 (.Q (q[2]), .QB (\$dummy [2]), .D (nx262), .CLK (nx470), .R (
         Rst)) ;
    mux21_ni ix263 (.Y (nx262), .A0 (q[2]), .A1 (d[2]), .S0 (nx482)) ;
    dffr reg_q_3 (.Q (q[3]), .QB (\$dummy [3]), .D (nx272), .CLK (nx470), .R (
         Rst)) ;
    mux21_ni ix273 (.Y (nx272), .A0 (q[3]), .A1 (d[3]), .S0 (nx482)) ;
    dffr reg_q_4 (.Q (q[4]), .QB (\$dummy [4]), .D (nx282), .CLK (nx470), .R (
         Rst)) ;
    mux21_ni ix283 (.Y (nx282), .A0 (q[4]), .A1 (d[4]), .S0 (nx482)) ;
    dffr reg_q_5 (.Q (q[5]), .QB (\$dummy [5]), .D (nx292), .CLK (nx470), .R (
         Rst)) ;
    mux21_ni ix293 (.Y (nx292), .A0 (q[5]), .A1 (d[5]), .S0 (nx482)) ;
    dffr reg_q_6 (.Q (q[6]), .QB (\$dummy [6]), .D (nx302), .CLK (nx470), .R (
         Rst)) ;
    mux21_ni ix303 (.Y (nx302), .A0 (q[6]), .A1 (d[6]), .S0 (nx482)) ;
    dffr reg_q_7 (.Q (q[7]), .QB (\$dummy [7]), .D (nx312), .CLK (nx472), .R (
         Rst)) ;
    mux21_ni ix313 (.Y (nx312), .A0 (q[7]), .A1 (d[7]), .S0 (nx484)) ;
    dffr reg_q_8 (.Q (q[8]), .QB (\$dummy [8]), .D (nx322), .CLK (nx472), .R (
         Rst)) ;
    mux21_ni ix323 (.Y (nx322), .A0 (q[8]), .A1 (d[8]), .S0 (nx484)) ;
    dffr reg_q_9 (.Q (q[9]), .QB (\$dummy [9]), .D (nx332), .CLK (nx472), .R (
         Rst)) ;
    mux21_ni ix333 (.Y (nx332), .A0 (q[9]), .A1 (d[9]), .S0 (nx484)) ;
    dffr reg_q_10 (.Q (q[10]), .QB (\$dummy [10]), .D (nx342), .CLK (nx472), .R (
         Rst)) ;
    mux21_ni ix343 (.Y (nx342), .A0 (q[10]), .A1 (d[10]), .S0 (nx484)) ;
    dffr reg_q_11 (.Q (q[11]), .QB (\$dummy [11]), .D (nx352), .CLK (nx472), .R (
         Rst)) ;
    mux21_ni ix353 (.Y (nx352), .A0 (q[11]), .A1 (d[11]), .S0 (nx484)) ;
    dffr reg_q_12 (.Q (q[12]), .QB (\$dummy [12]), .D (nx362), .CLK (nx472), .R (
         Rst)) ;
    mux21_ni ix363 (.Y (nx362), .A0 (q[12]), .A1 (d[12]), .S0 (nx484)) ;
    dffr reg_q_13 (.Q (q[13]), .QB (\$dummy [13]), .D (nx372), .CLK (nx472), .R (
         Rst)) ;
    mux21_ni ix373 (.Y (nx372), .A0 (q[13]), .A1 (d[13]), .S0 (nx484)) ;
    dffr reg_q_14 (.Q (q[14]), .QB (\$dummy [14]), .D (nx382), .CLK (nx474), .R (
         Rst)) ;
    mux21_ni ix383 (.Y (nx382), .A0 (q[14]), .A1 (d[14]), .S0 (nx486)) ;
    dffr reg_q_15 (.Q (q[15]), .QB (\$dummy [15]), .D (nx392), .CLK (nx474), .R (
         Rst)) ;
    mux21_ni ix393 (.Y (nx392), .A0 (q[15]), .A1 (d[15]), .S0 (nx486)) ;
    dffr reg_q_16 (.Q (q[16]), .QB (\$dummy [16]), .D (nx402), .CLK (nx474), .R (
         Rst)) ;
    mux21_ni ix403 (.Y (nx402), .A0 (q[16]), .A1 (d[16]), .S0 (nx486)) ;
    inv02 ix469 (.Y (nx470), .A (Clk)) ;
    inv02 ix471 (.Y (nx472), .A (Clk)) ;
    inv02 ix473 (.Y (nx474), .A (Clk)) ;
    inv01 ix479 (.Y (nx480), .A (EN)) ;
    inv02 ix481 (.Y (nx482), .A (nx480)) ;
    inv02 ix483 (.Y (nx484), .A (nx480)) ;
    inv02 ix485 (.Y (nx486), .A (nx480)) ;
endmodule


module General_Counter_4 ( EN, CLK, RST, \Output  ) ;

    input EN ;
    input CLK ;
    input RST ;
    output [3:0]\Output  ;

    wire nx24, nx30, nx81, nx91, nx101, nx111, nx128, nx130, nx132, nx141;
    wire [2:0] \$dummy ;




    dffr reg_Output_0 (.Q (\Output [0]), .QB (\$dummy [0]), .D (nx81), .CLK (CLK
         ), .R (RST)) ;
    mux21 ix92 (.Y (nx91), .A0 (nx128), .A1 (nx130), .S0 (EN)) ;
    dffr reg_Output_1 (.Q (\Output [1]), .QB (nx128), .D (nx91), .CLK (CLK), .R (
         RST)) ;
    oai21 ix131 (.Y (nx130), .A0 (\Output [0]), .A1 (\Output [1]), .B0 (nx132)
          ) ;
    nand02 ix133 (.Y (nx132), .A0 (\Output [1]), .A1 (\Output [0])) ;
    dffr reg_Output_2 (.Q (\Output [2]), .QB (\$dummy [1]), .D (nx101), .CLK (
         CLK), .R (RST)) ;
    mux21_ni ix102 (.Y (nx101), .A0 (\Output [2]), .A1 (nx24), .S0 (EN)) ;
    xnor2 ix25 (.Y (nx24), .A0 (\Output [2]), .A1 (nx132)) ;
    dffr reg_Output_3 (.Q (\Output [3]), .QB (\$dummy [2]), .D (nx111), .CLK (
         CLK), .R (RST)) ;
    mux21_ni ix112 (.Y (nx111), .A0 (\Output [3]), .A1 (nx30), .S0 (EN)) ;
    xnor2 ix31 (.Y (nx30), .A0 (\Output [3]), .A1 (nx141)) ;
    nand03 ix142 (.Y (nx141), .A0 (\Output [2]), .A1 (\Output [1]), .A2 (
           \Output [0])) ;
    xor2 ix82 (.Y (nx81), .A0 (\Output [0]), .A1 (EN)) ;
endmodule


module Main ( CLK, filter, rowCounterRst, windCounterRst, doneCounterRst,
              En_Window, En_Done, rowCounterEnable,stride, cacheAddr, DoneOut,
              WindowOut, rowOut ) ;

    input CLK ;
    input filter ;
    input rowCounterRst ;
    input windCounterRst ;
    input doneCounterRst ;
    input En_Window ;
    input En_Done ;
    input rowCounterEnable ;
    input [1:0]stride;
    output [4:0]cacheAddr ;
    output [7:0]DoneOut ;
    output [7:0]WindowOut ;
    output [2:0]rowOut ;

    wire OUT_Mux2_Address_4, OUT_Mux2_Address_3, OUT_Mux2_Address_2,
         OUT_Mux2_Address_1, OUT_Mux2_Address_0, PWR, GND;



    Counter_3 RW_Counter (.EN (rowCounterEnable), .CLK (CLK), .RST (
              rowCounterRst), .Filter (filter), .\Output  ({rowOut[2],rowOut[1],
              rowOut[0]})) ;
    mux_8_5 MUX_Address (.IN1 ({GND,GND,GND,GND,GND}), .IN2 ({GND,GND,PWR,GND,
            PWR}), .IN3 ({GND,PWR,GND,PWR,GND}), .IN4 ({OUT_Mux2_Address_4,
            OUT_Mux2_Address_3,OUT_Mux2_Address_2,OUT_Mux2_Address_1,
            OUT_Mux2_Address_0}), .IN5 ({PWR,GND,PWR,GND,GND}), .IN6 ({GND,GND,
            GND,GND,GND}), .SEl ({rowOut[2],rowOut[1],rowOut[0]}), .OUT1 ({
            cacheAddr[4],cacheAddr[3],cacheAddr[2],cacheAddr[1],cacheAddr[0]})
            ) ;
    General_Counter_8 Window_Counter (.EN (En_Window), .CLK (CLK), .RST (
                      windCounterRst), .\Output  ({WindowOut[7],WindowOut[6],
                      WindowOut[5],WindowOut[4],WindowOut[3],WindowOut[2],
                      WindowOut[1],WindowOut[0]})) ;
	General_Counter_8 Done_Counter (.EN (En_Done), .CLK (CLK), .RST (
                      doneCounterRst), .\Output  ({DoneOut[7],DoneOut[6],
                      DoneOut[5],DoneOut[4],DoneOut[3],DoneOut[2],DoneOut[1],
                      DoneOut[0]})) ;
    mux_2_5 Mux2_Address (.IN1 ({GND,GND,GND,GND,GND}), .IN2 ({GND,PWR,PWR,PWR,
            PWR}), .SEl (filter), .OUT1 ({OUT_Mux2_Address_4,OUT_Mux2_Address_3,
            OUT_Mux2_Address_2,OUT_Mux2_Address_1,OUT_Mux2_Address_0})) ;
    fake_gnd ix82 (.Y (GND)) ;
    fake_vcc ix80 (.Y (PWR)) ;
endmodule


module mux_2_5 ( IN1, IN2, SEl, OUT1 ) ;

    input [4:0]IN1 ;
    input [4:0]IN2 ;
    input SEl ;
    output [4:0]OUT1 ;




    mux21_ni ix7 (.Y (OUT1[0]), .A0 (IN1[0]), .A1 (IN2[0]), .S0 (SEl)) ;
    mux21_ni ix15 (.Y (OUT1[1]), .A0 (IN1[1]), .A1 (IN2[1]), .S0 (SEl)) ;
    mux21_ni ix23 (.Y (OUT1[2]), .A0 (IN1[2]), .A1 (IN2[2]), .S0 (SEl)) ;
    mux21_ni ix31 (.Y (OUT1[3]), .A0 (IN1[3]), .A1 (IN2[3]), .S0 (SEl)) ;
    mux21_ni ix39 (.Y (OUT1[4]), .A0 (IN1[4]), .A1 (IN2[4]), .S0 (SEl)) ;
endmodule



module General_Counter_8 ( EN, CLK, RST, \Output  ) ;

    input EN ;
    input CLK ;
    input RST ;
    output [7:0]\Output  ;

    wire nx24, nx36, nx42, nx48, nx60, nx66, nx72, nx78, nx129, nx139, nx149,
         nx159, nx169, nx179, nx189, nx199, nx216, nx218, nx220, nx229, nx235,
         nx246;
    wire [6:0] \$dummy ;




    dffr reg_Output_0 (.Q (\Output [0]), .QB (\$dummy [0]), .D (nx129), .CLK (
         CLK), .R (RST)) ;
    mux21 ix140 (.Y (nx139), .A0 (nx216), .A1 (nx218), .S0 (EN)) ;
    dffr reg_Output_1 (.Q (\Output [1]), .QB (nx216), .D (nx139), .CLK (CLK), .R (
         RST)) ;
    oai21 ix219 (.Y (nx218), .A0 (\Output [0]), .A1 (\Output [1]), .B0 (nx220)
          ) ;
    nand02 ix221 (.Y (nx220), .A0 (\Output [1]), .A1 (\Output [0])) ;
    dffr reg_Output_2 (.Q (\Output [2]), .QB (\$dummy [1]), .D (nx149), .CLK (
         CLK), .R (RST)) ;
    mux21_ni ix150 (.Y (nx149), .A0 (\Output [2]), .A1 (nx24), .S0 (EN)) ;
    xnor2 ix25 (.Y (nx24), .A0 (\Output [2]), .A1 (nx220)) ;
    dffr reg_Output_3 (.Q (\Output [3]), .QB (\$dummy [2]), .D (nx159), .CLK (
         CLK), .R (RST)) ;
    mux21_ni ix160 (.Y (nx159), .A0 (\Output [3]), .A1 (nx36), .S0 (EN)) ;
    xnor2 ix37 (.Y (nx36), .A0 (\Output [3]), .A1 (nx229)) ;
    nand03 ix230 (.Y (nx229), .A0 (\Output [2]), .A1 (\Output [1]), .A2 (
           \Output [0])) ;
    dffr reg_Output_4 (.Q (\Output [4]), .QB (\$dummy [3]), .D (nx169), .CLK (
         CLK), .R (RST)) ;
    mux21_ni ix170 (.Y (nx169), .A0 (\Output [4]), .A1 (nx48), .S0 (EN)) ;
    xnor2 ix49 (.Y (nx48), .A0 (\Output [4]), .A1 (nx235)) ;
    nand04 ix236 (.Y (nx235), .A0 (\Output [3]), .A1 (\Output [2]), .A2 (
           \Output [1]), .A3 (\Output [0])) ;
    dffr reg_Output_5 (.Q (\Output [5]), .QB (\$dummy [4]), .D (nx179), .CLK (
         CLK), .R (RST)) ;
    mux21_ni ix180 (.Y (nx179), .A0 (\Output [5]), .A1 (nx60), .S0 (EN)) ;
    xor2 ix61 (.Y (nx60), .A0 (\Output [5]), .A1 (nx42)) ;
    nor02ii ix43 (.Y (nx42), .A0 (nx235), .A1 (\Output [4])) ;
    dffr reg_Output_6 (.Q (\Output [6]), .QB (\$dummy [5]), .D (nx189), .CLK (
         CLK), .R (RST)) ;
    mux21_ni ix190 (.Y (nx189), .A0 (\Output [6]), .A1 (nx72), .S0 (EN)) ;
    xnor2 ix73 (.Y (nx72), .A0 (\Output [6]), .A1 (nx246)) ;
    nand02 ix247 (.Y (nx246), .A0 (\Output [5]), .A1 (nx42)) ;
    dffr reg_Output_7 (.Q (\Output [7]), .QB (\$dummy [6]), .D (nx199), .CLK (
         CLK), .R (RST)) ;
    mux21_ni ix200 (.Y (nx199), .A0 (\Output [7]), .A1 (nx78), .S0 (EN)) ;
    xor2 ix79 (.Y (nx78), .A0 (\Output [7]), .A1 (nx66)) ;
    nor02ii ix67 (.Y (nx66), .A0 (nx246), .A1 (\Output [6])) ;
    xor2 ix130 (.Y (nx129), .A0 (\Output [0]), .A1 (EN)) ;
endmodule

module mux_8_5 ( IN1, IN2, IN3, IN4, IN5, IN6, SEl, OUT1 ) ;

    input [4:0]IN1 ;
    input [4:0]IN2 ;
    input [4:0]IN3 ;
    input [4:0]IN4 ;
    input [4:0]IN5 ;
    input [4:0]IN6 ;
    input [2:0]SEl ;
    output [4:0]OUT1 ;

    wire nx6, nx14, nx22, nx30, nx38, nx48, nx97, nx101, nx103, nx107, nx111,
         nx113, nx123, nx125, nx129, nx131, nx135, nx137, nx141, nx143, nx150,
         nx152, nx154, nx156;



    nand02 ix57 (.Y (OUT1[0]), .A0 (nx97), .A1 (nx113)) ;
    aoi222 ix98 (.Y (nx97), .A0 (IN6[0]), .A1 (nx156), .B0 (IN2[0]), .B1 (nx48)
           , .C0 (IN4[0]), .C1 (nx38)) ;
    inv01 ix102 (.Y (nx101), .A (SEl[2])) ;
    nor02_2x ix104 (.Y (nx103), .A0 (nx152), .A1 (nx150)) ;
    nor03_2x ix49 (.Y (nx48), .A0 (nx107), .A1 (nx154), .A2 (nx150)) ;
    inv01 ix108 (.Y (nx107), .A (SEl[0])) ;
    nor03_2x ix39 (.Y (nx38), .A0 (nx107), .A1 (nx154), .A2 (nx111)) ;
    inv01 ix112 (.Y (nx111), .A (SEl[1])) ;
    aoi222 ix114 (.Y (nx113), .A0 (IN1[0]), .A1 (nx22), .B0 (IN5[0]), .B1 (nx14)
           , .C0 (IN3[0]), .C1 (nx6)) ;
    nor03_2x ix23 (.Y (nx22), .A0 (nx154), .A1 (nx152), .A2 (nx150)) ;
    nor03_2x ix15 (.Y (nx14), .A0 (nx101), .A1 (nx152), .A2 (nx150)) ;
    nor03_2x ix7 (.Y (nx6), .A0 (nx152), .A1 (nx154), .A2 (nx111)) ;
    nand02 ix79 (.Y (OUT1[1]), .A0 (nx123), .A1 (nx125)) ;
    aoi222 ix124 (.Y (nx123), .A0 (IN6[1]), .A1 (nx156), .B0 (IN2[1]), .B1 (nx48
           ), .C0 (IN4[1]), .C1 (nx38)) ;
    aoi222 ix126 (.Y (nx125), .A0 (IN1[1]), .A1 (nx22), .B0 (IN5[1]), .B1 (nx14)
           , .C0 (IN3[1]), .C1 (nx6)) ;
    nand02 ix101 (.Y (OUT1[2]), .A0 (nx129), .A1 (nx131)) ;
    aoi222 ix130 (.Y (nx129), .A0 (IN6[2]), .A1 (nx156), .B0 (IN2[2]), .B1 (nx48
           ), .C0 (IN4[2]), .C1 (nx38)) ;
    aoi222 ix132 (.Y (nx131), .A0 (IN1[2]), .A1 (nx22), .B0 (IN5[2]), .B1 (nx14)
           , .C0 (IN3[2]), .C1 (nx6)) ;
    nand02 ix123 (.Y (OUT1[3]), .A0 (nx135), .A1 (nx137)) ;
    aoi222 ix136 (.Y (nx135), .A0 (IN6[3]), .A1 (nx156), .B0 (IN2[3]), .B1 (nx48
           ), .C0 (IN4[3]), .C1 (nx38)) ;
    aoi222 ix138 (.Y (nx137), .A0 (IN1[3]), .A1 (nx22), .B0 (IN5[3]), .B1 (nx14)
           , .C0 (IN3[3]), .C1 (nx6)) ;
    nand02 ix145 (.Y (OUT1[4]), .A0 (nx141), .A1 (nx143)) ;
    aoi222 ix142 (.Y (nx141), .A0 (IN6[4]), .A1 (nx156), .B0 (IN2[4]), .B1 (nx48
           ), .C0 (IN4[4]), .C1 (nx38)) ;
    aoi222 ix144 (.Y (nx143), .A0 (IN1[4]), .A1 (nx22), .B0 (IN5[4]), .B1 (nx14)
           , .C0 (IN3[4]), .C1 (nx6)) ;
    nor02ii ix31 (.Y (nx30), .A0 (nx103), .A1 (nx154)) ;
    inv02 ix149 (.Y (nx150), .A (nx111)) ;
    inv02 ix151 (.Y (nx152), .A (nx107)) ;
    inv02 ix153 (.Y (nx154), .A (nx101)) ;
    buf02 ix155 (.Y (nx156), .A (nx30)) ;
endmodule


module Counter_3 ( EN, CLK, RST, Filter, \Output  ) ;

    input EN ;
    input CLK ;
    input RST ;
    input Filter ;
    output [2:0]\Output  ;

    wire nx146, nx148, nx8, nx16, nx26, nx38, nx155, nx165, nx175, nx190, nx195,
         nx197, nx200, nx202;
    wire [0:0] \$dummy ;




    dffr reg_temp_0 (.Q (\Output [0]), .QB (\$dummy [0]), .D (nx175), .CLK (CLK)
         , .R (RST)) ;
    mux21_ni ix176 (.Y (nx175), .A0 (\Output [0]), .A1 (nx148), .S0 (EN)) ;
    nand02 ix49 (.Y (nx148), .A0 (nx146), .A1 (\Output [0])) ;
    mux21_ni ix43 (.Y (nx146), .A0 (nx26), .A1 (nx38), .S0 (Filter)) ;
    or02 ix27 (.Y (nx26), .A0 (nx190), .A1 (\Output [2])) ;
    nand02 ix191 (.Y (nx190), .A0 (\Output [1]), .A1 (\Output [0])) ;
    dffr reg_temp_1 (.Q (\Output [1]), .QB (nx197), .D (nx155), .CLK (CLK), .R (
         RST)) ;
    mux21_ni ix156 (.Y (nx155), .A0 (\Output [1]), .A1 (nx8), .S0 (EN)) ;
    aoi21 ix9 (.Y (nx8), .A0 (\Output [1]), .A1 (\Output [0]), .B0 (nx195)) ;
    oai21 ix196 (.Y (nx195), .A0 (\Output [1]), .A1 (\Output [0]), .B0 (nx146)
          ) ;
    oai21 ix166 (.Y (nx165), .A0 (nx200), .A1 (EN), .B0 (nx202)) ;
    dffr reg_temp_2 (.Q (\Output [2]), .QB (nx200), .D (nx165), .CLK (CLK), .R (
         RST)) ;
    nand03 ix203 (.Y (nx202), .A0 (nx146), .A1 (nx16), .A2 (EN)) ;
    nand03 ix39 (.Y (nx38), .A0 (nx197), .A1 (\Output [2]), .A2 (\Output [0])) ;
    xor2 ix17 (.Y (nx16), .A0 (nx200), .A1 (nx190)) ;
endmodule


module UpdatePc ( K, R, F, stride, Read_F, CLK, RST, PC_en, PC_en2, Filter,
                  pcSrc, ramAddr ) ;

    input K ;
    input R ;
    input F ;
    input [1:0]stride ;
    input Read_F ;
    input CLK ;
    input RST ;
    input PC_en ;
    input PC_en2 ;
    input Filter ;
    input pcSrc ;
    output [16:0]ramAddr ;

    wire out_muxPC_16, out_muxPC_15, out_muxPC_14, out_muxPC_13, out_muxPC_12,
         out_muxPC_11, out_muxPC_10, out_muxPC_9, out_muxPC_8, out_muxPC_7,
         out_muxPC_6, out_muxPC_5, out_muxPC_4, out_muxPC_3, out_muxPC_2,
         out_muxPC_1, out_muxPC_0, RegPc_out_16, RegPc_out_15, RegPc_out_14,
         RegPc_out_13, RegPc_out_12, RegPc_out_11, RegPc_out_10, RegPc_out_9,
         RegPc_out_8, RegPc_out_7, RegPc_out_6, RegPc_out_5, RegPc_out_4,
         RegPc_out_3, RegPc_out_2, RegPc_out_1, RegPc_out_0, inMuxPc2_16,
         inMuxPc2_15, inMuxPc2_14, inMuxPc2_13, inMuxPc2_12, inMuxPc2_11,
         inMuxPc2_10, inMuxPc2_9, inMuxPc2_8, inMuxPc2_7, inMuxPc2_6, inMuxPc2_5,
         inMuxPc2_4, inMuxPc2_3, inMuxPc2_2, inMuxPc3_16, inMuxPc3_15,
         inMuxPc3_14, inMuxPc3_13, inMuxPc3_12, inMuxPc3_11, inMuxPc3_10,
         inMuxPc3_9, inMuxPc3_8, inMuxPc3_7, inMuxPc3_6, inMuxPc3_5, inMuxPc3_4,
         inMuxPc3_3, inMuxPc3_2, inMuxPc3_1, inMuxPc4_16, inMuxPc4_15,
         inMuxPc4_14, inMuxPc4_13, inMuxPc4_12, inMuxPc4_11, inMuxPc4_10,
         inMuxPc4_9, inMuxPc5_16, inMuxPc5_15, inMuxPc5_14, inMuxPc5_13,
         inMuxPc5_12, inMuxPc5_11, inMuxPc5_10, inMuxPc5_9, inMuxPc5_8,
         inMuxPc5_7, inMuxPc5_6, inMuxPc5_5, inMuxPc5_4, inMuxPc5_3, inMuxPc5_2,
         inMuxPc5_1, inMuxPc6_16, inMuxPc6_15, inMuxPc6_14, inMuxPc6_13,
         inMuxPc6_12, inMuxPc6_11, inMuxPc6_10, inMuxPc6_9, inmux2Pc_16,
         inmux2Pc_15, inmux2Pc_14, inmux2Pc_13, inmux2Pc_12, inmux2Pc_11,
         inmux2Pc_10, inmux2Pc_9, inmux2Pc_8, inmux2Pc_7, inmux2Pc_6, inmux2Pc_5,
         inmux2Pc_4, inmux2Pc_3, inmux2Pc_2, inmux2Pc_1, out_mux2_16,
         out_mux2_15, out_mux2_14, out_mux2_13, out_mux2_12, out_mux2_11,
         out_mux2_10, out_mux2_9, out_mux2_8, out_mux2_7, out_mux2_6, out_mux2_5,
         out_mux2_4, out_mux2_3, out_mux2_2, out_mux2_1, out_mux2_0,
         pcOut_image_16, pcOut_image_15, pcOut_image_14, pcOut_image_13,
         pcOut_image_12, pcOut_image_11, pcOut_image_10, pcOut_image_9,
         pcOut_image_8, pcOut_image_7, pcOut_image_6, pcOut_image_5,
         pcOut_image_4, pcOut_image_3, pcOut_image_2, pcOut_image_1,
         pcOut_image_0, pcOut_image_in_16, pcOut_image_in_15, pcOut_image_in_14,
         pcOut_image_in_13, pcOut_image_in_12, pcOut_image_in_11,
         pcOut_image_in_10, pcOut_image_in_9, pcOut_image_in_8, pcOut_image_in_7,
         pcOut_image_in_6, pcOut_image_in_5, pcOut_image_in_4, pcOut_image_in_3,
         pcOut_image_in_2, pcOut_image_in_1, pcOut_image_in_0, inmux3Pc_16,
         inmux3Pc_15, inmux3Pc_14, inmux3Pc_13, inmux3Pc_12, inmux3Pc_11,
         inmux3Pc_10, inmux3Pc_9, inmux3Pc_8, inmux3Pc_7, inmux3Pc_6, inmux3Pc_5,
         inmux3Pc_4, inmux3Pc_3, inmux3Pc_2, inmux3Pc_1, inMuxPc5_0, GND, PWR,
         nx8, nx12, nx64, nx68, nx72, nx76, nx80, nx84, nx88, nx186, nx190,
         nx194, nx198, nx202, nx206, nx210, nx304, nx308, nx312, nx316, nx320,
         nx324, nx422, nx432, nx436, nx440, nx444, nx448, nx450, nx458, nx468,
         nx478, nx488, nx498, nx508, nx598, nx620, nx622, nx630, nx640, nx650,
         nx660, nx670, nx724, nx732, nx742, nx750, nx754, nx760, nx762, nx772,
         nx774, nx780, nx792, nx802, nx812, nx822, nx832, nx842, nx852, nx862,
         nx954, nx962, nx972, nx980, nx984, nx990, nx992, nx1002, nx1004, nx1010,
         nx1022, nx1032, nx1042, nx1052, nx1062, nx1072, nx1082, nx919, nx923,
         nx927, nx935, nx943, nx951, nx959, nx967, nx975, nx987, nx991, nx995,
         nx1003, nx1011, nx1019, nx1027, nx1035, nx1043, nx1051, nx1059, nx1067,
         nx1075, nx1083, nx1091, nx1099, nx1109, nx1113, nx1117, nx1125, nx1133,
         nx1137, nx1139, nx1143, nx1151, nx1159, nx1167, nx1171, nx1176, nx1178,
         nx1185, nx1188, nx1192, nx1196, nx1198, nx1202, nx1204, nx1208, nx1210,
         nx1214, nx1216, nx1222, nx1224, nx1228, nx1231, nx1235, nx1239, nx1241,
         nx1245, nx1247, nx1251, nx1253, nx1259, nx1261, nx1263, nx1267, nx1270,
         nx1276, nx1279, nx1283, nx1286, nx1292, nx1294, nx1297, nx1301, nx1305,
         nx1307, nx1311, nx1313, nx1317, nx1319, nx1323, nx1325, nx1329, nx1331,
         nx1335, nx1337, nx1341, nx1343, nx1347, nx1351, nx1353, nx1357, nx1360,
         nx1366, nx1369, nx1373, nx1376, nx1382, nx1384, nx1387, nx1391, nx1395,
         nx1397, nx1401, nx1403, nx1407, nx1409, nx1413, nx1415, nx1419, nx1421,
         nx1425, nx1427, nx1434, nx1436, nx1440, nx1442, nx1448, nx1456, nx1458,
         nx1464, nx1466, nx1472, nx1474, nx1476, nx1482, nx1484, nx1486, nx1492,
         nx1494, nx1498, nx1500, nx1502, nx1506, nx1508, nx1510, nx1512, nx1514,
         nx1516, nx1518, nx1520, nx1524, nx1526, nx1528, nx1532, nx1534, nx1536,
         nx1540, nx1542, nx1546, nx1548, nx1554, nx1556, nx1558, nx1560, nx1562,
         nx1564, nx1566, nx1568, nx1570, nx1572, nx1574, nx1576, nx1578, nx1580,
         nx1582, nx1584, nx1586, nx1588, nx1590, nx1592, nx1594, nx1596, nx1598,
         nx1600, nx1602, nx1604, nx1606, nx1608, nx1610, nx1612, nx1614, nx1616,
         nx1618;



    pcmux_17 mux1 (.IN1 ({nx1434,nx1440,nx1448,nx1456,nx1464,nx1472,nx1482,
             nx1492,nx1500,nx1506,nx1510,nx1514,nx1518,nx1524,nx1532,nx1540,
             nx1546}), .IN2 ({inMuxPc2_16,inMuxPc2_15,inMuxPc2_14,inMuxPc2_13,
             inMuxPc2_12,inMuxPc2_11,inMuxPc2_10,inMuxPc2_9,inMuxPc2_8,
             inMuxPc2_7,inMuxPc2_6,inMuxPc2_5,inMuxPc2_4,inMuxPc2_3,inMuxPc2_2,
             inMuxPc5_1,inMuxPc5_0}), .IN3 ({inMuxPc3_16,inMuxPc3_15,inMuxPc3_14
             ,inMuxPc3_13,inMuxPc3_12,inMuxPc3_11,inMuxPc3_10,inMuxPc3_9,
             inMuxPc3_8,inMuxPc3_7,inMuxPc3_6,inMuxPc3_5,inMuxPc3_4,inMuxPc3_3,
             inMuxPc3_2,inMuxPc3_1,inMuxPc5_0}), .IN4 ({inMuxPc4_16,inMuxPc4_15,
             inMuxPc4_14,inMuxPc4_13,inMuxPc4_12,inMuxPc4_11,inMuxPc4_10,
             inMuxPc4_9,inMuxPc5_8,inMuxPc5_7,inMuxPc5_6,inMuxPc5_5,inMuxPc5_4,
             inMuxPc5_3,inMuxPc5_2,inMuxPc5_1,inMuxPc5_0}), .IN5 ({inMuxPc5_16,
             inMuxPc5_15,inMuxPc5_14,inMuxPc5_13,inMuxPc5_12,inMuxPc5_11,
             inMuxPc5_10,inMuxPc5_9,inMuxPc5_8,inMuxPc5_7,inMuxPc5_6,inMuxPc5_5,
             inMuxPc5_4,inMuxPc5_3,inMuxPc5_2,inMuxPc5_1,inMuxPc5_0}), .IN6 ({
             inMuxPc6_16,inMuxPc6_15,inMuxPc6_14,inMuxPc6_13,inMuxPc6_12,
             inMuxPc6_11,inMuxPc6_10,inMuxPc6_9,nx1558,nx1506,nx1510,nx1514,
             nx1518,nx1524,nx1532,nx1540,nx1546}), .SEl ({K,R,F}), .OUT1 ({
             out_muxPC_16,out_muxPC_15,out_muxPC_14,out_muxPC_13,out_muxPC_12,
             out_muxPC_11,out_muxPC_10,out_muxPC_9,out_muxPC_8,out_muxPC_7,
             out_muxPC_6,out_muxPC_5,out_muxPC_4,out_muxPC_3,out_muxPC_2,
             out_muxPC_1,out_muxPC_0})) ;
    mux_17 mux2 (.IN1 ({out_muxPC_16,out_muxPC_15,out_muxPC_14,out_muxPC_13,
           out_muxPC_12,out_muxPC_11,out_muxPC_10,out_muxPC_9,out_muxPC_8,
           out_muxPC_7,out_muxPC_6,out_muxPC_5,out_muxPC_4,out_muxPC_3,
           out_muxPC_2,out_muxPC_1,out_muxPC_0}), .IN2 ({inmux3Pc_16,inmux3Pc_15
           ,inmux3Pc_14,inmux3Pc_13,inmux3Pc_12,inmux3Pc_11,inmux3Pc_10,
           inmux3Pc_9,inmux3Pc_8,inmux3Pc_7,inmux3Pc_6,inmux3Pc_5,inmux3Pc_4,
           inmux3Pc_3,inmux3Pc_2,inmux3Pc_1,nx1562}), .IN3 ({inmux2Pc_16,
           inmux2Pc_15,inmux2Pc_14,inmux2Pc_13,inmux2Pc_12,inmux2Pc_11,
           inmux2Pc_10,inmux2Pc_9,inmux2Pc_8,inmux2Pc_7,inmux2Pc_6,inmux2Pc_5,
           inmux2Pc_4,inmux2Pc_3,inmux2Pc_2,inmux2Pc_1,nx1562}), .SEl ({Read_F,
           Filter}), .OUT1 ({out_mux2_16,out_mux2_15,out_mux2_14,out_mux2_13,
           out_mux2_12,out_mux2_11,out_mux2_10,out_mux2_9,out_mux2_8,out_mux2_7,
           out_mux2_6,out_mux2_5,out_mux2_4,out_mux2_3,out_mux2_2,out_mux2_1,
           out_mux2_0})) ;
    RegPc Reg1 (.Clk (CLK), .Rst (RST), .num (GND), .e (PC_en), .d ({out_mux2_16
          ,out_mux2_15,out_mux2_14,out_mux2_13,out_mux2_12,out_mux2_11,
          out_mux2_10,out_mux2_9,out_mux2_8,out_mux2_7,out_mux2_6,out_mux2_5,
          out_mux2_4,out_mux2_3,out_mux2_2,out_mux2_1,out_mux2_0}), .q ({
          RegPc_out_16,RegPc_out_15,RegPc_out_14,RegPc_out_13,RegPc_out_12,
          RegPc_out_11,RegPc_out_10,RegPc_out_9,RegPc_out_8,RegPc_out_7,
          RegPc_out_6,RegPc_out_5,RegPc_out_4,RegPc_out_3,RegPc_out_2,
          RegPc_out_1,RegPc_out_0})) ;
    mux_2_17 muxForAddr (.IN1 ({nx1434,nx1440,nx1448,nx1456,nx1464,nx1472,nx1482
             ,nx1492,nx1500,nx1506,nx1510,nx1514,nx1518,nx1524,nx1532,nx1540,
             nx1546}), .IN2 ({pcOut_image_16,pcOut_image_15,pcOut_image_14,
             pcOut_image_13,pcOut_image_12,pcOut_image_11,pcOut_image_10,
             pcOut_image_9,pcOut_image_8,pcOut_image_7,pcOut_image_6,
             pcOut_image_5,pcOut_image_4,pcOut_image_3,pcOut_image_2,
             pcOut_image_1,pcOut_image_0}), .SEl (pcSrc), .OUT1 ({ramAddr[16],
             ramAddr[15],ramAddr[14],ramAddr[13],ramAddr[12],ramAddr[11],
             ramAddr[10],ramAddr[9],ramAddr[8],ramAddr[7],ramAddr[6],ramAddr[5],
             ramAddr[4],ramAddr[3],ramAddr[2],ramAddr[1],ramAddr[0]})) ;
    RegPc Reg2 (.Clk (CLK), .Rst (RST), .num (PWR), .e (PC_en2), .d ({
          pcOut_image_in_16,pcOut_image_in_15,pcOut_image_in_14,
          pcOut_image_in_13,pcOut_image_in_12,pcOut_image_in_11,
          pcOut_image_in_10,pcOut_image_in_9,pcOut_image_in_8,pcOut_image_in_7,
          pcOut_image_in_6,pcOut_image_in_5,pcOut_image_in_4,pcOut_image_in_3,
          pcOut_image_in_2,pcOut_image_in_1,pcOut_image_in_0}), .q ({
          pcOut_image_16,pcOut_image_15,pcOut_image_14,pcOut_image_13,
          pcOut_image_12,pcOut_image_11,pcOut_image_10,pcOut_image_9,
          pcOut_image_8,pcOut_image_7,pcOut_image_6,pcOut_image_5,pcOut_image_4,
          pcOut_image_3,pcOut_image_2,pcOut_image_1,pcOut_image_0})) ;
    fake_vcc ix863 (.Y (PWR)) ;
    fake_gnd ix861 (.Y (GND)) ;
    xor2 ix163 (.Y (inmux3Pc_4), .A0 (nx1518), .A1 (nx64)) ;
    xnor2 ix157 (.Y (inmux3Pc_5), .A0 (nx1514), .A1 (nx935)) ;
    nand02 ix936 (.Y (nx935), .A0 (nx1518), .A1 (nx64)) ;
    xor2 ix151 (.Y (inmux3Pc_6), .A0 (nx1510), .A1 (nx68)) ;
    nor02ii ix69 (.Y (nx68), .A0 (nx935), .A1 (nx1514)) ;
    xnor2 ix145 (.Y (inmux3Pc_7), .A0 (nx1506), .A1 (nx943)) ;
    nand02 ix944 (.Y (nx943), .A0 (nx1510), .A1 (nx68)) ;
    nor02ii ix73 (.Y (nx72), .A0 (nx943), .A1 (nx1506)) ;
    nand02 ix952 (.Y (nx951), .A0 (nx1500), .A1 (nx72)) ;
    nand02 ix960 (.Y (nx959), .A0 (nx1482), .A1 (nx76)) ;
    nand02 ix968 (.Y (nx967), .A0 (nx1464), .A1 (nx80)) ;
    nand02 ix976 (.Y (nx975), .A0 (nx1448), .A1 (nx84)) ;
    xor2 ix91 (.Y (inmux3Pc_16), .A0 (nx88), .A1 (nx1434)) ;
    inv01 ix982 (.Y (pcOut_image_in_0), .A (pcOut_image_0)) ;
    xor2 ix419 (.Y (pcOut_image_in_1), .A0 (pcOut_image_0), .A1 (pcOut_image_1)
         ) ;
    xnor2 ix413 (.Y (pcOut_image_in_2), .A0 (pcOut_image_2), .A1 (nx987)) ;
    nand02 ix988 (.Y (nx987), .A0 (pcOut_image_0), .A1 (pcOut_image_1)) ;
    xnor2 ix407 (.Y (pcOut_image_in_3), .A0 (pcOut_image_3), .A1 (nx991)) ;
    nand03 ix992 (.Y (nx991), .A0 (pcOut_image_2), .A1 (pcOut_image_0), .A2 (
           pcOut_image_1)) ;
    xnor2 ix401 (.Y (pcOut_image_in_4), .A0 (pcOut_image_4), .A1 (nx995)) ;
    nand04 ix996 (.Y (nx995), .A0 (pcOut_image_3), .A1 (pcOut_image_2), .A2 (
           pcOut_image_0), .A3 (pcOut_image_1)) ;
    xor2 ix395 (.Y (pcOut_image_in_5), .A0 (pcOut_image_5), .A1 (nx304)) ;
    nor02ii ix305 (.Y (nx304), .A0 (nx995), .A1 (pcOut_image_4)) ;
    xnor2 ix389 (.Y (pcOut_image_in_6), .A0 (pcOut_image_6), .A1 (nx1003)) ;
    nand02 ix1004 (.Y (nx1003), .A0 (pcOut_image_5), .A1 (nx304)) ;
    xor2 ix383 (.Y (pcOut_image_in_7), .A0 (pcOut_image_7), .A1 (nx308)) ;
    nor02ii ix309 (.Y (nx308), .A0 (nx1003), .A1 (pcOut_image_6)) ;
    xnor2 ix377 (.Y (pcOut_image_in_8), .A0 (pcOut_image_8), .A1 (nx1011)) ;
    nand02 ix1012 (.Y (nx1011), .A0 (pcOut_image_7), .A1 (nx308)) ;
    xor2 ix371 (.Y (pcOut_image_in_9), .A0 (pcOut_image_9), .A1 (nx312)) ;
    nor02ii ix313 (.Y (nx312), .A0 (nx1011), .A1 (pcOut_image_8)) ;
    xnor2 ix365 (.Y (pcOut_image_in_10), .A0 (pcOut_image_10), .A1 (nx1019)) ;
    nand02 ix1020 (.Y (nx1019), .A0 (pcOut_image_9), .A1 (nx312)) ;
    xor2 ix359 (.Y (pcOut_image_in_11), .A0 (pcOut_image_11), .A1 (nx316)) ;
    nor02ii ix317 (.Y (nx316), .A0 (nx1019), .A1 (pcOut_image_10)) ;
    xnor2 ix353 (.Y (pcOut_image_in_12), .A0 (pcOut_image_12), .A1 (nx1027)) ;
    nand02 ix1028 (.Y (nx1027), .A0 (pcOut_image_11), .A1 (nx316)) ;
    xor2 ix347 (.Y (pcOut_image_in_13), .A0 (pcOut_image_13), .A1 (nx320)) ;
    nor02ii ix321 (.Y (nx320), .A0 (nx1027), .A1 (pcOut_image_12)) ;
    xnor2 ix341 (.Y (pcOut_image_in_14), .A0 (pcOut_image_14), .A1 (nx1035)) ;
    nand02 ix1036 (.Y (nx1035), .A0 (pcOut_image_13), .A1 (nx320)) ;
    xor2 ix335 (.Y (pcOut_image_in_15), .A0 (pcOut_image_15), .A1 (nx324)) ;
    nor02ii ix325 (.Y (nx324), .A0 (nx1035), .A1 (pcOut_image_14)) ;
    xnor2 ix329 (.Y (pcOut_image_in_16), .A0 (pcOut_image_16), .A1 (nx1043)) ;
    nand02 ix1044 (.Y (nx1043), .A0 (pcOut_image_15), .A1 (nx324)) ;
    aoi21 ix181 (.Y (inmux2Pc_1), .A0 (nx1548), .A1 (nx1540), .B0 (nx923)) ;
    aoi21 ix1052 (.Y (nx1051), .A0 (nx1548), .A1 (nx1542), .B0 (nx1532)) ;
    xor2 ix285 (.Y (inmux2Pc_4), .A0 (nx1518), .A1 (nx186)) ;
    xnor2 ix279 (.Y (inmux2Pc_5), .A0 (nx1514), .A1 (nx1059)) ;
    nand02 ix1060 (.Y (nx1059), .A0 (nx1518), .A1 (nx186)) ;
    xor2 ix273 (.Y (inmux2Pc_6), .A0 (nx1510), .A1 (nx190)) ;
    nor02ii ix191 (.Y (nx190), .A0 (nx1059), .A1 (nx1514)) ;
    xnor2 ix267 (.Y (inmux2Pc_7), .A0 (nx1506), .A1 (nx1067)) ;
    nand02 ix1068 (.Y (nx1067), .A0 (nx1510), .A1 (nx190)) ;
    nor02ii ix195 (.Y (nx194), .A0 (nx1067), .A1 (nx1506)) ;
    nand02 ix1076 (.Y (nx1075), .A0 (nx1500), .A1 (nx194)) ;
    nand02 ix1084 (.Y (nx1083), .A0 (nx1482), .A1 (nx198)) ;
    nand02 ix1092 (.Y (nx1091), .A0 (nx1464), .A1 (nx202)) ;
    nand02 ix1100 (.Y (nx1099), .A0 (nx1448), .A1 (nx206)) ;
    xor2 ix213 (.Y (inmux2Pc_16), .A0 (nx210), .A1 (nx1434)) ;
    nand02 ix1126 (.Y (nx1125), .A0 (nx1458), .A1 (nx8)) ;
    xnor2 ix17 (.Y (inMuxPc6_16), .A0 (nx1434), .A1 (nx1133)) ;
    nand02 ix1134 (.Y (nx1133), .A0 (nx1442), .A1 (nx12)) ;
    nand02 ix1138 (.Y (nx1137), .A0 (stride[0]), .A1 (nx1548)) ;
    aoi32 ix1144 (.Y (nx1143), .A0 (stride[0]), .A1 (nx1548), .A2 (nx1139), .B0 (
          nx1542), .B1 (stride[1])) ;
    xnor2 ix589 (.Y (inMuxPc5_4), .A0 (nx1520), .A1 (nx1151)) ;
    nand02 ix1152 (.Y (nx1151), .A0 (nx1526), .A1 (nx432)) ;
    xor2 ix583 (.Y (inMuxPc5_5), .A0 (nx1516), .A1 (nx436)) ;
    nor02ii ix437 (.Y (nx436), .A0 (nx1151), .A1 (nx1520)) ;
    xnor2 ix577 (.Y (inMuxPc5_6), .A0 (nx1512), .A1 (nx1159)) ;
    nand02 ix1160 (.Y (nx1159), .A0 (nx1516), .A1 (nx436)) ;
    xor2 ix571 (.Y (inMuxPc5_7), .A0 (nx1508), .A1 (nx440)) ;
    nor02ii ix441 (.Y (nx440), .A0 (nx1159), .A1 (nx1512)) ;
    nand02 ix1168 (.Y (nx1167), .A0 (nx1508), .A1 (nx440)) ;
    aoi21 ix1170 (.Y (inMuxPc5_9), .A0 (nx1494), .A1 (nx1171), .B0 (nx448)) ;
    nand02 ix1172 (.Y (nx1171), .A0 (nx1494), .A1 (nx444)) ;
    xnor2 ix549 (.Y (inMuxPc5_10), .A0 (nx448), .A1 (nx1176)) ;
    aoi21 ix1177 (.Y (nx1176), .A0 (nx1494), .A1 (nx1484), .B0 (nx1178)) ;
    xnor2 ix543 (.Y (inMuxPc5_11), .A0 (nx458), .A1 (nx1185)) ;
    aoi21 ix1186 (.Y (nx1185), .A0 (nx1474), .A1 (nx450), .B0 (nx1188)) ;
    xnor2 ix537 (.Y (inMuxPc5_12), .A0 (nx468), .A1 (nx1192)) ;
    xnor2 ix531 (.Y (inMuxPc5_13), .A0 (nx478), .A1 (nx1196)) ;
    nor02ii ix479 (.Y (nx478), .A0 (nx1192), .A1 (nx468)) ;
    xnor2 ix525 (.Y (inMuxPc5_14), .A0 (nx488), .A1 (nx1202)) ;
    nor02ii ix489 (.Y (nx488), .A0 (nx1196), .A1 (nx478)) ;
    xnor2 ix519 (.Y (inMuxPc5_15), .A0 (nx498), .A1 (nx1208)) ;
    nor02ii ix499 (.Y (nx498), .A0 (nx1202), .A1 (nx488)) ;
    xnor2 ix513 (.Y (inMuxPc5_16), .A0 (nx508), .A1 (nx1214)) ;
    nor02ii ix509 (.Y (nx508), .A0 (nx1208), .A1 (nx498)) ;
    xnor2 ix1215 (.Y (nx1214), .A0 (nx1434), .A1 (nx1216)) ;
    aoi21 ix713 (.Y (inMuxPc4_10), .A0 (nx1171), .A1 (nx1486), .B0 (nx620)) ;
    xnor2 ix705 (.Y (inMuxPc4_11), .A0 (nx620), .A1 (nx1222)) ;
    aoi21 ix1223 (.Y (nx1222), .A0 (nx1474), .A1 (nx1486), .B0 (nx1224)) ;
    xnor2 ix699 (.Y (inMuxPc4_12), .A0 (nx630), .A1 (nx1228)) ;
    nor03_2x ix631 (.Y (nx630), .A0 (nx1486), .A1 (nx1171), .A2 (nx1476)) ;
    aoi21 ix1229 (.Y (nx1228), .A0 (nx1466), .A1 (nx622), .B0 (nx1231)) ;
    xnor2 ix693 (.Y (inMuxPc4_13), .A0 (nx640), .A1 (nx1235)) ;
    xnor2 ix687 (.Y (inMuxPc4_14), .A0 (nx650), .A1 (nx1239)) ;
    nor02ii ix651 (.Y (nx650), .A0 (nx1235), .A1 (nx640)) ;
    xnor2 ix681 (.Y (inMuxPc4_15), .A0 (nx660), .A1 (nx1245)) ;
    nor02ii ix661 (.Y (nx660), .A0 (nx1239), .A1 (nx650)) ;
    xnor2 ix675 (.Y (inMuxPc4_16), .A0 (nx670), .A1 (nx1251)) ;
    nor02ii ix671 (.Y (nx670), .A0 (nx1245), .A1 (nx660)) ;
    xnor2 ix1252 (.Y (nx1251), .A0 (nx1434), .A1 (nx1253)) ;
    xnor2 ix1256 (.Y (inMuxPc3_1), .A0 (nx1137), .A1 (nx422)) ;
    xor2 ix951 (.Y (inMuxPc3_2), .A0 (nx1259), .A1 (nx1261)) ;
    mux21_ni ix1260 (.Y (nx1259), .A0 (nx1542), .A1 (nx1137), .S0 (nx422)) ;
    oai21 ix1262 (.Y (nx1261), .A0 (nx1534), .A1 (nx1542), .B0 (nx1263)) ;
    xnor2 ix945 (.Y (inMuxPc3_3), .A0 (nx732), .A1 (nx1267)) ;
    nor02_2x ix733 (.Y (nx732), .A0 (nx1259), .A1 (nx1261)) ;
    oai21 ix1268 (.Y (nx1267), .A0 (nx724), .A1 (nx1526), .B0 (nx1270)) ;
    xor2 ix939 (.Y (inMuxPc3_4), .A0 (nx742), .A1 (nx750)) ;
    nor02ii ix743 (.Y (nx742), .A0 (nx1267), .A1 (nx732)) ;
    xnor2 ix751 (.Y (nx750), .A0 (nx1520), .A1 (nx1270)) ;
    xnor2 ix933 (.Y (inMuxPc3_5), .A0 (nx1276), .A1 (nx760)) ;
    nand02 ix1277 (.Y (nx1276), .A0 (nx742), .A1 (nx750)) ;
    xnor2 ix761 (.Y (nx760), .A0 (nx1516), .A1 (nx1279)) ;
    xnor2 ix927 (.Y (inMuxPc3_6), .A0 (nx762), .A1 (nx1283)) ;
    nor02ii ix763 (.Y (nx762), .A0 (nx1276), .A1 (nx760)) ;
    oai21 ix1284 (.Y (nx1283), .A0 (nx754), .A1 (nx1512), .B0 (nx1286)) ;
    nor02ii ix755 (.Y (nx754), .A0 (nx1279), .A1 (nx1516)) ;
    nand02 ix1287 (.Y (nx1286), .A0 (nx1512), .A1 (nx754)) ;
    xor2 ix921 (.Y (inMuxPc3_7), .A0 (nx772), .A1 (nx780)) ;
    nor02ii ix773 (.Y (nx772), .A0 (nx1283), .A1 (nx762)) ;
    xnor2 ix781 (.Y (nx780), .A0 (nx1508), .A1 (nx1286)) ;
    xor2 ix915 (.Y (inMuxPc3_8), .A0 (nx1292), .A1 (nx1294)) ;
    nand02 ix1293 (.Y (nx1292), .A0 (nx772), .A1 (nx780)) ;
    oai21 ix1295 (.Y (nx1294), .A0 (nx774), .A1 (nx1502), .B0 (nx1297)) ;
    nor02ii ix775 (.Y (nx774), .A0 (nx1286), .A1 (nx1508)) ;
    nand02 ix1298 (.Y (nx1297), .A0 (nx1502), .A1 (nx774)) ;
    xnor2 ix909 (.Y (inMuxPc3_9), .A0 (nx792), .A1 (nx1301)) ;
    nor02_2x ix793 (.Y (nx792), .A0 (nx1292), .A1 (nx1294)) ;
    xnor2 ix903 (.Y (inMuxPc3_10), .A0 (nx802), .A1 (nx1305)) ;
    nor02ii ix803 (.Y (nx802), .A0 (nx1301), .A1 (nx792)) ;
    xnor2 ix897 (.Y (inMuxPc3_11), .A0 (nx812), .A1 (nx1311)) ;
    nor02ii ix813 (.Y (nx812), .A0 (nx1305), .A1 (nx802)) ;
    xnor2 ix891 (.Y (inMuxPc3_12), .A0 (nx822), .A1 (nx1317)) ;
    nor02ii ix823 (.Y (nx822), .A0 (nx1311), .A1 (nx812)) ;
    xnor2 ix885 (.Y (inMuxPc3_13), .A0 (nx832), .A1 (nx1323)) ;
    nor02ii ix833 (.Y (nx832), .A0 (nx1317), .A1 (nx822)) ;
    xnor2 ix879 (.Y (inMuxPc3_14), .A0 (nx842), .A1 (nx1329)) ;
    nor02ii ix843 (.Y (nx842), .A0 (nx1323), .A1 (nx832)) ;
    xnor2 ix873 (.Y (inMuxPc3_15), .A0 (nx852), .A1 (nx1335)) ;
    nor02ii ix853 (.Y (nx852), .A0 (nx1329), .A1 (nx842)) ;
    xnor2 ix868 (.Y (inMuxPc3_16), .A0 (nx862), .A1 (nx1341)) ;
    nor02ii ix866 (.Y (nx862), .A0 (nx1335), .A1 (nx852)) ;
    xnor2 ix1342 (.Y (nx1341), .A0 (nx1436), .A1 (nx1343)) ;
    oai21 ix607 (.Y (inMuxPc2_2), .A0 (nx1534), .A1 (nx598), .B0 (nx1347)) ;
    xnor2 ix1165 (.Y (inMuxPc2_3), .A0 (nx598), .A1 (nx1351)) ;
    oai21 ix1352 (.Y (nx1351), .A0 (nx1536), .A1 (nx1526), .B0 (nx1353)) ;
    xnor2 ix1159 (.Y (inMuxPc2_4), .A0 (nx962), .A1 (nx1357)) ;
    nor02ii ix963 (.Y (nx962), .A0 (nx1351), .A1 (nx598)) ;
    oai21 ix1358 (.Y (nx1357), .A0 (nx954), .A1 (nx1520), .B0 (nx1360)) ;
    nand03 ix1361 (.Y (nx1360), .A0 (nx1520), .A1 (nx1528), .A2 (nx1536)) ;
    xor2 ix1153 (.Y (inMuxPc2_5), .A0 (nx972), .A1 (nx980)) ;
    nor02ii ix973 (.Y (nx972), .A0 (nx1357), .A1 (nx962)) ;
    xnor2 ix981 (.Y (nx980), .A0 (nx1516), .A1 (nx1360)) ;
    xnor2 ix1147 (.Y (inMuxPc2_6), .A0 (nx1366), .A1 (nx990)) ;
    nand02 ix1367 (.Y (nx1366), .A0 (nx972), .A1 (nx980)) ;
    xnor2 ix991 (.Y (nx990), .A0 (nx1512), .A1 (nx1369)) ;
    nand04 ix1370 (.Y (nx1369), .A0 (nx1516), .A1 (nx1520), .A2 (nx1528), .A3 (
           nx1536)) ;
    xnor2 ix1141 (.Y (inMuxPc2_7), .A0 (nx992), .A1 (nx1373)) ;
    nor02ii ix993 (.Y (nx992), .A0 (nx1366), .A1 (nx990)) ;
    oai21 ix1374 (.Y (nx1373), .A0 (nx984), .A1 (nx1508), .B0 (nx1376)) ;
    nor02ii ix985 (.Y (nx984), .A0 (nx1369), .A1 (nx1512)) ;
    nand02 ix1377 (.Y (nx1376), .A0 (nx1508), .A1 (nx984)) ;
    xor2 ix1135 (.Y (inMuxPc2_8), .A0 (nx1002), .A1 (nx1010)) ;
    nor02ii ix1003 (.Y (nx1002), .A0 (nx1373), .A1 (nx992)) ;
    xor2 ix1129 (.Y (inMuxPc2_9), .A0 (nx1382), .A1 (nx1384)) ;
    nand02 ix1383 (.Y (nx1382), .A0 (nx1002), .A1 (nx1010)) ;
    oai21 ix1385 (.Y (nx1384), .A0 (nx1004), .A1 (nx1498), .B0 (nx1387)) ;
    nand02 ix1388 (.Y (nx1387), .A0 (nx1498), .A1 (nx1004)) ;
    xnor2 ix1123 (.Y (inMuxPc2_10), .A0 (nx1022), .A1 (nx1391)) ;
    nor02_2x ix1023 (.Y (nx1022), .A0 (nx1382), .A1 (nx1384)) ;
    xnor2 ix1117 (.Y (inMuxPc2_11), .A0 (nx1032), .A1 (nx1395)) ;
    nor02ii ix1033 (.Y (nx1032), .A0 (nx1391), .A1 (nx1022)) ;
    xnor2 ix1111 (.Y (inMuxPc2_12), .A0 (nx1042), .A1 (nx1401)) ;
    nor02ii ix1043 (.Y (nx1042), .A0 (nx1395), .A1 (nx1032)) ;
    xnor2 ix1105 (.Y (inMuxPc2_13), .A0 (nx1052), .A1 (nx1407)) ;
    nor02ii ix1053 (.Y (nx1052), .A0 (nx1401), .A1 (nx1042)) ;
    xnor2 ix1099 (.Y (inMuxPc2_14), .A0 (nx1062), .A1 (nx1413)) ;
    nor02ii ix1063 (.Y (nx1062), .A0 (nx1407), .A1 (nx1052)) ;
    xnor2 ix1093 (.Y (inMuxPc2_15), .A0 (nx1072), .A1 (nx1419)) ;
    nor02ii ix1073 (.Y (nx1072), .A0 (nx1413), .A1 (nx1062)) ;
    xnor2 ix1087 (.Y (inMuxPc2_16), .A0 (nx1082), .A1 (nx1425)) ;
    nor02ii ix1083 (.Y (nx1082), .A0 (nx1419), .A1 (nx1072)) ;
    xnor2 ix1426 (.Y (nx1425), .A0 (nx1436), .A1 (nx1427)) ;
    inv01 ix955 (.Y (nx954), .A (nx1353)) ;
    inv01 ix725 (.Y (nx724), .A (nx1263)) ;
    inv01 ix623 (.Y (nx622), .A (nx1224)) ;
    inv01 ix451 (.Y (nx450), .A (nx1178)) ;
    inv01 ix1348 (.Y (nx1347), .A (nx432)) ;
    inv01 ix1140 (.Y (nx1139), .A (nx422)) ;
    inv01 ix918 (.Y (inmux3Pc_1), .A (inmux2Pc_1)) ;
    inv01 ix611 (.Y (inMuxPc5_1), .A (inMuxPc3_1)) ;
    inv01 ix557 (.Y (inMuxPc4_9), .A (inMuxPc5_9)) ;
    inv01 ix1142 (.Y (inMuxPc5_2), .A (inMuxPc2_2)) ;
    buf02 ix1433 (.Y (nx1434), .A (RegPc_out_16)) ;
    buf02 ix1435 (.Y (nx1436), .A (RegPc_out_16)) ;
    inv02 ix1439 (.Y (nx1440), .A (nx1566)) ;
    inv02 ix1441 (.Y (nx1442), .A (nx1566)) ;
    inv02 ix1447 (.Y (nx1448), .A (nx1572)) ;
    inv02 ix1455 (.Y (nx1456), .A (nx1576)) ;
    inv02 ix1457 (.Y (nx1458), .A (nx1576)) ;
    inv02 ix1463 (.Y (nx1464), .A (nx1582)) ;
    inv02 ix1465 (.Y (nx1466), .A (nx1582)) ;
    inv02 ix1471 (.Y (nx1472), .A (nx1588)) ;
    inv02 ix1473 (.Y (nx1474), .A (nx1588)) ;
    inv02 ix1475 (.Y (nx1476), .A (nx1588)) ;
    inv02 ix1481 (.Y (nx1482), .A (nx1594)) ;
    inv02 ix1483 (.Y (nx1484), .A (nx1594)) ;
    inv02 ix1485 (.Y (nx1486), .A (nx1594)) ;
    inv02 ix1491 (.Y (nx1492), .A (nx1602)) ;
    inv02 ix1493 (.Y (nx1494), .A (nx1602)) ;
    inv02 ix1497 (.Y (nx1498), .A (nx1602)) ;
    inv02 ix1499 (.Y (nx1500), .A (nx1558)) ;
    inv02 ix1501 (.Y (nx1502), .A (nx1558)) ;
    buf02 ix1505 (.Y (nx1506), .A (RegPc_out_7)) ;
    buf02 ix1507 (.Y (nx1508), .A (RegPc_out_7)) ;
    buf02 ix1509 (.Y (nx1510), .A (RegPc_out_6)) ;
    buf02 ix1511 (.Y (nx1512), .A (RegPc_out_6)) ;
    buf02 ix1513 (.Y (nx1514), .A (RegPc_out_5)) ;
    buf02 ix1515 (.Y (nx1516), .A (RegPc_out_5)) ;
    buf02 ix1517 (.Y (nx1518), .A (RegPc_out_4)) ;
    buf02 ix1519 (.Y (nx1520), .A (RegPc_out_4)) ;
    inv02 ix1523 (.Y (nx1524), .A (nx1608)) ;
    inv02 ix1525 (.Y (nx1526), .A (nx1608)) ;
    inv02 ix1527 (.Y (nx1528), .A (nx1608)) ;
    inv02 ix1531 (.Y (nx1532), .A (nx1612)) ;
    inv02 ix1533 (.Y (nx1534), .A (nx1612)) ;
    inv02 ix1535 (.Y (nx1536), .A (nx1612)) ;
    inv02 ix1539 (.Y (nx1540), .A (nx1616)) ;
    inv02 ix1541 (.Y (nx1542), .A (nx1616)) ;
    inv02 ix1545 (.Y (nx1546), .A (nx1562)) ;
    inv02 ix1547 (.Y (nx1548), .A (nx1562)) ;
    xnor2 ix617 (.Y (inMuxPc5_0), .A0 (stride[0]), .A1 (nx1562)) ;
    or02 ix920 (.Y (nx919), .A0 (nx1562), .A1 (nx1616)) ;
    xor2 ix175 (.Y (inmux3Pc_2), .A0 (nx1612), .A1 (nx923)) ;
    and02 ix924 (.Y (nx923), .A0 (nx1616), .A1 (nx1562)) ;
    xor2 ix169 (.Y (inmux3Pc_3), .A0 (nx1608), .A1 (nx927)) ;
    ao21 ix928 (.Y (nx927), .A0 (nx1616), .A1 (nx1564), .B0 (nx1612)) ;
    nor02_2x ix65 (.Y (nx64), .A0 (nx927), .A1 (nx1608)) ;
    xnor2 ix139 (.Y (inmux3Pc_8), .A0 (nx1558), .A1 (nx72)) ;
    xor2 ix133 (.Y (inmux3Pc_9), .A0 (nx1602), .A1 (nx951)) ;
    xnor2 ix127 (.Y (inmux3Pc_10), .A0 (nx1594), .A1 (nx76)) ;
    nor02_2x ix77 (.Y (nx76), .A0 (nx951), .A1 (nx1602)) ;
    xor2 ix121 (.Y (inmux3Pc_11), .A0 (nx1588), .A1 (nx959)) ;
    xnor2 ix115 (.Y (inmux3Pc_12), .A0 (nx1582), .A1 (nx80)) ;
    nor02_2x ix81 (.Y (nx80), .A0 (nx959), .A1 (nx1588)) ;
    xor2 ix109 (.Y (inmux3Pc_13), .A0 (nx1576), .A1 (nx967)) ;
    xnor2 ix103 (.Y (inmux3Pc_14), .A0 (nx1572), .A1 (nx84)) ;
    nor02_2x ix85 (.Y (nx84), .A0 (nx967), .A1 (nx1576)) ;
    xor2 ix97 (.Y (inmux3Pc_15), .A0 (nx1566), .A1 (nx975)) ;
    nor02_2x ix89 (.Y (nx88), .A0 (nx975), .A1 (nx1566)) ;
    xnor2 ix297 (.Y (inmux2Pc_2), .A0 (nx1612), .A1 (nx919)) ;
    xor2 ix291 (.Y (inmux2Pc_3), .A0 (nx1608), .A1 (nx1051)) ;
    nor02_2x ix187 (.Y (nx186), .A0 (nx1051), .A1 (nx1608)) ;
    xnor2 ix261 (.Y (inmux2Pc_8), .A0 (nx1558), .A1 (nx194)) ;
    xor2 ix255 (.Y (inmux2Pc_9), .A0 (nx1602), .A1 (nx1075)) ;
    xnor2 ix249 (.Y (inmux2Pc_10), .A0 (nx1594), .A1 (nx198)) ;
    nor02_2x ix199 (.Y (nx198), .A0 (nx1075), .A1 (nx1602)) ;
    xor2 ix243 (.Y (inmux2Pc_11), .A0 (nx1588), .A1 (nx1083)) ;
    xnor2 ix237 (.Y (inmux2Pc_12), .A0 (nx1582), .A1 (nx202)) ;
    nor02_2x ix203 (.Y (nx202), .A0 (nx1083), .A1 (nx1588)) ;
    xor2 ix231 (.Y (inmux2Pc_13), .A0 (nx1576), .A1 (nx1091)) ;
    xnor2 ix225 (.Y (inmux2Pc_14), .A0 (nx1572), .A1 (nx206)) ;
    nor02_2x ix207 (.Y (nx206), .A0 (nx1091), .A1 (nx1576)) ;
    xor2 ix219 (.Y (inmux2Pc_15), .A0 (nx1566), .A1 (nx1099)) ;
    nor02_2x ix211 (.Y (nx210), .A0 (nx1099), .A1 (nx1566)) ;
    xor2 ix59 (.Y (inMuxPc6_9), .A0 (nx1558), .A1 (nx1604)) ;
    xor2 ix53 (.Y (inMuxPc6_10), .A0 (nx1594), .A1 (nx1109)) ;
    or02 ix1110 (.Y (nx1109), .A0 (nx1558), .A1 (nx1604)) ;
    xor2 ix47 (.Y (inMuxPc6_11), .A0 (nx1590), .A1 (nx1113)) ;
    or03 ix1114 (.Y (nx1113), .A0 (nx1594), .A1 (nx1560), .A2 (nx1604)) ;
    xor2 ix41 (.Y (inMuxPc6_12), .A0 (nx1582), .A1 (nx1117)) ;
    or04 ix1118 (.Y (nx1117), .A0 (nx1590), .A1 (nx1596), .A2 (nx1560), .A3 (
         nx1604)) ;
    xnor2 ix35 (.Y (inMuxPc6_13), .A0 (nx1576), .A1 (nx8)) ;
    nor02_2x ix9 (.Y (nx8), .A0 (nx1117), .A1 (nx1582)) ;
    xor2 ix29 (.Y (inMuxPc6_14), .A0 (nx1572), .A1 (nx1125)) ;
    xnor2 ix23 (.Y (inMuxPc6_15), .A0 (nx1566), .A1 (nx12)) ;
    nor02_2x ix13 (.Y (nx12), .A0 (nx1125), .A1 (nx1572)) ;
    xnor2 ix595 (.Y (inMuxPc5_3), .A0 (nx1610), .A1 (nx432)) ;
    nor02_2x ix433 (.Y (nx432), .A0 (nx1143), .A1 (nx1612)) ;
    xor2 ix565 (.Y (inMuxPc5_8), .A0 (nx1560), .A1 (nx1167)) ;
    nor02_2x ix445 (.Y (nx444), .A0 (nx1167), .A1 (nx1560)) ;
    and02 ix449 (.Y (nx448), .A0 (nx1604), .A1 (nx444)) ;
    and02 ix1179 (.Y (nx1178), .A0 (nx1596), .A1 (nx1604)) ;
    and03 ix459 (.Y (nx458), .A0 (nx1604), .A1 (nx444), .A2 (nx1596)) ;
    and03 ix1189 (.Y (nx1188), .A0 (nx1596), .A1 (nx1606), .A2 (nx1590)) ;
    and04 ix469 (.Y (nx468), .A0 (nx1606), .A1 (nx444), .A2 (nx1596), .A3 (
          nx1590)) ;
    xor2 ix1193 (.Y (nx1192), .A0 (nx1582), .A1 (nx1188)) ;
    xor2 ix1197 (.Y (nx1196), .A0 (nx1578), .A1 (nx1198)) ;
    and04 ix1199 (.Y (nx1198), .A0 (nx1596), .A1 (nx1606), .A2 (nx1590), .A3 (
          nx1584)) ;
    xor2 ix1203 (.Y (nx1202), .A0 (nx1572), .A1 (nx1204)) ;
    and02 ix1205 (.Y (nx1204), .A0 (nx1578), .A1 (nx1198)) ;
    xor2 ix1209 (.Y (nx1208), .A0 (nx1568), .A1 (nx1210)) ;
    and02 ix1211 (.Y (nx1210), .A0 (nx1572), .A1 (nx1204)) ;
    and02 ix1217 (.Y (nx1216), .A0 (nx1568), .A1 (nx1210)) ;
    nor02ii ix621 (.Y (nx620), .A0 (nx1171), .A1 (nx1596)) ;
    and02 ix1225 (.Y (nx1224), .A0 (nx1598), .A1 (nx1590)) ;
    and03 ix1232 (.Y (nx1231), .A0 (nx1598), .A1 (nx1590), .A2 (nx1584)) ;
    and04 ix641 (.Y (nx640), .A0 (nx1598), .A1 (nx1554), .A2 (nx1592), .A3 (
          nx1584)) ;
    inv01 ix1553 (.Y (nx1554), .A (nx1171)) ;
    xor2 ix1236 (.Y (nx1235), .A0 (nx1578), .A1 (nx1231)) ;
    xor2 ix1240 (.Y (nx1239), .A0 (nx1574), .A1 (nx1241)) ;
    and04 ix1242 (.Y (nx1241), .A0 (nx1598), .A1 (nx1592), .A2 (nx1584), .A3 (
          nx1578)) ;
    xor2 ix1246 (.Y (nx1245), .A0 (nx1568), .A1 (nx1247)) ;
    and02 ix1248 (.Y (nx1247), .A0 (nx1574), .A1 (nx1241)) ;
    and02 ix1254 (.Y (nx1253), .A0 (nx1568), .A1 (nx1247)) ;
    xor2 ix423 (.Y (nx422), .A0 (stride[1]), .A1 (nx1616)) ;
    or02 ix1264 (.Y (nx1263), .A0 (nx1616), .A1 (nx1614)) ;
    or03 ix1271 (.Y (nx1270), .A0 (nx1610), .A1 (nx1618), .A2 (nx1614)) ;
    or04 ix1280 (.Y (nx1279), .A0 (nx1556), .A1 (nx1610), .A2 (nx1618), .A3 (
         nx1614)) ;
    inv01 ix1555 (.Y (nx1556), .A (nx1520)) ;
    xor2 ix1302 (.Y (nx1301), .A0 (nx1606), .A1 (nx1297)) ;
    xor2 ix1306 (.Y (nx1305), .A0 (nx1598), .A1 (nx1307)) ;
    and02 ix1308 (.Y (nx1307), .A0 (nx1606), .A1 (nx1297)) ;
    xor2 ix1312 (.Y (nx1311), .A0 (nx1592), .A1 (nx1313)) ;
    and02 ix1314 (.Y (nx1313), .A0 (nx1598), .A1 (nx1307)) ;
    xor2 ix1318 (.Y (nx1317), .A0 (nx1584), .A1 (nx1319)) ;
    and02 ix1320 (.Y (nx1319), .A0 (nx1592), .A1 (nx1313)) ;
    xor2 ix1324 (.Y (nx1323), .A0 (nx1578), .A1 (nx1325)) ;
    and02 ix1326 (.Y (nx1325), .A0 (nx1584), .A1 (nx1319)) ;
    xor2 ix1330 (.Y (nx1329), .A0 (nx1574), .A1 (nx1331)) ;
    and02 ix1332 (.Y (nx1331), .A0 (nx1578), .A1 (nx1325)) ;
    xor2 ix1336 (.Y (nx1335), .A0 (nx1568), .A1 (nx1337)) ;
    and02 ix1338 (.Y (nx1337), .A0 (nx1574), .A1 (nx1331)) ;
    and02 ix1344 (.Y (nx1343), .A0 (nx1568), .A1 (nx1337)) ;
    nor02ii ix599 (.Y (nx598), .A0 (nx1143), .A1 (nx1614)) ;
    or02 ix1354 (.Y (nx1353), .A0 (nx1610), .A1 (nx1614)) ;
    xor2 ix1011 (.Y (nx1010), .A0 (nx1560), .A1 (nx1376)) ;
    nor02_2x ix1005 (.Y (nx1004), .A0 (nx1376), .A1 (nx1560)) ;
    xor2 ix1392 (.Y (nx1391), .A0 (nx1598), .A1 (nx1387)) ;
    xor2 ix1396 (.Y (nx1395), .A0 (nx1592), .A1 (nx1397)) ;
    and02 ix1398 (.Y (nx1397), .A0 (nx1600), .A1 (nx1387)) ;
    xor2 ix1402 (.Y (nx1401), .A0 (nx1584), .A1 (nx1403)) ;
    and02 ix1404 (.Y (nx1403), .A0 (nx1592), .A1 (nx1397)) ;
    xor2 ix1408 (.Y (nx1407), .A0 (nx1578), .A1 (nx1409)) ;
    and02 ix1410 (.Y (nx1409), .A0 (nx1586), .A1 (nx1403)) ;
    xor2 ix1414 (.Y (nx1413), .A0 (nx1574), .A1 (nx1415)) ;
    and02 ix1416 (.Y (nx1415), .A0 (nx1580), .A1 (nx1409)) ;
    xor2 ix1420 (.Y (nx1419), .A0 (nx1568), .A1 (nx1421)) ;
    and02 ix1422 (.Y (nx1421), .A0 (nx1574), .A1 (nx1415)) ;
    and02 ix1428 (.Y (nx1427), .A0 (nx1570), .A1 (nx1421)) ;
    inv02 ix1557 (.Y (nx1558), .A (RegPc_out_8)) ;
    inv02 ix1559 (.Y (nx1560), .A (RegPc_out_8)) ;
    inv02 ix1561 (.Y (nx1562), .A (RegPc_out_0)) ;
    inv02 ix1563 (.Y (nx1564), .A (RegPc_out_0)) ;
    inv02 ix1565 (.Y (nx1566), .A (RegPc_out_15)) ;
    inv02 ix1567 (.Y (nx1568), .A (RegPc_out_15)) ;
    inv02 ix1569 (.Y (nx1570), .A (RegPc_out_15)) ;
    inv02 ix1571 (.Y (nx1572), .A (RegPc_out_14)) ;
    inv02 ix1573 (.Y (nx1574), .A (RegPc_out_14)) ;
    inv02 ix1575 (.Y (nx1576), .A (RegPc_out_13)) ;
    inv02 ix1577 (.Y (nx1578), .A (RegPc_out_13)) ;
    inv02 ix1579 (.Y (nx1580), .A (RegPc_out_13)) ;
    inv02 ix1581 (.Y (nx1582), .A (RegPc_out_12)) ;
    inv02 ix1583 (.Y (nx1584), .A (RegPc_out_12)) ;
    inv02 ix1585 (.Y (nx1586), .A (RegPc_out_12)) ;
    inv02 ix1587 (.Y (nx1588), .A (RegPc_out_11)) ;
    inv02 ix1589 (.Y (nx1590), .A (RegPc_out_11)) ;
    inv02 ix1591 (.Y (nx1592), .A (RegPc_out_11)) ;
    inv02 ix1593 (.Y (nx1594), .A (RegPc_out_10)) ;
    inv02 ix1595 (.Y (nx1596), .A (RegPc_out_10)) ;
    inv02 ix1597 (.Y (nx1598), .A (RegPc_out_10)) ;
    inv02 ix1599 (.Y (nx1600), .A (RegPc_out_10)) ;
    inv02 ix1601 (.Y (nx1602), .A (RegPc_out_9)) ;
    inv02 ix1603 (.Y (nx1604), .A (RegPc_out_9)) ;
    inv02 ix1605 (.Y (nx1606), .A (RegPc_out_9)) ;
    inv02 ix1607 (.Y (nx1608), .A (RegPc_out_3)) ;
    inv02 ix1609 (.Y (nx1610), .A (RegPc_out_3)) ;
    inv02 ix1611 (.Y (nx1612), .A (RegPc_out_2)) ;
    inv02 ix1613 (.Y (nx1614), .A (RegPc_out_2)) ;
    inv02 ix1615 (.Y (nx1616), .A (RegPc_out_1)) ;
    inv02 ix1617 (.Y (nx1618), .A (RegPc_out_1)) ;
endmodule


module mux_2_17 ( IN1, IN2, SEl, OUT1 ) ;

    input [16:0]IN1 ;
    input [16:0]IN2 ;
    input SEl ;
    output [16:0]OUT1 ;

    wire nx180, nx182, nx184, nx186;



    mux21_ni ix7 (.Y (OUT1[0]), .A0 (IN1[0]), .A1 (IN2[0]), .S0 (nx182)) ;
    mux21_ni ix15 (.Y (OUT1[1]), .A0 (IN1[1]), .A1 (IN2[1]), .S0 (nx182)) ;
    mux21_ni ix23 (.Y (OUT1[2]), .A0 (IN1[2]), .A1 (IN2[2]), .S0 (nx182)) ;
    mux21_ni ix31 (.Y (OUT1[3]), .A0 (IN1[3]), .A1 (IN2[3]), .S0 (nx182)) ;
    mux21_ni ix39 (.Y (OUT1[4]), .A0 (IN1[4]), .A1 (IN2[4]), .S0 (nx182)) ;
    mux21_ni ix47 (.Y (OUT1[5]), .A0 (IN1[5]), .A1 (IN2[5]), .S0 (nx182)) ;
    mux21_ni ix55 (.Y (OUT1[6]), .A0 (IN1[6]), .A1 (IN2[6]), .S0 (nx182)) ;
    mux21_ni ix63 (.Y (OUT1[7]), .A0 (IN1[7]), .A1 (IN2[7]), .S0 (nx184)) ;
    mux21_ni ix71 (.Y (OUT1[8]), .A0 (IN1[8]), .A1 (IN2[8]), .S0 (nx184)) ;
    mux21_ni ix79 (.Y (OUT1[9]), .A0 (IN1[9]), .A1 (IN2[9]), .S0 (nx184)) ;
    mux21_ni ix87 (.Y (OUT1[10]), .A0 (IN1[10]), .A1 (IN2[10]), .S0 (nx184)) ;
    mux21_ni ix95 (.Y (OUT1[11]), .A0 (IN1[11]), .A1 (IN2[11]), .S0 (nx184)) ;
    mux21_ni ix103 (.Y (OUT1[12]), .A0 (IN1[12]), .A1 (IN2[12]), .S0 (nx184)) ;
    mux21_ni ix111 (.Y (OUT1[13]), .A0 (IN1[13]), .A1 (IN2[13]), .S0 (nx184)) ;
    mux21_ni ix119 (.Y (OUT1[14]), .A0 (IN1[14]), .A1 (IN2[14]), .S0 (nx186)) ;
    mux21_ni ix127 (.Y (OUT1[15]), .A0 (IN1[15]), .A1 (IN2[15]), .S0 (nx186)) ;
    mux21_ni ix135 (.Y (OUT1[16]), .A0 (IN1[16]), .A1 (IN2[16]), .S0 (nx186)) ;
    inv01 ix179 (.Y (nx180), .A (SEl)) ;
    inv02 ix181 (.Y (nx182), .A (nx180)) ;
    inv02 ix183 (.Y (nx184), .A (nx180)) ;
    inv02 ix185 (.Y (nx186), .A (nx180)) ;
endmodule


module RegPc ( Clk, Rst, num, e, d, q ) ;

    input Clk ;
    input Rst ;
    input num ;
    input e ;
    input [16:0]d ;
    output [16:0]q ;

    wire nx12, nx16, nx269, nx279, nx289, nx299, nx309, nx319, nx329, nx339,
         nx349, nx359, nx369, nx379, nx389, nx399, nx409, nx419, nx429, nx499,
         nx501, nx503, nx505, nx507;
    wire [16:0] \$dummy ;




    dffr reg_q_0 (.Q (q[0]), .QB (\$dummy [0]), .D (nx269), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix270 (.Y (nx269), .A0 (q[0]), .A1 (d[0]), .S0 (nx501)) ;
    dffr reg_q_1 (.Q (q[1]), .QB (\$dummy [1]), .D (nx279), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix280 (.Y (nx279), .A0 (q[1]), .A1 (d[1]), .S0 (nx501)) ;
    dffr reg_q_2 (.Q (q[2]), .QB (\$dummy [2]), .D (nx289), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix290 (.Y (nx289), .A0 (q[2]), .A1 (d[2]), .S0 (nx501)) ;
    dffsr_ni reg_q_3 (.Q (q[3]), .QB (\$dummy [3]), .D (nx299), .CLK (Clk), .S (
             nx12), .R (nx507)) ;
    mux21_ni ix300 (.Y (nx299), .A0 (q[3]), .A1 (d[3]), .S0 (nx501)) ;
    and02 ix13 (.Y (nx12), .A0 (Rst), .A1 (num)) ;
    dffsr_ni reg_q_4 (.Q (q[4]), .QB (\$dummy [4]), .D (nx309), .CLK (Clk), .S (
             nx12), .R (nx507)) ;
    mux21_ni ix310 (.Y (nx309), .A0 (q[4]), .A1 (d[4]), .S0 (nx501)) ;
    dffr reg_q_5 (.Q (q[5]), .QB (\$dummy [5]), .D (nx319), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix320 (.Y (nx319), .A0 (q[5]), .A1 (d[5]), .S0 (nx501)) ;
    dffr reg_q_6 (.Q (q[6]), .QB (\$dummy [6]), .D (nx329), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix330 (.Y (nx329), .A0 (q[6]), .A1 (d[6]), .S0 (nx501)) ;
    dffr reg_q_7 (.Q (q[7]), .QB (\$dummy [7]), .D (nx339), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix340 (.Y (nx339), .A0 (q[7]), .A1 (d[7]), .S0 (nx503)) ;
    dffr reg_q_8 (.Q (q[8]), .QB (\$dummy [8]), .D (nx349), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix350 (.Y (nx349), .A0 (q[8]), .A1 (d[8]), .S0 (nx503)) ;
    dffr reg_q_9 (.Q (q[9]), .QB (\$dummy [9]), .D (nx359), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix360 (.Y (nx359), .A0 (q[9]), .A1 (d[9]), .S0 (nx503)) ;
    dffr reg_q_10 (.Q (q[10]), .QB (\$dummy [10]), .D (nx369), .CLK (Clk), .R (
         Rst)) ;
    mux21_ni ix370 (.Y (nx369), .A0 (q[10]), .A1 (d[10]), .S0 (nx503)) ;
    dffr reg_q_11 (.Q (q[11]), .QB (\$dummy [11]), .D (nx379), .CLK (Clk), .R (
         Rst)) ;
    mux21_ni ix380 (.Y (nx379), .A0 (q[11]), .A1 (d[11]), .S0 (nx503)) ;
    dffr reg_q_12 (.Q (q[12]), .QB (\$dummy [12]), .D (nx389), .CLK (Clk), .R (
         Rst)) ;
    mux21_ni ix390 (.Y (nx389), .A0 (q[12]), .A1 (d[12]), .S0 (nx503)) ;
    dffr reg_q_13 (.Q (q[13]), .QB (\$dummy [13]), .D (nx399), .CLK (Clk), .R (
         Rst)) ;
    mux21_ni ix400 (.Y (nx399), .A0 (q[13]), .A1 (d[13]), .S0 (nx503)) ;
    dffr reg_q_14 (.Q (q[14]), .QB (\$dummy [14]), .D (nx409), .CLK (Clk), .R (
         Rst)) ;
    mux21_ni ix410 (.Y (nx409), .A0 (q[14]), .A1 (d[14]), .S0 (nx505)) ;
    dffr reg_q_15 (.Q (q[15]), .QB (\$dummy [15]), .D (nx419), .CLK (Clk), .R (
         Rst)) ;
    mux21_ni ix420 (.Y (nx419), .A0 (q[15]), .A1 (d[15]), .S0 (nx505)) ;
    dffsr_ni reg_q_16 (.Q (q[16]), .QB (\$dummy [16]), .D (nx429), .CLK (Clk), .S (
             nx12), .R (nx507)) ;
    mux21_ni ix430 (.Y (nx429), .A0 (q[16]), .A1 (d[16]), .S0 (nx505)) ;
    nor02ii ix17 (.Y (nx16), .A0 (num), .A1 (Rst)) ;
    inv01 ix498 (.Y (nx499), .A (e)) ;
    inv02 ix500 (.Y (nx501), .A (nx499)) ;
    inv02 ix502 (.Y (nx503), .A (nx499)) ;
    inv02 ix504 (.Y (nx505), .A (nx499)) ;
    buf02 ix506 (.Y (nx507), .A (nx16)) ;
endmodule


module mux_17 ( IN1, IN2, IN3, SEl, OUT1 ) ;

    input [16:0]IN1 ;
    input [16:0]IN2 ;
    input [16:0]IN3 ;
    input [1:0]SEl ;
    output [16:0]OUT1 ;

    wire nx4, nx506, nx513, nx516, nx519, nx522, nx525, nx528, nx531, nx534,
         nx537, nx540, nx543, nx546, nx549, nx552, nx555, nx558, nx565, nx567,
         nx569, nx571, nx573, nx575, nx577, nx579, nx581, nx583, nx585;



    inv01 ix17 (.Y (OUT1[0]), .A (nx506)) ;
    aoi222 ix507 (.Y (nx506), .A0 (nx581), .A1 (IN1[0]), .B0 (IN2[0]), .B1 (
           nx575), .C0 (IN3[0]), .C1 (nx567)) ;
    and02 ix5 (.Y (nx4), .A0 (SEl[1]), .A1 (SEl[0])) ;
    inv01 ix29 (.Y (OUT1[1]), .A (nx513)) ;
    aoi222 ix514 (.Y (nx513), .A0 (nx581), .A1 (IN1[1]), .B0 (IN2[1]), .B1 (
           nx575), .C0 (IN3[1]), .C1 (nx567)) ;
    inv01 ix41 (.Y (OUT1[2]), .A (nx516)) ;
    aoi222 ix517 (.Y (nx516), .A0 (nx581), .A1 (IN1[2]), .B0 (IN2[2]), .B1 (
           nx575), .C0 (IN3[2]), .C1 (nx567)) ;
    inv01 ix53 (.Y (OUT1[3]), .A (nx519)) ;
    aoi222 ix520 (.Y (nx519), .A0 (nx581), .A1 (IN1[3]), .B0 (IN2[3]), .B1 (
           nx575), .C0 (IN3[3]), .C1 (nx567)) ;
    inv01 ix65 (.Y (OUT1[4]), .A (nx522)) ;
    aoi222 ix523 (.Y (nx522), .A0 (nx581), .A1 (IN1[4]), .B0 (IN2[4]), .B1 (
           nx575), .C0 (IN3[4]), .C1 (nx567)) ;
    inv01 ix77 (.Y (OUT1[5]), .A (nx525)) ;
    aoi222 ix526 (.Y (nx525), .A0 (nx581), .A1 (IN1[5]), .B0 (IN2[5]), .B1 (
           nx575), .C0 (IN3[5]), .C1 (nx567)) ;
    inv01 ix89 (.Y (OUT1[6]), .A (nx528)) ;
    aoi222 ix529 (.Y (nx528), .A0 (nx583), .A1 (IN1[6]), .B0 (IN2[6]), .B1 (
           nx575), .C0 (IN3[6]), .C1 (nx567)) ;
    inv01 ix101 (.Y (OUT1[7]), .A (nx531)) ;
    aoi222 ix532 (.Y (nx531), .A0 (nx583), .A1 (IN1[7]), .B0 (IN2[7]), .B1 (
           nx577), .C0 (IN3[7]), .C1 (nx569)) ;
    inv01 ix113 (.Y (OUT1[8]), .A (nx534)) ;
    aoi222 ix535 (.Y (nx534), .A0 (nx583), .A1 (IN1[8]), .B0 (IN2[8]), .B1 (
           nx577), .C0 (IN3[8]), .C1 (nx569)) ;
    inv01 ix125 (.Y (OUT1[9]), .A (nx537)) ;
    aoi222 ix538 (.Y (nx537), .A0 (nx583), .A1 (IN1[9]), .B0 (IN2[9]), .B1 (
           nx577), .C0 (IN3[9]), .C1 (nx569)) ;
    inv01 ix137 (.Y (OUT1[10]), .A (nx540)) ;
    aoi222 ix541 (.Y (nx540), .A0 (nx583), .A1 (IN1[10]), .B0 (IN2[10]), .B1 (
           nx577), .C0 (IN3[10]), .C1 (nx569)) ;
    inv01 ix149 (.Y (OUT1[11]), .A (nx543)) ;
    aoi222 ix544 (.Y (nx543), .A0 (nx583), .A1 (IN1[11]), .B0 (IN2[11]), .B1 (
           nx577), .C0 (IN3[11]), .C1 (nx569)) ;
    inv01 ix161 (.Y (OUT1[12]), .A (nx546)) ;
    aoi222 ix547 (.Y (nx546), .A0 (nx583), .A1 (IN1[12]), .B0 (IN2[12]), .B1 (
           nx577), .C0 (IN3[12]), .C1 (nx569)) ;
    inv01 ix173 (.Y (OUT1[13]), .A (nx549)) ;
    aoi222 ix550 (.Y (nx549), .A0 (nx585), .A1 (IN1[13]), .B0 (IN2[13]), .B1 (
           nx577), .C0 (IN3[13]), .C1 (nx569)) ;
    inv01 ix185 (.Y (OUT1[14]), .A (nx552)) ;
    aoi222 ix553 (.Y (nx552), .A0 (nx585), .A1 (IN1[14]), .B0 (IN2[14]), .B1 (
           nx579), .C0 (IN3[14]), .C1 (nx571)) ;
    inv01 ix197 (.Y (OUT1[15]), .A (nx555)) ;
    aoi222 ix556 (.Y (nx555), .A0 (nx585), .A1 (IN1[15]), .B0 (IN2[15]), .B1 (
           nx579), .C0 (IN3[15]), .C1 (nx571)) ;
    inv01 ix209 (.Y (OUT1[16]), .A (nx558)) ;
    aoi222 ix559 (.Y (nx558), .A0 (nx585), .A1 (IN1[16]), .B0 (IN2[16]), .B1 (
           nx579), .C0 (IN3[16]), .C1 (nx571)) ;
    inv01 ix564 (.Y (nx565), .A (nx4)) ;
    inv02 ix566 (.Y (nx567), .A (nx565)) ;
    inv02 ix568 (.Y (nx569), .A (nx565)) ;
    inv02 ix570 (.Y (nx571), .A (nx565)) ;
    inv02 ix574 (.Y (nx575), .A (nx573)) ;
    inv02 ix576 (.Y (nx577), .A (nx573)) ;
    inv02 ix578 (.Y (nx579), .A (nx573)) ;
    inv02 ix580 (.Y (nx581), .A (SEl[1])) ;
    inv02 ix582 (.Y (nx583), .A (SEl[1])) ;
    inv02 ix584 (.Y (nx585), .A (SEl[1])) ;
    or02 ix11 (.Y (nx573), .A0 (nx581), .A1 (SEl[0])) ;
endmodule


module pcmux_17 ( IN1, IN2, IN3, IN4, IN5, IN6, SEl, OUT1 ) ;

    input [16:0]IN1 ;
    input [16:0]IN2 ;
    input [16:0]IN3 ;
    input [16:0]IN4 ;
    input [16:0]IN5 ;
    input [16:0]IN6 ;
    input [2:0]SEl ;
    output [16:0]OUT1 ;

    wire nx30, nx548, nx552, nx557, nx560, nx565, nx567, nx570, nx572, nx575,
         nx577, nx580, nx582, nx585, nx587, nx590, nx592, nx595, nx597, nx600,
         nx602, nx605, nx607, nx610, nx612, nx615, nx617, nx620, nx622, nx625,
         nx627, nx630, nx632, nx635, nx637, nx640, nx642, nx649, nx651, nx653,
         nx655, nx657, nx659, nx661, nx663, nx665, nx667, nx669, nx671, nx673,
         nx675, nx677, nx679, nx681, nx683, nx685, nx687, nx689, nx691, nx693,
         nx695;



    nand02 ix57 (.Y (OUT1[0]), .A0 (nx548), .A1 (nx557)) ;
    aoi222 ix549 (.Y (nx548), .A0 (IN6[0]), .A1 (nx675), .B0 (IN5[0]), .B1 (
           nx691), .C0 (IN4[0]), .C1 (nx683)) ;
    nor02_2x ix31 (.Y (nx30), .A0 (SEl[1]), .A1 (SEl[2])) ;
    inv01 ix553 (.Y (nx552), .A (SEl[1])) ;
    aoi222 ix558 (.Y (nx557), .A0 (IN1[0]), .A1 (nx659), .B0 (IN2[0]), .B1 (
           nx667), .C0 (IN3[0]), .C1 (nx651)) ;
    inv01 ix561 (.Y (nx560), .A (SEl[2])) ;
    nand02 ix79 (.Y (OUT1[1]), .A0 (nx565), .A1 (nx567)) ;
    aoi222 ix566 (.Y (nx565), .A0 (IN6[1]), .A1 (nx675), .B0 (IN5[1]), .B1 (
           nx691), .C0 (IN4[1]), .C1 (nx683)) ;
    aoi222 ix568 (.Y (nx567), .A0 (IN1[1]), .A1 (nx659), .B0 (IN2[1]), .B1 (
           nx667), .C0 (IN3[1]), .C1 (nx651)) ;
    nand02 ix101 (.Y (OUT1[2]), .A0 (nx570), .A1 (nx572)) ;
    aoi222 ix571 (.Y (nx570), .A0 (IN6[2]), .A1 (nx675), .B0 (IN5[2]), .B1 (
           nx691), .C0 (IN4[2]), .C1 (nx683)) ;
    aoi222 ix573 (.Y (nx572), .A0 (IN1[2]), .A1 (nx659), .B0 (IN2[2]), .B1 (
           nx667), .C0 (IN3[2]), .C1 (nx651)) ;
    nand02 ix123 (.Y (OUT1[3]), .A0 (nx575), .A1 (nx577)) ;
    aoi222 ix576 (.Y (nx575), .A0 (IN6[3]), .A1 (nx675), .B0 (IN5[3]), .B1 (
           nx691), .C0 (IN4[3]), .C1 (nx683)) ;
    aoi222 ix578 (.Y (nx577), .A0 (IN1[3]), .A1 (nx659), .B0 (IN2[3]), .B1 (
           nx667), .C0 (IN3[3]), .C1 (nx651)) ;
    nand02 ix145 (.Y (OUT1[4]), .A0 (nx580), .A1 (nx582)) ;
    aoi222 ix581 (.Y (nx580), .A0 (IN6[4]), .A1 (nx675), .B0 (IN5[4]), .B1 (
           nx691), .C0 (IN4[4]), .C1 (nx683)) ;
    aoi222 ix583 (.Y (nx582), .A0 (IN1[4]), .A1 (nx659), .B0 (IN2[4]), .B1 (
           nx667), .C0 (IN3[4]), .C1 (nx651)) ;
    nand02 ix167 (.Y (OUT1[5]), .A0 (nx585), .A1 (nx587)) ;
    aoi222 ix586 (.Y (nx585), .A0 (IN6[5]), .A1 (nx675), .B0 (IN5[5]), .B1 (
           nx691), .C0 (IN4[5]), .C1 (nx683)) ;
    aoi222 ix588 (.Y (nx587), .A0 (IN1[5]), .A1 (nx659), .B0 (IN2[5]), .B1 (
           nx667), .C0 (IN3[5]), .C1 (nx651)) ;
    nand02 ix189 (.Y (OUT1[6]), .A0 (nx590), .A1 (nx592)) ;
    aoi222 ix591 (.Y (nx590), .A0 (IN6[6]), .A1 (nx675), .B0 (IN5[6]), .B1 (
           nx691), .C0 (IN4[6]), .C1 (nx683)) ;
    aoi222 ix593 (.Y (nx592), .A0 (IN1[6]), .A1 (nx659), .B0 (IN2[6]), .B1 (
           nx667), .C0 (IN3[6]), .C1 (nx651)) ;
    nand02 ix211 (.Y (OUT1[7]), .A0 (nx595), .A1 (nx597)) ;
    aoi222 ix596 (.Y (nx595), .A0 (IN6[7]), .A1 (nx677), .B0 (IN5[7]), .B1 (
           nx693), .C0 (IN4[7]), .C1 (nx685)) ;
    aoi222 ix598 (.Y (nx597), .A0 (IN1[7]), .A1 (nx661), .B0 (IN2[7]), .B1 (
           nx669), .C0 (IN3[7]), .C1 (nx653)) ;
    nand02 ix233 (.Y (OUT1[8]), .A0 (nx600), .A1 (nx602)) ;
    aoi222 ix601 (.Y (nx600), .A0 (IN6[8]), .A1 (nx677), .B0 (IN5[8]), .B1 (
           nx693), .C0 (IN4[8]), .C1 (nx685)) ;
    aoi222 ix603 (.Y (nx602), .A0 (IN1[8]), .A1 (nx661), .B0 (IN2[8]), .B1 (
           nx669), .C0 (IN3[8]), .C1 (nx653)) ;
    nand02 ix255 (.Y (OUT1[9]), .A0 (nx605), .A1 (nx607)) ;
    aoi222 ix606 (.Y (nx605), .A0 (IN6[9]), .A1 (nx677), .B0 (IN5[9]), .B1 (
           nx693), .C0 (IN4[9]), .C1 (nx685)) ;
    aoi222 ix608 (.Y (nx607), .A0 (IN1[9]), .A1 (nx661), .B0 (IN2[9]), .B1 (
           nx669), .C0 (IN3[9]), .C1 (nx653)) ;
    nand02 ix277 (.Y (OUT1[10]), .A0 (nx610), .A1 (nx612)) ;
    aoi222 ix611 (.Y (nx610), .A0 (IN6[10]), .A1 (nx677), .B0 (IN5[10]), .B1 (
           nx693), .C0 (IN4[10]), .C1 (nx685)) ;
    aoi222 ix613 (.Y (nx612), .A0 (IN1[10]), .A1 (nx661), .B0 (IN2[10]), .B1 (
           nx669), .C0 (IN3[10]), .C1 (nx653)) ;
    nand02 ix299 (.Y (OUT1[11]), .A0 (nx615), .A1 (nx617)) ;
    aoi222 ix616 (.Y (nx615), .A0 (IN6[11]), .A1 (nx677), .B0 (IN5[11]), .B1 (
           nx693), .C0 (IN4[11]), .C1 (nx685)) ;
    aoi222 ix618 (.Y (nx617), .A0 (IN1[11]), .A1 (nx661), .B0 (IN2[11]), .B1 (
           nx669), .C0 (IN3[11]), .C1 (nx653)) ;
    nand02 ix321 (.Y (OUT1[12]), .A0 (nx620), .A1 (nx622)) ;
    aoi222 ix621 (.Y (nx620), .A0 (IN6[12]), .A1 (nx677), .B0 (IN5[12]), .B1 (
           nx693), .C0 (IN4[12]), .C1 (nx685)) ;
    aoi222 ix623 (.Y (nx622), .A0 (IN1[12]), .A1 (nx661), .B0 (IN2[12]), .B1 (
           nx669), .C0 (IN3[12]), .C1 (nx653)) ;
    nand02 ix343 (.Y (OUT1[13]), .A0 (nx625), .A1 (nx627)) ;
    aoi222 ix626 (.Y (nx625), .A0 (IN6[13]), .A1 (nx677), .B0 (IN5[13]), .B1 (
           nx693), .C0 (IN4[13]), .C1 (nx685)) ;
    aoi222 ix628 (.Y (nx627), .A0 (IN1[13]), .A1 (nx661), .B0 (IN2[13]), .B1 (
           nx669), .C0 (IN3[13]), .C1 (nx653)) ;
    nand02 ix365 (.Y (OUT1[14]), .A0 (nx630), .A1 (nx632)) ;
    aoi222 ix631 (.Y (nx630), .A0 (IN6[14]), .A1 (nx679), .B0 (IN5[14]), .B1 (
           nx695), .C0 (IN4[14]), .C1 (nx687)) ;
    aoi222 ix633 (.Y (nx632), .A0 (IN1[14]), .A1 (nx663), .B0 (IN2[14]), .B1 (
           nx671), .C0 (IN3[14]), .C1 (nx655)) ;
    nand02 ix387 (.Y (OUT1[15]), .A0 (nx635), .A1 (nx637)) ;
    aoi222 ix636 (.Y (nx635), .A0 (IN6[15]), .A1 (nx679), .B0 (IN5[15]), .B1 (
           nx695), .C0 (IN4[15]), .C1 (nx687)) ;
    aoi222 ix638 (.Y (nx637), .A0 (IN1[15]), .A1 (nx663), .B0 (IN2[15]), .B1 (
           nx671), .C0 (IN3[15]), .C1 (nx655)) ;
    nand02 ix409 (.Y (OUT1[16]), .A0 (nx640), .A1 (nx642)) ;
    aoi222 ix641 (.Y (nx640), .A0 (IN6[16]), .A1 (nx679), .B0 (IN5[16]), .B1 (
           nx695), .C0 (IN4[16]), .C1 (nx687)) ;
    aoi222 ix643 (.Y (nx642), .A0 (IN1[16]), .A1 (nx663), .B0 (IN2[16]), .B1 (
           nx671), .C0 (IN3[16]), .C1 (nx655)) ;
    inv02 ix650 (.Y (nx651), .A (nx649)) ;
    inv02 ix652 (.Y (nx653), .A (nx649)) ;
    inv02 ix654 (.Y (nx655), .A (nx649)) ;
    inv02 ix658 (.Y (nx659), .A (nx657)) ;
    inv02 ix660 (.Y (nx661), .A (nx657)) ;
    inv02 ix662 (.Y (nx663), .A (nx657)) ;
    inv02 ix666 (.Y (nx667), .A (nx665)) ;
    inv02 ix668 (.Y (nx669), .A (nx665)) ;
    inv02 ix670 (.Y (nx671), .A (nx665)) ;
    inv01 ix672 (.Y (nx673), .A (nx30)) ;
    inv02 ix674 (.Y (nx675), .A (nx673)) ;
    inv02 ix676 (.Y (nx677), .A (nx673)) ;
    inv02 ix678 (.Y (nx679), .A (nx673)) ;
    inv02 ix682 (.Y (nx683), .A (nx681)) ;
    inv02 ix684 (.Y (nx685), .A (nx681)) ;
    inv02 ix686 (.Y (nx687), .A (nx681)) ;
    inv02 ix690 (.Y (nx691), .A (nx689)) ;
    inv02 ix692 (.Y (nx693), .A (nx689)) ;
    inv02 ix694 (.Y (nx695), .A (nx689)) ;
    or03 ix49 (.Y (nx689), .A0 (SEl[2]), .A1 (nx552), .A2 (SEl[0])) ;
    nand03 ix39 (.Y (nx681), .A0 (nx560), .A1 (SEl[1]), .A2 (SEl[0])) ;
    nand02 ix11 (.Y (nx657), .A0 (SEl[1]), .A1 (SEl[2])) ;
    nand03 ix19 (.Y (nx665), .A0 (SEl[2]), .A1 (nx552), .A2 (SEl[0])) ;
    or03 ix7 (.Y (nx649), .A0 (nx560), .A1 (SEl[1]), .A2 (SEl[0])) ;
endmodule


module cacheReg ( Clk, Rst, e, d, q ) ;

    input Clk ;
    input Rst ;
    input e ;
    input [7:0]d ;
    output [7:0]q ;

    wire nx134, nx144, nx154, nx164, nx174, nx184, nx194, nx204, nx243, nx245;
    wire [7:0] \$dummy ;




    dffr reg_q_0 (.Q (q[0]), .QB (\$dummy [0]), .D (nx134), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix135 (.Y (nx134), .A0 (q[0]), .A1 (d[0]), .S0 (nx243)) ;
    dffr reg_q_1 (.Q (q[1]), .QB (\$dummy [1]), .D (nx144), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix145 (.Y (nx144), .A0 (q[1]), .A1 (d[1]), .S0 (nx243)) ;
    dffr reg_q_2 (.Q (q[2]), .QB (\$dummy [2]), .D (nx154), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix155 (.Y (nx154), .A0 (q[2]), .A1 (d[2]), .S0 (nx243)) ;
    dffr reg_q_3 (.Q (q[3]), .QB (\$dummy [3]), .D (nx164), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix165 (.Y (nx164), .A0 (q[3]), .A1 (d[3]), .S0 (nx243)) ;
    dffr reg_q_4 (.Q (q[4]), .QB (\$dummy [4]), .D (nx174), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix175 (.Y (nx174), .A0 (q[4]), .A1 (d[4]), .S0 (nx243)) ;
    dffr reg_q_5 (.Q (q[5]), .QB (\$dummy [5]), .D (nx184), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix185 (.Y (nx184), .A0 (q[5]), .A1 (d[5]), .S0 (nx243)) ;
    dffr reg_q_6 (.Q (q[6]), .QB (\$dummy [6]), .D (nx194), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix195 (.Y (nx194), .A0 (q[6]), .A1 (d[6]), .S0 (nx243)) ;
    dffr reg_q_7 (.Q (q[7]), .QB (\$dummy [7]), .D (nx204), .CLK (Clk), .R (Rst)
         ) ;
    mux21_ni ix205 (.Y (nx204), .A0 (q[7]), .A1 (d[7]), .S0 (nx245)) ;
    buf02 ix242 (.Y (nx243), .A (e)) ;
    buf02 ix244 (.Y (nx245), .A (e)) ;
endmodule


module cache_8 ( clk, wr, address, data_in, dataOut_0__7, dataOut_0__6,
                 dataOut_0__5, dataOut_0__4, dataOut_0__3, dataOut_0__2,
                 dataOut_0__1, dataOut_0__0, dataOut_1__7, dataOut_1__6,
                 dataOut_1__5, dataOut_1__4, dataOut_1__3, dataOut_1__2,
                 dataOut_1__1, dataOut_1__0, dataOut_2__7, dataOut_2__6,
                 dataOut_2__5, dataOut_2__4, dataOut_2__3, dataOut_2__2,
                 dataOut_2__1, dataOut_2__0, dataOut_3__7, dataOut_3__6,
                 dataOut_3__5, dataOut_3__4, dataOut_3__3, dataOut_3__2,
                 dataOut_3__1, dataOut_3__0, dataOut_4__7, dataOut_4__6,
                 dataOut_4__5, dataOut_4__4, dataOut_4__3, dataOut_4__2,
                 dataOut_4__1, dataOut_4__0, dataOut_5__7, dataOut_5__6,
                 dataOut_5__5, dataOut_5__4, dataOut_5__3, dataOut_5__2,
                 dataOut_5__1, dataOut_5__0, dataOut_6__7, dataOut_6__6,
                 dataOut_6__5, dataOut_6__4, dataOut_6__3, dataOut_6__2,
                 dataOut_6__1, dataOut_6__0, dataOut_7__7, dataOut_7__6,
                 dataOut_7__5, dataOut_7__4, dataOut_7__3, dataOut_7__2,
                 dataOut_7__1, dataOut_7__0, dataOut_8__7, dataOut_8__6,
                 dataOut_8__5, dataOut_8__4, dataOut_8__3, dataOut_8__2,
                 dataOut_8__1, dataOut_8__0, dataOut_9__7, dataOut_9__6,
                 dataOut_9__5, dataOut_9__4, dataOut_9__3, dataOut_9__2,
                 dataOut_9__1, dataOut_9__0, dataOut_10__7, dataOut_10__6,
                 dataOut_10__5, dataOut_10__4, dataOut_10__3, dataOut_10__2,
                 dataOut_10__1, dataOut_10__0, dataOut_11__7, dataOut_11__6,
                 dataOut_11__5, dataOut_11__4, dataOut_11__3, dataOut_11__2,
                 dataOut_11__1, dataOut_11__0, dataOut_12__7, dataOut_12__6,
                 dataOut_12__5, dataOut_12__4, dataOut_12__3, dataOut_12__2,
                 dataOut_12__1, dataOut_12__0, dataOut_13__7, dataOut_13__6,
                 dataOut_13__5, dataOut_13__4, dataOut_13__3, dataOut_13__2,
                 dataOut_13__1, dataOut_13__0, dataOut_14__7, dataOut_14__6,
                 dataOut_14__5, dataOut_14__4, dataOut_14__3, dataOut_14__2,
                 dataOut_14__1, dataOut_14__0, dataOut_15__7, dataOut_15__6,
                 dataOut_15__5, dataOut_15__4, dataOut_15__3, dataOut_15__2,
                 dataOut_15__1, dataOut_15__0, dataOut_16__7, dataOut_16__6,
                 dataOut_16__5, dataOut_16__4, dataOut_16__3, dataOut_16__2,
                 dataOut_16__1, dataOut_16__0, dataOut_17__7, dataOut_17__6,
                 dataOut_17__5, dataOut_17__4, dataOut_17__3, dataOut_17__2,
                 dataOut_17__1, dataOut_17__0, dataOut_18__7, dataOut_18__6,
                 dataOut_18__5, dataOut_18__4, dataOut_18__3, dataOut_18__2,
                 dataOut_18__1, dataOut_18__0, dataOut_19__7, dataOut_19__6,
                 dataOut_19__5, dataOut_19__4, dataOut_19__3, dataOut_19__2,
                 dataOut_19__1, dataOut_19__0, dataOut_20__7, dataOut_20__6,
                 dataOut_20__5, dataOut_20__4, dataOut_20__3, dataOut_20__2,
                 dataOut_20__1, dataOut_20__0, dataOut_21__7, dataOut_21__6,
                 dataOut_21__5, dataOut_21__4, dataOut_21__3, dataOut_21__2,
                 dataOut_21__1, dataOut_21__0, dataOut_22__7, dataOut_22__6,
                 dataOut_22__5, dataOut_22__4, dataOut_22__3, dataOut_22__2,
                 dataOut_22__1, dataOut_22__0, dataOut_23__7, dataOut_23__6,
                 dataOut_23__5, dataOut_23__4, dataOut_23__3, dataOut_23__2,
                 dataOut_23__1, dataOut_23__0, dataOut_24__7, dataOut_24__6,
                 dataOut_24__5, dataOut_24__4, dataOut_24__3, dataOut_24__2,
                 dataOut_24__1, dataOut_24__0 ) ;

    input clk ;
    input wr ;
    input [4:0]address ;
    input [39:0]data_in ;
    output dataOut_0__7 ;
    output dataOut_0__6 ;
    output dataOut_0__5 ;
    output dataOut_0__4 ;
    output dataOut_0__3 ;
    output dataOut_0__2 ;
    output dataOut_0__1 ;
    output dataOut_0__0 ;
    output dataOut_1__7 ;
    output dataOut_1__6 ;
    output dataOut_1__5 ;
    output dataOut_1__4 ;
    output dataOut_1__3 ;
    output dataOut_1__2 ;
    output dataOut_1__1 ;
    output dataOut_1__0 ;
    output dataOut_2__7 ;
    output dataOut_2__6 ;
    output dataOut_2__5 ;
    output dataOut_2__4 ;
    output dataOut_2__3 ;
    output dataOut_2__2 ;
    output dataOut_2__1 ;
    output dataOut_2__0 ;
    output dataOut_3__7 ;
    output dataOut_3__6 ;
    output dataOut_3__5 ;
    output dataOut_3__4 ;
    output dataOut_3__3 ;
    output dataOut_3__2 ;
    output dataOut_3__1 ;
    output dataOut_3__0 ;
    output dataOut_4__7 ;
    output dataOut_4__6 ;
    output dataOut_4__5 ;
    output dataOut_4__4 ;
    output dataOut_4__3 ;
    output dataOut_4__2 ;
    output dataOut_4__1 ;
    output dataOut_4__0 ;
    output dataOut_5__7 ;
    output dataOut_5__6 ;
    output dataOut_5__5 ;
    output dataOut_5__4 ;
    output dataOut_5__3 ;
    output dataOut_5__2 ;
    output dataOut_5__1 ;
    output dataOut_5__0 ;
    output dataOut_6__7 ;
    output dataOut_6__6 ;
    output dataOut_6__5 ;
    output dataOut_6__4 ;
    output dataOut_6__3 ;
    output dataOut_6__2 ;
    output dataOut_6__1 ;
    output dataOut_6__0 ;
    output dataOut_7__7 ;
    output dataOut_7__6 ;
    output dataOut_7__5 ;
    output dataOut_7__4 ;
    output dataOut_7__3 ;
    output dataOut_7__2 ;
    output dataOut_7__1 ;
    output dataOut_7__0 ;
    output dataOut_8__7 ;
    output dataOut_8__6 ;
    output dataOut_8__5 ;
    output dataOut_8__4 ;
    output dataOut_8__3 ;
    output dataOut_8__2 ;
    output dataOut_8__1 ;
    output dataOut_8__0 ;
    output dataOut_9__7 ;
    output dataOut_9__6 ;
    output dataOut_9__5 ;
    output dataOut_9__4 ;
    output dataOut_9__3 ;
    output dataOut_9__2 ;
    output dataOut_9__1 ;
    output dataOut_9__0 ;
    output dataOut_10__7 ;
    output dataOut_10__6 ;
    output dataOut_10__5 ;
    output dataOut_10__4 ;
    output dataOut_10__3 ;
    output dataOut_10__2 ;
    output dataOut_10__1 ;
    output dataOut_10__0 ;
    output dataOut_11__7 ;
    output dataOut_11__6 ;
    output dataOut_11__5 ;
    output dataOut_11__4 ;
    output dataOut_11__3 ;
    output dataOut_11__2 ;
    output dataOut_11__1 ;
    output dataOut_11__0 ;
    output dataOut_12__7 ;
    output dataOut_12__6 ;
    output dataOut_12__5 ;
    output dataOut_12__4 ;
    output dataOut_12__3 ;
    output dataOut_12__2 ;
    output dataOut_12__1 ;
    output dataOut_12__0 ;
    output dataOut_13__7 ;
    output dataOut_13__6 ;
    output dataOut_13__5 ;
    output dataOut_13__4 ;
    output dataOut_13__3 ;
    output dataOut_13__2 ;
    output dataOut_13__1 ;
    output dataOut_13__0 ;
    output dataOut_14__7 ;
    output dataOut_14__6 ;
    output dataOut_14__5 ;
    output dataOut_14__4 ;
    output dataOut_14__3 ;
    output dataOut_14__2 ;
    output dataOut_14__1 ;
    output dataOut_14__0 ;
    output dataOut_15__7 ;
    output dataOut_15__6 ;
    output dataOut_15__5 ;
    output dataOut_15__4 ;
    output dataOut_15__3 ;
    output dataOut_15__2 ;
    output dataOut_15__1 ;
    output dataOut_15__0 ;
    output dataOut_16__7 ;
    output dataOut_16__6 ;
    output dataOut_16__5 ;
    output dataOut_16__4 ;
    output dataOut_16__3 ;
    output dataOut_16__2 ;
    output dataOut_16__1 ;
    output dataOut_16__0 ;
    output dataOut_17__7 ;
    output dataOut_17__6 ;
    output dataOut_17__5 ;
    output dataOut_17__4 ;
    output dataOut_17__3 ;
    output dataOut_17__2 ;
    output dataOut_17__1 ;
    output dataOut_17__0 ;
    output dataOut_18__7 ;
    output dataOut_18__6 ;
    output dataOut_18__5 ;
    output dataOut_18__4 ;
    output dataOut_18__3 ;
    output dataOut_18__2 ;
    output dataOut_18__1 ;
    output dataOut_18__0 ;
    output dataOut_19__7 ;
    output dataOut_19__6 ;
    output dataOut_19__5 ;
    output dataOut_19__4 ;
    output dataOut_19__3 ;
    output dataOut_19__2 ;
    output dataOut_19__1 ;
    output dataOut_19__0 ;
    output dataOut_20__7 ;
    output dataOut_20__6 ;
    output dataOut_20__5 ;
    output dataOut_20__4 ;
    output dataOut_20__3 ;
    output dataOut_20__2 ;
    output dataOut_20__1 ;
    output dataOut_20__0 ;
    output dataOut_21__7 ;
    output dataOut_21__6 ;
    output dataOut_21__5 ;
    output dataOut_21__4 ;
    output dataOut_21__3 ;
    output dataOut_21__2 ;
    output dataOut_21__1 ;
    output dataOut_21__0 ;
    output dataOut_22__7 ;
    output dataOut_22__6 ;
    output dataOut_22__5 ;
    output dataOut_22__4 ;
    output dataOut_22__3 ;
    output dataOut_22__2 ;
    output dataOut_22__1 ;
    output dataOut_22__0 ;
    output dataOut_23__7 ;
    output dataOut_23__6 ;
    output dataOut_23__5 ;
    output dataOut_23__4 ;
    output dataOut_23__3 ;
    output dataOut_23__2 ;
    output dataOut_23__1 ;
    output dataOut_23__0 ;
    output dataOut_24__7 ;
    output dataOut_24__6 ;
    output dataOut_24__5 ;
    output dataOut_24__4 ;
    output dataOut_24__3 ;
    output dataOut_24__2 ;
    output dataOut_24__1 ;
    output dataOut_24__0 ;

    wire nx4, nx10, nx36, nx38, nx46, nx52, nx58, nx62, nx66, nx72, nx78, nx94,
         nx100, nx104, nx106, nx112, nx118, nx122, nx138, nx142, nx144, nx150,
         nx156, nx164, nx196, nx230, nx264, nx298, nx332, nx366, nx400, nx434,
         nx456, nx466, nx472, nx486, nx494, nx512, nx540, nx574, nx608, nx642,
         nx676, nx710, nx744, nx778, nx814, nx842, nx876, nx910, nx944, nx978,
         nx1012, nx1046, nx1080, nx1094, nx1116, nx1144, nx1178, nx1212, nx1246,
         nx1280, nx1314, nx1348, nx1382, nx1418, nx1446, nx1480, nx1514, nx1548,
         nx1582, nx1616, nx1650, nx1684, nx1714, nx1728, nx1732, nx1750, nx1778,
         nx1812, nx1846, nx1880, nx1914, nx1948, nx1982, nx2016, nx2052, nx2080,
         nx2114, nx2148, nx2182, nx2216, nx2250, nx2284, nx2318, nx2354, nx2382,
         nx2416, nx2450, nx2484, nx2518, nx2552, nx2586, nx2620, nx2656, nx2684,
         nx2718, nx2752, nx2786, nx2820, nx2854, nx2888, nx2922, nx2932, nx2970,
         nx2996, nx3024, nx3058, nx3092, nx3126, nx3160, nx3194, nx3228, nx3262,
         nx3310, nx3338, nx3372, nx3406, nx3440, nx3474, nx3508, nx3542, nx3576,
         nx3588, nx3590, nx3600, nx3604, nx3616, nx3644, nx3678, nx3712, nx3746,
         nx3780, nx3814, nx3848, nx3882, nx3894, nx3896, nx3906, nx3910, nx3922,
         nx3950, nx3984, nx4018, nx4052, nx4086, nx4120, nx4154, nx4188, nx4214,
         nx4216, nx4224, nx4226, nx4238, nx4266, nx4300, nx4334, nx4368, nx4402,
         nx4436, nx4470, nx4504, nx4518, nx4542, nx4570, nx4604, nx4638, nx4672,
         nx4706, nx4740, nx4774, nx4808, nx4844, nx4872, nx4906, nx4940, nx4974,
         nx5008, nx5042, nx5076, nx5110, nx5146, nx5174, nx5208, nx5242, nx5276,
         nx5310, nx5344, nx5378, nx5412, nx5424, nx5434, nx5444, nx5446, nx5454,
         nx5486, nx5520, nx5554, nx5588, nx5622, nx5656, nx5690, nx5724, nx5736,
         nx5740, nx5748, nx5750, nx5758, nx5790, nx5824, nx5858, nx5892, nx5926,
         nx5960, nx5994, nx6028, nx6040, nx6042, nx6050, nx6052, nx6060, nx6092,
         nx6126, nx6160, nx6194, nx6228, nx6262, nx6296, nx6330, nx6342, nx6344,
         nx6352, nx6354, nx6362, nx6394, nx6428, nx6462, nx6496, nx6530, nx6564,
         nx6598, nx6632, nx6654, nx6668, nx6690, nx6718, nx6746, nx6774, nx6802,
         nx6830, nx6858, nx6886, nx6898, nx6906, nx6910, nx6926, nx6948, nx6970,
         nx6992, nx7014, nx7036, nx7058, nx7080, nx7100, nx7108, nx7122, nx7136,
         nx7150, nx7164, nx7178, nx7192, nx7206, nx9112, nx9122, nx9132, nx9142,
         nx9152, nx9162, nx9172, nx9182, nx9192, nx9202, nx9212, nx9222, nx9232,
         nx9242, nx9252, nx9262, nx9272, nx9282, nx9292, nx9302, nx9312, nx9322,
         nx9332, nx9342, nx9352, nx9362, nx9372, nx9382, nx9392, nx9402, nx9412,
         nx9422, nx9432, nx9442, nx9452, nx9462, nx9472, nx9482, nx9492, nx9502,
         nx9512, nx9522, nx9532, nx9542, nx9552, nx9562, nx9572, nx9582, nx9592,
         nx9602, nx9612, nx9622, nx9632, nx9642, nx9652, nx9662, nx9672, nx9682,
         nx9692, nx9702, nx9712, nx9722, nx9732, nx9742, nx9752, nx9762, nx9772,
         nx9782, nx9792, nx9802, nx9812, nx9822, nx9832, nx9842, nx9852, nx9862,
         nx9872, nx9882, nx9892, nx9902, nx9912, nx9922, nx9932, nx9942, nx9952,
         nx9962, nx9972, nx9982, nx9992, nx10002, nx10012, nx10022, nx10032,
         nx10042, nx10052, nx10062, nx10072, nx10082, nx10092, nx10102, nx10112,
         nx10122, nx10132, nx10142, nx10152, nx10162, nx10172, nx10182, nx10192,
         nx10202, nx10212, nx10222, nx10232, nx10242, nx10252, nx10262, nx10272,
         nx10282, nx10292, nx10302, nx10312, nx10322, nx10332, nx10342, nx10352,
         nx10362, nx10372, nx10382, nx10392, nx10402, nx10412, nx10422, nx10432,
         nx10442, nx10452, nx10462, nx10472, nx10482, nx10492, nx10502, nx10512,
         nx10522, nx10532, nx10542, nx10552, nx10562, nx10572, nx10582, nx10592,
         nx10602, nx10612, nx10622, nx10632, nx10642, nx10652, nx10662, nx10672,
         nx10682, nx10692, nx10702, nx10712, nx10722, nx10732, nx10742, nx10752,
         nx10762, nx10772, nx10782, nx10792, nx10802, nx10812, nx10822, nx10832,
         nx10842, nx10852, nx10862, nx10872, nx10882, nx10892, nx10902, nx10912,
         nx10922, nx10932, nx10942, nx10952, nx10962, nx10972, nx10982, nx10992,
         nx11002, nx11012, nx11022, nx11032, nx11042, nx11052, nx11062, nx11072,
         nx11082, nx11092, nx11102, nx11118, nx11120, nx11125, nx11127, nx11130,
         nx11135, nx11141, nx11143, nx11150, nx11158, nx11165, nx11168, nx11170,
         nx11181, nx11184, nx11188, nx11193, nx11196, nx11199, nx11209, nx11219,
         nx11229, nx11239, nx11249, nx11259, nx11269, nx11279, nx11282, nx11284,
         nx11286, nx11288, nx11290, nx11293, nx11295, nx11298, nx11301, nx11303,
         nx11305, nx11311, nx11317, nx11323, nx11329, nx11335, nx11341, nx11347,
         nx11353, nx11361, nx11363, nx11366, nx11369, nx11371, nx11373, nx11378,
         nx11383, nx11390, nx11396, nx11402, nx11408, nx11414, nx11420, nx11426,
         nx11434, nx11436, nx11438, nx11440, nx11442, nx11444, nx11451, nx11457,
         nx11463, nx11469, nx11475, nx11481, nx11487, nx11495, nx11497, nx11499,
         nx11501, nx11503, nx11505, nx11512, nx11518, nx11524, nx11530, nx11536,
         nx11542, nx11548, nx11555, nx11560, nx11562, nx11564, nx11567, nx11571,
         nx11574, nx11577, nx11579, nx11582, nx11586, nx11588, nx11594, nx11600,
         nx11606, nx11612, nx11618, nx11624, nx11630, nx11638, nx11640, nx11646,
         nx11648, nx11650, nx11652, nx11659, nx11665, nx11671, nx11677, nx11683,
         nx11689, nx11695, nx11703, nx11705, nx11707, nx11709, nx11711, nx11714,
         nx11721, nx11727, nx11733, nx11739, nx11745, nx11751, nx11757, nx11765,
         nx11767, nx11769, nx11771, nx11773, nx11775, nx11782, nx11788, nx11794,
         nx11800, nx11806, nx11812, nx11818, nx11825, nx11828, nx11830, nx11832,
         nx11834, nx11836, nx11838, nx11842, nx11844, nx11847, nx11851, nx11858,
         nx11864, nx11870, nx11876, nx11882, nx11888, nx11894, nx11902, nx11904,
         nx11906, nx11908, nx11910, nx11912, nx11914, nx11916, nx11923, nx11929,
         nx11935, nx11941, nx11947, nx11953, nx11959, nx11967, nx11971, nx11975,
         nx11979, nx11981, nx11991, nx11997, nx12003, nx12009, nx12015, nx12021,
         nx12027, nx12035, nx12039, nx12043, nx12047, nx12054, nx12060, nx12066,
         nx12072, nx12078, nx12084, nx12090, nx12097, nx12100, nx12106, nx12110,
         nx12113, nx12119, nx12125, nx12131, nx12137, nx12143, nx12149, nx12155,
         nx12164, nx12166, nx12168, nx12170, nx12172, nx12174, nx12182, nx12188,
         nx12194, nx12200, nx12206, nx12212, nx12218, nx12228, nx12230, nx12232,
         nx12234, nx12236, nx12238, nx12245, nx12251, nx12257, nx12263, nx12269,
         nx12275, nx12281, nx12289, nx12291, nx12293, nx12295, nx12297, nx12299,
         nx12306, nx12312, nx12318, nx12324, nx12330, nx12336, nx12342, nx12349,
         nx12352, nx12361, nx12365, nx12375, nx12381, nx12387, nx12393, nx12399,
         nx12405, nx12411, nx12419, nx12421, nx12428, nx12434, nx12441, nx12447,
         nx12453, nx12459, nx12465, nx12471, nx12477, nx12485, nx12487, nx12497,
         nx12506, nx12512, nx12518, nx12524, nx12530, nx12536, nx12542, nx12550,
         nx12560, nx12567, nx12573, nx12579, nx12585, nx12591, nx12597, nx12603,
         nx12610, nx12613, nx12615, nx12617, nx12619, nx12621, nx12624, nx12630,
         nx12632, nx12638, nx12640, nx12646, nx12648, nx12654, nx12656, nx12662,
         nx12664, nx12670, nx12672, nx12678, nx12680, nx12686, nx12689, nx12694,
         nx12696, nx12704, nx12706, nx12712, nx12714, nx12720, nx12722, nx12728,
         nx12730, nx12736, nx12738, nx12744, nx12746, nx12752, nx12754, nx12760,
         nx12763, nx12823, nx12825, nx12827, nx12829, nx12831, nx12833, nx12835,
         nx12837, nx12839, nx12841, nx12843, nx12845, nx12853, nx12855, nx12863,
         nx12865, nx12873, nx12875, nx12883, nx12885, nx12895, nx12897, nx12907,
         nx12909, nx12919, nx12921, nx12931, nx12933, nx12943, nx12945, nx12955,
         nx12957, nx12959, nx12961, nx12963, nx12965, nx12967, nx12969, nx12971,
         nx12973, nx12975, nx12977, nx12979, nx12981, nx12991, nx12993, nx13003,
         nx13005, nx13015, nx13017, nx13019, nx13021, nx13023, nx13025, nx13027,
         nx13029, nx13031, nx13033, nx13035, nx13045, nx13047, nx13049, nx13051,
         nx13053, nx13055, nx13057, nx13059, nx13061, nx13063, nx13065, nx13067,
         nx13069, nx13071, nx13073, nx13075, nx13077, nx13079, nx13081, nx13083,
         nx13087, nx13089, nx13091, nx13093, nx13095, nx13097, nx13099, nx13101,
         nx13103, nx13105, nx13107, nx13109, nx13111, nx13113, nx13115, nx13117,
         nx13119, nx13121, nx13123, nx13125, nx13127, nx13131, nx13133, nx13135,
         nx13137, nx13139, nx13141, nx13145, nx13147, nx13149, nx13151, nx13153,
         nx13155, nx13159, nx13161, nx13163, nx13165, nx13167, nx13169, nx13173,
         nx13175, nx13177, nx13179, nx13181, nx13183, nx13187, nx13189, nx13191,
         nx13193, nx13195, nx13197, nx13201, nx13203, nx13205, nx13207, nx13209,
         nx13211, nx13215, nx13217, nx13219, nx13221, nx13223, nx13225, nx13227,
         nx13229, nx13231, nx13233, nx13235, nx13237, nx13239, nx13241, nx13243,
         nx13245, nx13247, nx13249, nx13251, nx13253, nx13255, nx13257, nx13259,
         nx13261, nx13263, nx13265, nx13267, nx13269, nx13271, nx13273, nx13275,
         nx13277, nx13279, nx13281, nx13283, nx13285, nx13287, nx13289, nx13291,
         nx13293, nx13295, nx13297, nx13299, nx13301, nx13303, nx13305, nx13307,
         nx13309, nx13311, nx13313, nx13315, nx13317, nx13319, nx13321, nx13323,
         nx13325, nx13327, nx13329, nx13331, nx13333, nx13335, nx13337, nx13339,
         nx13341, nx13343, nx13345, nx13347, nx13349, nx13351, nx13353, nx13355,
         nx13357, nx13359, nx13361, nx13363, nx13365, nx13367, nx13369, nx13371,
         nx13373, nx13375, nx13377, nx13379, nx13381, nx13383, nx13385, nx13387,
         nx13389, nx13391, nx13393, nx13395, nx13397, nx13399, nx13401, nx13403,
         nx13405, nx13407, nx13409, nx13411, nx13413, nx13415, nx13417, nx13419,
         nx13421, nx13423, nx13425, nx13427, nx13429, nx13431, nx13433, nx13435,
         nx13437, nx13439, nx13441, nx13443, nx13445, nx13447, nx13449, nx13451,
         nx13453, nx13455, nx13457, nx13459, nx13461, nx13463, nx13465, nx13467,
         nx13469, nx13471, nx13473, nx13475, nx13477, nx13479, nx13481, nx13483,
         nx13485, nx13487, nx13493, nx13495, nx13497, nx13499, nx13501, nx13503,
         nx13505, nx13507, nx13509, nx13511, nx13513, nx13515, nx13517, nx13519,
         nx13521, nx13523, nx13525, nx13527, nx13529, nx13531, nx13533, nx13535,
         nx13537, nx13539, nx13541, nx13543, nx13545, nx13547, nx13549, nx13551,
         nx13553, nx13555, nx13557, nx13559, nx13561, nx13563, nx13565, nx13567,
         nx13569, nx13571, nx13573, nx13575, nx13577, nx13579, nx13581, nx13583,
         nx13585, nx13587, nx13589, nx13591, nx13593, nx13595, nx13597, nx13599,
         nx13601, nx13603, nx13605, nx13607, nx13609, nx13611, nx13613, nx13615,
         nx13617, nx13619, nx13621, nx13623, nx13625, nx13627, nx13629, nx13631,
         nx13633, nx13635, nx13637, nx13639, nx13641, nx13643, nx13645, nx13647,
         nx13649, nx13651, nx13653, nx13655, nx13657, nx13659, nx13661, nx13663,
         nx13665, nx13667, nx13669, nx13671, nx13673, nx13675, nx13677, nx13679,
         nx13681, nx13683, nx13685, nx13687, nx13689, nx13691, nx13693, nx13695,
         nx13697, nx13699, nx13701, nx13703, nx13705, nx13707, nx13709, nx13711,
         nx13713, nx13715, nx13717, nx13719, nx13721, nx13723, nx13725, nx13727,
         nx13729, nx13731, nx13733, nx13735, nx13737, nx13739, nx13741, nx13743,
         nx13745, nx13747, nx13749, nx13751, nx13753, nx13755, nx13757, nx13759,
         nx13761, nx13763, nx13765, nx13767, nx13769, nx13771, nx13773, nx13775,
         nx13777, nx13779, nx13781, nx13783, nx13785, nx13787, nx13789, nx13791,
         nx13793, nx13795, nx13797, nx13799, nx13801, nx13803, nx13805, nx13807,
         nx13809, nx13811, nx13813, nx13815, nx13817, nx13819, nx13821, nx13823,
         nx13825, nx13827, nx13829, nx13831, nx13833, nx13835, nx13837, nx13839,
         nx13841, nx13843, nx13845, nx13847, nx13849, nx13851, nx13853, nx13855,
         nx13857, nx13859, nx13861, nx13863, nx13869, nx13871;
    wire [199:0] \$dummy ;




    dff reg_data_24__0 (.Q (dataOut_24__0), .QB (\$dummy [0]), .D (nx9112), .CLK (
        clk)) ;
    mux21_ni ix9113 (.Y (nx9112), .A0 (nx196), .A1 (dataOut_24__0), .S0 (nx13107
             )) ;
    oai221 ix197 (.Y (nx196), .A0 (nx13069), .A1 (nx12827), .B0 (nx13079), .B1 (
           nx12839), .C0 (nx11143)) ;
    nand04 ix37 (.Y (nx36), .A0 (nx13735), .A1 (nx11118), .A2 (nx13721), .A3 (
           nx13075)) ;
    inv02 ix11119 (.Y (nx11118), .A (address[3])) ;
    nor02_2x ix11121 (.Y (nx11120), .A0 (nx13741), .A1 (nx13747)) ;
    nand03 ix79 (.Y (nx78), .A0 (nx11125), .A1 (nx58), .A2 (nx11135)) ;
    inv02 ix11128 (.Y (nx11127), .A (address[0])) ;
    xnor2 ix59 (.Y (nx58), .A0 (nx11130), .A1 (nx13721)) ;
    nand03 ix11131 (.Y (nx11130), .A0 (nx13729), .A1 (nx13735), .A2 (nx12823)) ;
    nor02_2x ix11136 (.Y (nx11135), .A0 (nx52), .A1 (nx11141)) ;
    aoi21 ix53 (.Y (nx52), .A0 (nx13075), .A1 (nx13087), .B0 (nx38)) ;
    xnor2 ix11142 (.Y (nx11141), .A0 (nx13729), .A1 (nx38)) ;
    aoi222 ix11144 (.Y (nx11143), .A0 (data_in[8]), .A1 (nx13091), .B0 (
           data_in[16]), .B1 (nx13099), .C0 (data_in[0]), .C1 (nx13103)) ;
    nand02 ix151 (.Y (nx150), .A0 (nx13741), .A1 (nx13747)) ;
    nand03 ix11151 (.Y (nx11150), .A0 (nx13729), .A1 (nx13735), .A2 (nx13857)) ;
    aoi21 ix139 (.Y (nx138), .A0 (nx12843), .A1 (nx13087), .B0 (nx122)) ;
    nand02 ix119 (.Y (nx118), .A0 (nx13741), .A1 (nx13747)) ;
    xnor2 ix11159 (.Y (nx11158), .A0 (nx13729), .A1 (nx122)) ;
    nand02 ix67 (.Y (nx66), .A0 (nx13741), .A1 (nx11127)) ;
    nand03 ix11166 (.Y (nx11165), .A0 (nx13729), .A1 (nx13741), .A2 (nx13735)) ;
    nand02_2x ix105 (.Y (nx104), .A0 (nx11168), .A1 (nx94)) ;
    oai21 ix11169 (.Y (nx11168), .A0 (nx13735), .A1 (nx13741), .B0 (nx11170)) ;
    nand02 ix11171 (.Y (nx11170), .A0 (nx13741), .A1 (nx13735)) ;
    xnor2 ix95 (.Y (nx94), .A0 (nx13729), .A1 (nx11170)) ;
    aoi32 ix11182 (.Y (nx11181), .A0 (nx13729), .A1 (nx13087), .A2 (nx10), .B0 (
          nx13717), .B1 (nx164)) ;
    nand02 ix11185 (.Y (nx11184), .A0 (nx13721), .A1 (nx13717)) ;
    nand04 ix165 (.Y (nx164), .A0 (nx156), .A1 (nx112), .A2 (nx12839), .A3 (
           nx12827)) ;
    nand03 ix157 (.Y (nx156), .A0 (nx11188), .A1 (nx144), .A2 (nx11193)) ;
    xnor2 ix145 (.Y (nx144), .A0 (nx13721), .A1 (nx11150)) ;
    nor02_2x ix11194 (.Y (nx11193), .A0 (nx138), .A1 (nx11158)) ;
    xnor2 ix107 (.Y (nx106), .A0 (nx13721), .A1 (nx11165)) ;
    dff reg_data_24__1 (.Q (dataOut_24__1), .QB (\$dummy [1]), .D (nx9122), .CLK (
        clk)) ;
    mux21_ni ix9123 (.Y (nx9122), .A0 (nx230), .A1 (dataOut_24__1), .S0 (nx13107
             )) ;
    oai221 ix231 (.Y (nx230), .A0 (nx13117), .A1 (nx12827), .B0 (nx13123), .B1 (
           nx12839), .C0 (nx11209)) ;
    aoi222 ix11210 (.Y (nx11209), .A0 (data_in[9]), .A1 (nx13091), .B0 (
           data_in[17]), .B1 (nx13099), .C0 (data_in[1]), .C1 (nx13103)) ;
    dff reg_data_24__2 (.Q (dataOut_24__2), .QB (\$dummy [2]), .D (nx9132), .CLK (
        clk)) ;
    mux21_ni ix9133 (.Y (nx9132), .A0 (nx264), .A1 (dataOut_24__2), .S0 (nx13107
             )) ;
    oai221 ix265 (.Y (nx264), .A0 (nx13131), .A1 (nx12827), .B0 (nx13137), .B1 (
           nx12839), .C0 (nx11219)) ;
    aoi222 ix11220 (.Y (nx11219), .A0 (data_in[10]), .A1 (nx13091), .B0 (
           data_in[18]), .B1 (nx13099), .C0 (data_in[2]), .C1 (nx13103)) ;
    dff reg_data_24__3 (.Q (dataOut_24__3), .QB (\$dummy [3]), .D (nx9142), .CLK (
        clk)) ;
    mux21_ni ix9143 (.Y (nx9142), .A0 (nx298), .A1 (dataOut_24__3), .S0 (nx13107
             )) ;
    oai221 ix299 (.Y (nx298), .A0 (nx13145), .A1 (nx12827), .B0 (nx13151), .B1 (
           nx12839), .C0 (nx11229)) ;
    aoi222 ix11230 (.Y (nx11229), .A0 (data_in[11]), .A1 (nx13091), .B0 (
           data_in[19]), .B1 (nx13099), .C0 (data_in[3]), .C1 (nx13103)) ;
    dff reg_data_24__4 (.Q (dataOut_24__4), .QB (\$dummy [4]), .D (nx9152), .CLK (
        clk)) ;
    mux21_ni ix9153 (.Y (nx9152), .A0 (nx332), .A1 (dataOut_24__4), .S0 (nx13107
             )) ;
    oai221 ix333 (.Y (nx332), .A0 (nx13159), .A1 (nx12827), .B0 (nx13165), .B1 (
           nx12839), .C0 (nx11239)) ;
    aoi222 ix11240 (.Y (nx11239), .A0 (data_in[12]), .A1 (nx13091), .B0 (
           data_in[20]), .B1 (nx13099), .C0 (data_in[4]), .C1 (nx13103)) ;
    dff reg_data_24__5 (.Q (dataOut_24__5), .QB (\$dummy [5]), .D (nx9162), .CLK (
        clk)) ;
    mux21_ni ix9163 (.Y (nx9162), .A0 (nx366), .A1 (dataOut_24__5), .S0 (nx13107
             )) ;
    oai221 ix367 (.Y (nx366), .A0 (nx13173), .A1 (nx12827), .B0 (nx13179), .B1 (
           nx12839), .C0 (nx11249)) ;
    aoi222 ix11250 (.Y (nx11249), .A0 (data_in[13]), .A1 (nx13091), .B0 (
           data_in[21]), .B1 (nx13099), .C0 (data_in[5]), .C1 (nx13103)) ;
    dff reg_data_24__6 (.Q (dataOut_24__6), .QB (\$dummy [6]), .D (nx9172), .CLK (
        clk)) ;
    mux21_ni ix9173 (.Y (nx9172), .A0 (nx400), .A1 (dataOut_24__6), .S0 (nx13107
             )) ;
    oai221 ix401 (.Y (nx400), .A0 (nx13187), .A1 (nx12829), .B0 (nx13193), .B1 (
           nx12841), .C0 (nx11259)) ;
    aoi222 ix11260 (.Y (nx11259), .A0 (data_in[14]), .A1 (nx13091), .B0 (
           data_in[22]), .B1 (nx13099), .C0 (data_in[6]), .C1 (nx13103)) ;
    dff reg_data_24__7 (.Q (dataOut_24__7), .QB (\$dummy [7]), .D (nx9182), .CLK (
        clk)) ;
    mux21_ni ix9183 (.Y (nx9182), .A0 (nx434), .A1 (dataOut_24__7), .S0 (nx13109
             )) ;
    oai221 ix435 (.Y (nx434), .A0 (nx13201), .A1 (nx12829), .B0 (nx13207), .B1 (
           nx12841), .C0 (nx11269)) ;
    aoi222 ix11270 (.Y (nx11269), .A0 (data_in[15]), .A1 (nx13093), .B0 (
           data_in[23]), .B1 (nx13101), .C0 (data_in[7]), .C1 (nx13105)) ;
    dff reg_data_23__0 (.Q (dataOut_23__0), .QB (\$dummy [8]), .D (nx9192), .CLK (
        clk)) ;
    mux21_ni ix9193 (.Y (nx9192), .A0 (dataOut_23__0), .A1 (nx540), .S0 (nx12853
             )) ;
    nand02 ix473 (.Y (nx472), .A0 (nx11279), .A1 (nx11284)) ;
    nand02 ix467 (.Y (nx466), .A0 (nx52), .A1 (nx11141)) ;
    nor02_2x ix11285 (.Y (nx11284), .A0 (nx13743), .A1 (nx13747)) ;
    aoi222 ix11287 (.Y (nx11286), .A0 (data_in[8]), .A1 (nx13215), .B0 (
           data_in[16]), .B1 (nx13219), .C0 (data_in[0]), .C1 (nx13223)) ;
    and02 ix11289 (.Y (nx11288), .A0 (nx11290), .A1 (nx13753)) ;
    nand02 ix495 (.Y (nx494), .A0 (nx138), .A1 (nx11158)) ;
    nand02 ix487 (.Y (nx486), .A0 (nx11298), .A1 (nx106)) ;
    nor02_2x ix11299 (.Y (nx11298), .A0 (nx11168), .A1 (nx94)) ;
    nor04 ix11302 (.Y (nx11301), .A0 (nx13215), .A1 (nx13219), .A2 (nx13757), .A3 (
          nx13759)) ;
    nand03 ix457 (.Y (nx456), .A0 (nx13721), .A1 (nx13087), .A2 (nx11118)) ;
    oai22 ix513 (.Y (nx512), .A0 (nx13861), .A1 (nx13223), .B0 (nx12843), .B1 (
          nx11311)) ;
    nand04 ix11312 (.Y (nx11311), .A0 (nx13721), .A1 (nx13717), .A2 (nx11118), .A3 (
           nx13735)) ;
    dff reg_data_23__1 (.Q (dataOut_23__1), .QB (\$dummy [9]), .D (nx9202), .CLK (
        clk)) ;
    mux21_ni ix9203 (.Y (nx9202), .A0 (dataOut_23__1), .A1 (nx574), .S0 (nx12853
             )) ;
    aoi222 ix11318 (.Y (nx11317), .A0 (data_in[9]), .A1 (nx13215), .B0 (
           data_in[17]), .B1 (nx13219), .C0 (data_in[1]), .C1 (nx13223)) ;
    dff reg_data_23__2 (.Q (dataOut_23__2), .QB (\$dummy [10]), .D (nx9212), .CLK (
        clk)) ;
    mux21_ni ix9213 (.Y (nx9212), .A0 (dataOut_23__2), .A1 (nx608), .S0 (nx12853
             )) ;
    aoi222 ix11324 (.Y (nx11323), .A0 (data_in[10]), .A1 (nx13215), .B0 (
           data_in[18]), .B1 (nx13219), .C0 (data_in[2]), .C1 (nx13223)) ;
    dff reg_data_23__3 (.Q (dataOut_23__3), .QB (\$dummy [11]), .D (nx9222), .CLK (
        clk)) ;
    mux21_ni ix9223 (.Y (nx9222), .A0 (dataOut_23__3), .A1 (nx642), .S0 (nx12853
             )) ;
    aoi222 ix11330 (.Y (nx11329), .A0 (data_in[11]), .A1 (nx13215), .B0 (
           data_in[19]), .B1 (nx13219), .C0 (data_in[3]), .C1 (nx13223)) ;
    dff reg_data_23__4 (.Q (dataOut_23__4), .QB (\$dummy [12]), .D (nx9232), .CLK (
        clk)) ;
    mux21_ni ix9233 (.Y (nx9232), .A0 (dataOut_23__4), .A1 (nx676), .S0 (nx12853
             )) ;
    aoi222 ix11336 (.Y (nx11335), .A0 (data_in[12]), .A1 (nx13215), .B0 (
           data_in[20]), .B1 (nx13219), .C0 (data_in[4]), .C1 (nx13223)) ;
    dff reg_data_23__5 (.Q (dataOut_23__5), .QB (\$dummy [13]), .D (nx9242), .CLK (
        clk)) ;
    mux21_ni ix9243 (.Y (nx9242), .A0 (dataOut_23__5), .A1 (nx710), .S0 (nx12853
             )) ;
    aoi222 ix11342 (.Y (nx11341), .A0 (data_in[13]), .A1 (nx13215), .B0 (
           data_in[21]), .B1 (nx13219), .C0 (data_in[5]), .C1 (nx13223)) ;
    dff reg_data_23__6 (.Q (dataOut_23__6), .QB (\$dummy [14]), .D (nx9252), .CLK (
        clk)) ;
    mux21_ni ix9253 (.Y (nx9252), .A0 (dataOut_23__6), .A1 (nx744), .S0 (nx12853
             )) ;
    aoi222 ix11348 (.Y (nx11347), .A0 (data_in[14]), .A1 (nx13217), .B0 (
           data_in[22]), .B1 (nx13221), .C0 (data_in[6]), .C1 (nx13225)) ;
    dff reg_data_23__7 (.Q (dataOut_23__7), .QB (\$dummy [15]), .D (nx9262), .CLK (
        clk)) ;
    mux21_ni ix9263 (.Y (nx9262), .A0 (dataOut_23__7), .A1 (nx778), .S0 (nx12855
             )) ;
    aoi222 ix11354 (.Y (nx11353), .A0 (data_in[15]), .A1 (nx13217), .B0 (
           data_in[23]), .B1 (nx13221), .C0 (data_in[7]), .C1 (nx13225)) ;
    dff reg_data_22__0 (.Q (dataOut_22__0), .QB (\$dummy [16]), .D (nx9272), .CLK (
        clk)) ;
    mux21_ni ix9273 (.Y (nx9272), .A0 (dataOut_22__0), .A1 (nx842), .S0 (nx12863
             )) ;
    aoi222 ix11362 (.Y (nx11361), .A0 (data_in[8]), .A1 (nx13233), .B0 (
           data_in[16]), .B1 (nx13237), .C0 (data_in[0]), .C1 (nx13241)) ;
    nand02 ix73 (.Y (nx72), .A0 (nx13111), .A1 (nx13747)) ;
    nor04 ix11372 (.Y (nx11371), .A0 (nx13233), .A1 (nx13237), .A2 (nx13763), .A3 (
          nx13767)) ;
    oai22 ix815 (.Y (nx814), .A0 (nx13861), .A1 (nx13241), .B0 (nx12835), .B1 (
          nx11311)) ;
    dff reg_data_22__1 (.Q (dataOut_22__1), .QB (\$dummy [17]), .D (nx9282), .CLK (
        clk)) ;
    mux21_ni ix9283 (.Y (nx9282), .A0 (dataOut_22__1), .A1 (nx876), .S0 (nx12863
             )) ;
    aoi222 ix11391 (.Y (nx11390), .A0 (data_in[9]), .A1 (nx13233), .B0 (
           data_in[17]), .B1 (nx13237), .C0 (data_in[1]), .C1 (nx13241)) ;
    dff reg_data_22__2 (.Q (dataOut_22__2), .QB (\$dummy [18]), .D (nx9292), .CLK (
        clk)) ;
    mux21_ni ix9293 (.Y (nx9292), .A0 (dataOut_22__2), .A1 (nx910), .S0 (nx12863
             )) ;
    aoi222 ix11397 (.Y (nx11396), .A0 (data_in[10]), .A1 (nx13233), .B0 (
           data_in[18]), .B1 (nx13237), .C0 (data_in[2]), .C1 (nx13241)) ;
    dff reg_data_22__3 (.Q (dataOut_22__3), .QB (\$dummy [19]), .D (nx9302), .CLK (
        clk)) ;
    mux21_ni ix9303 (.Y (nx9302), .A0 (dataOut_22__3), .A1 (nx944), .S0 (nx12863
             )) ;
    aoi222 ix11403 (.Y (nx11402), .A0 (data_in[11]), .A1 (nx13233), .B0 (
           data_in[19]), .B1 (nx13237), .C0 (data_in[3]), .C1 (nx13241)) ;
    dff reg_data_22__4 (.Q (dataOut_22__4), .QB (\$dummy [20]), .D (nx9312), .CLK (
        clk)) ;
    mux21_ni ix9313 (.Y (nx9312), .A0 (dataOut_22__4), .A1 (nx978), .S0 (nx12863
             )) ;
    aoi222 ix11409 (.Y (nx11408), .A0 (data_in[12]), .A1 (nx13233), .B0 (
           data_in[20]), .B1 (nx13237), .C0 (data_in[4]), .C1 (nx13241)) ;
    dff reg_data_22__5 (.Q (dataOut_22__5), .QB (\$dummy [21]), .D (nx9322), .CLK (
        clk)) ;
    mux21_ni ix9323 (.Y (nx9322), .A0 (dataOut_22__5), .A1 (nx1012), .S0 (
             nx12863)) ;
    aoi222 ix11415 (.Y (nx11414), .A0 (data_in[13]), .A1 (nx13233), .B0 (
           data_in[21]), .B1 (nx13237), .C0 (data_in[5]), .C1 (nx13241)) ;
    dff reg_data_22__6 (.Q (dataOut_22__6), .QB (\$dummy [22]), .D (nx9332), .CLK (
        clk)) ;
    mux21_ni ix9333 (.Y (nx9332), .A0 (dataOut_22__6), .A1 (nx1046), .S0 (
             nx12863)) ;
    aoi222 ix11421 (.Y (nx11420), .A0 (data_in[14]), .A1 (nx13235), .B0 (
           data_in[22]), .B1 (nx13239), .C0 (data_in[6]), .C1 (nx13243)) ;
    dff reg_data_22__7 (.Q (dataOut_22__7), .QB (\$dummy [23]), .D (nx9342), .CLK (
        clk)) ;
    mux21_ni ix9343 (.Y (nx9342), .A0 (dataOut_22__7), .A1 (nx1080), .S0 (
             nx12865)) ;
    aoi222 ix11427 (.Y (nx11426), .A0 (data_in[15]), .A1 (nx13235), .B0 (
           data_in[23]), .B1 (nx13239), .C0 (data_in[7]), .C1 (nx13243)) ;
    dff reg_data_21__0 (.Q (dataOut_21__0), .QB (\$dummy [24]), .D (nx9352), .CLK (
        clk)) ;
    mux21_ni ix9353 (.Y (nx9352), .A0 (dataOut_21__0), .A1 (nx1144), .S0 (
             nx12873)) ;
    nand02 ix1095 (.Y (nx1094), .A0 (nx11279), .A1 (nx13753)) ;
    aoi222 ix11435 (.Y (nx11434), .A0 (data_in[8]), .A1 (nx13245), .B0 (
           data_in[16]), .B1 (nx13249), .C0 (data_in[0]), .C1 (nx13253)) ;
    and02 ix11437 (.Y (nx11436), .A0 (nx11290), .A1 (nx11284)) ;
    nor04 ix11441 (.Y (nx11440), .A0 (nx13245), .A1 (nx13249), .A2 (nx13771), .A3 (
          nx13773)) ;
    oai22 ix1117 (.Y (nx1116), .A0 (nx13861), .A1 (nx13253), .B0 (nx12831), .B1 (
          nx11311)) ;
    dff reg_data_21__1 (.Q (dataOut_21__1), .QB (\$dummy [25]), .D (nx9362), .CLK (
        clk)) ;
    mux21_ni ix9363 (.Y (nx9362), .A0 (dataOut_21__1), .A1 (nx1178), .S0 (
             nx12873)) ;
    aoi222 ix11452 (.Y (nx11451), .A0 (data_in[9]), .A1 (nx13245), .B0 (
           data_in[17]), .B1 (nx13249), .C0 (data_in[1]), .C1 (nx13253)) ;
    dff reg_data_21__2 (.Q (dataOut_21__2), .QB (\$dummy [26]), .D (nx9372), .CLK (
        clk)) ;
    mux21_ni ix9373 (.Y (nx9372), .A0 (dataOut_21__2), .A1 (nx1212), .S0 (
             nx12873)) ;
    aoi222 ix11458 (.Y (nx11457), .A0 (data_in[10]), .A1 (nx13245), .B0 (
           data_in[18]), .B1 (nx13249), .C0 (data_in[2]), .C1 (nx13253)) ;
    dff reg_data_21__3 (.Q (dataOut_21__3), .QB (\$dummy [27]), .D (nx9382), .CLK (
        clk)) ;
    mux21_ni ix9383 (.Y (nx9382), .A0 (dataOut_21__3), .A1 (nx1246), .S0 (
             nx12873)) ;
    aoi222 ix11464 (.Y (nx11463), .A0 (data_in[11]), .A1 (nx13245), .B0 (
           data_in[19]), .B1 (nx13249), .C0 (data_in[3]), .C1 (nx13253)) ;
    dff reg_data_21__4 (.Q (dataOut_21__4), .QB (\$dummy [28]), .D (nx9392), .CLK (
        clk)) ;
    mux21_ni ix9393 (.Y (nx9392), .A0 (dataOut_21__4), .A1 (nx1280), .S0 (
             nx12873)) ;
    aoi222 ix11470 (.Y (nx11469), .A0 (data_in[12]), .A1 (nx13245), .B0 (
           data_in[20]), .B1 (nx13249), .C0 (data_in[4]), .C1 (nx13253)) ;
    dff reg_data_21__5 (.Q (dataOut_21__5), .QB (\$dummy [29]), .D (nx9402), .CLK (
        clk)) ;
    mux21_ni ix9403 (.Y (nx9402), .A0 (dataOut_21__5), .A1 (nx1314), .S0 (
             nx12873)) ;
    aoi222 ix11476 (.Y (nx11475), .A0 (data_in[13]), .A1 (nx13245), .B0 (
           data_in[21]), .B1 (nx13249), .C0 (data_in[5]), .C1 (nx13253)) ;
    dff reg_data_21__6 (.Q (dataOut_21__6), .QB (\$dummy [30]), .D (nx9412), .CLK (
        clk)) ;
    mux21_ni ix9413 (.Y (nx9412), .A0 (dataOut_21__6), .A1 (nx1348), .S0 (
             nx12873)) ;
    aoi222 ix11482 (.Y (nx11481), .A0 (data_in[14]), .A1 (nx13247), .B0 (
           data_in[22]), .B1 (nx13251), .C0 (data_in[6]), .C1 (nx13255)) ;
    dff reg_data_21__7 (.Q (dataOut_21__7), .QB (\$dummy [31]), .D (nx9422), .CLK (
        clk)) ;
    mux21_ni ix9423 (.Y (nx9422), .A0 (dataOut_21__7), .A1 (nx1382), .S0 (
             nx12875)) ;
    aoi222 ix11488 (.Y (nx11487), .A0 (data_in[15]), .A1 (nx13247), .B0 (
           data_in[23]), .B1 (nx13251), .C0 (data_in[7]), .C1 (nx13255)) ;
    dff reg_data_20__0 (.Q (dataOut_20__0), .QB (\$dummy [32]), .D (nx9432), .CLK (
        clk)) ;
    mux21_ni ix9433 (.Y (nx9432), .A0 (dataOut_20__0), .A1 (nx1446), .S0 (
             nx12883)) ;
    aoi222 ix11496 (.Y (nx11495), .A0 (data_in[8]), .A1 (nx13257), .B0 (
           data_in[16]), .B1 (nx13261), .C0 (data_in[0]), .C1 (nx13265)) ;
    nor04 ix11502 (.Y (nx11501), .A0 (nx13257), .A1 (nx13261), .A2 (nx13777), .A3 (
          nx13781)) ;
    oai22 ix1419 (.Y (nx1418), .A0 (nx13861), .A1 (nx13265), .B0 (nx12823), .B1 (
          nx11311)) ;
    dff reg_data_20__1 (.Q (dataOut_20__1), .QB (\$dummy [33]), .D (nx9442), .CLK (
        clk)) ;
    mux21_ni ix9443 (.Y (nx9442), .A0 (dataOut_20__1), .A1 (nx1480), .S0 (
             nx12883)) ;
    aoi222 ix11513 (.Y (nx11512), .A0 (data_in[9]), .A1 (nx13257), .B0 (
           data_in[17]), .B1 (nx13261), .C0 (data_in[1]), .C1 (nx13265)) ;
    dff reg_data_20__2 (.Q (dataOut_20__2), .QB (\$dummy [34]), .D (nx9452), .CLK (
        clk)) ;
    mux21_ni ix9453 (.Y (nx9452), .A0 (dataOut_20__2), .A1 (nx1514), .S0 (
             nx12883)) ;
    aoi222 ix11519 (.Y (nx11518), .A0 (data_in[10]), .A1 (nx13257), .B0 (
           data_in[18]), .B1 (nx13261), .C0 (data_in[2]), .C1 (nx13265)) ;
    dff reg_data_20__3 (.Q (dataOut_20__3), .QB (\$dummy [35]), .D (nx9462), .CLK (
        clk)) ;
    mux21_ni ix9463 (.Y (nx9462), .A0 (dataOut_20__3), .A1 (nx1548), .S0 (
             nx12883)) ;
    aoi222 ix11525 (.Y (nx11524), .A0 (data_in[11]), .A1 (nx13257), .B0 (
           data_in[19]), .B1 (nx13261), .C0 (data_in[3]), .C1 (nx13265)) ;
    dff reg_data_20__4 (.Q (dataOut_20__4), .QB (\$dummy [36]), .D (nx9472), .CLK (
        clk)) ;
    mux21_ni ix9473 (.Y (nx9472), .A0 (dataOut_20__4), .A1 (nx1582), .S0 (
             nx12883)) ;
    aoi222 ix11531 (.Y (nx11530), .A0 (data_in[12]), .A1 (nx13257), .B0 (
           data_in[20]), .B1 (nx13261), .C0 (data_in[4]), .C1 (nx13265)) ;
    dff reg_data_20__5 (.Q (dataOut_20__5), .QB (\$dummy [37]), .D (nx9482), .CLK (
        clk)) ;
    mux21_ni ix9483 (.Y (nx9482), .A0 (dataOut_20__5), .A1 (nx1616), .S0 (
             nx12883)) ;
    aoi222 ix11537 (.Y (nx11536), .A0 (data_in[13]), .A1 (nx13257), .B0 (
           data_in[21]), .B1 (nx13261), .C0 (data_in[5]), .C1 (nx13265)) ;
    dff reg_data_20__6 (.Q (dataOut_20__6), .QB (\$dummy [38]), .D (nx9492), .CLK (
        clk)) ;
    mux21_ni ix9493 (.Y (nx9492), .A0 (dataOut_20__6), .A1 (nx1650), .S0 (
             nx12883)) ;
    aoi222 ix11543 (.Y (nx11542), .A0 (data_in[14]), .A1 (nx13259), .B0 (
           data_in[22]), .B1 (nx13263), .C0 (data_in[6]), .C1 (nx13267)) ;
    dff reg_data_20__7 (.Q (dataOut_20__7), .QB (\$dummy [39]), .D (nx9502), .CLK (
        clk)) ;
    mux21_ni ix9503 (.Y (nx9502), .A0 (dataOut_20__7), .A1 (nx1684), .S0 (
             nx12885)) ;
    aoi222 ix11549 (.Y (nx11548), .A0 (data_in[15]), .A1 (nx13259), .B0 (
           data_in[23]), .B1 (nx13263), .C0 (data_in[7]), .C1 (nx13267)) ;
    dff reg_data_19__0 (.Q (dataOut_19__0), .QB (\$dummy [40]), .D (nx9512), .CLK (
        clk)) ;
    mux21_ni ix9513 (.Y (nx9512), .A0 (dataOut_19__0), .A1 (nx1778), .S0 (
             nx12895)) ;
    nor03_2x ix11556 (.Y (nx11555), .A0 (nx13723), .A1 (nx13087), .A2 (nx11118)
             ) ;
    aoi222 ix11561 (.Y (nx11560), .A0 (data_in[8]), .A1 (nx13269), .B0 (
           data_in[16]), .B1 (nx13273), .C0 (data_in[0]), .C1 (nx13277)) ;
    and02 ix11563 (.Y (nx11562), .A0 (nx11564), .A1 (nx13753)) ;
    nand02 ix1733 (.Y (nx1732), .A0 (nx11567), .A1 (nx11158)) ;
    nand02 ix1729 (.Y (nx1728), .A0 (nx11574), .A1 (nx106)) ;
    nor04 ix11578 (.Y (nx11577), .A0 (nx13269), .A1 (nx13273), .A2 (nx13785), .A3 (
          nx13789)) ;
    nor03_2x ix11580 (.Y (nx11579), .A0 (nx1714), .A1 (nx13743), .A2 (nx13747)
             ) ;
    nand03 ix1715 (.Y (nx1714), .A0 (nx11141), .A1 (nx58), .A2 (nx11378)) ;
    oai22 ix1751 (.Y (nx1750), .A0 (nx13861), .A1 (nx13277), .B0 (nx12843), .B1 (
          nx11586)) ;
    nand03 ix11587 (.Y (nx11586), .A0 (nx11588), .A1 (nx13723), .A2 (nx13717)) ;
    nor02_2x ix11589 (.Y (nx11588), .A0 (nx13737), .A1 (nx13731)) ;
    dff reg_data_19__1 (.Q (dataOut_19__1), .QB (\$dummy [41]), .D (nx9522), .CLK (
        clk)) ;
    mux21_ni ix9523 (.Y (nx9522), .A0 (dataOut_19__1), .A1 (nx1812), .S0 (
             nx12895)) ;
    aoi222 ix11595 (.Y (nx11594), .A0 (data_in[9]), .A1 (nx13269), .B0 (
           data_in[17]), .B1 (nx13273), .C0 (data_in[1]), .C1 (nx13277)) ;
    dff reg_data_19__2 (.Q (dataOut_19__2), .QB (\$dummy [42]), .D (nx9532), .CLK (
        clk)) ;
    mux21_ni ix9533 (.Y (nx9532), .A0 (dataOut_19__2), .A1 (nx1846), .S0 (
             nx12895)) ;
    aoi222 ix11601 (.Y (nx11600), .A0 (data_in[10]), .A1 (nx13269), .B0 (
           data_in[18]), .B1 (nx13273), .C0 (data_in[2]), .C1 (nx13277)) ;
    dff reg_data_19__3 (.Q (dataOut_19__3), .QB (\$dummy [43]), .D (nx9542), .CLK (
        clk)) ;
    mux21_ni ix9543 (.Y (nx9542), .A0 (dataOut_19__3), .A1 (nx1880), .S0 (
             nx12895)) ;
    aoi222 ix11607 (.Y (nx11606), .A0 (data_in[11]), .A1 (nx13269), .B0 (
           data_in[19]), .B1 (nx13273), .C0 (data_in[3]), .C1 (nx13277)) ;
    dff reg_data_19__4 (.Q (dataOut_19__4), .QB (\$dummy [44]), .D (nx9552), .CLK (
        clk)) ;
    mux21_ni ix9553 (.Y (nx9552), .A0 (dataOut_19__4), .A1 (nx1914), .S0 (
             nx12895)) ;
    aoi222 ix11613 (.Y (nx11612), .A0 (data_in[12]), .A1 (nx13269), .B0 (
           data_in[20]), .B1 (nx13273), .C0 (data_in[4]), .C1 (nx13277)) ;
    dff reg_data_19__5 (.Q (dataOut_19__5), .QB (\$dummy [45]), .D (nx9562), .CLK (
        clk)) ;
    mux21_ni ix9563 (.Y (nx9562), .A0 (dataOut_19__5), .A1 (nx1948), .S0 (
             nx12895)) ;
    aoi222 ix11619 (.Y (nx11618), .A0 (data_in[13]), .A1 (nx13269), .B0 (
           data_in[21]), .B1 (nx13273), .C0 (data_in[5]), .C1 (nx13277)) ;
    dff reg_data_19__6 (.Q (dataOut_19__6), .QB (\$dummy [46]), .D (nx9572), .CLK (
        clk)) ;
    mux21_ni ix9573 (.Y (nx9572), .A0 (dataOut_19__6), .A1 (nx1982), .S0 (
             nx12895)) ;
    aoi222 ix11625 (.Y (nx11624), .A0 (data_in[14]), .A1 (nx13271), .B0 (
           data_in[22]), .B1 (nx13275), .C0 (data_in[6]), .C1 (nx13279)) ;
    dff reg_data_19__7 (.Q (dataOut_19__7), .QB (\$dummy [47]), .D (nx9582), .CLK (
        clk)) ;
    mux21_ni ix9583 (.Y (nx9582), .A0 (dataOut_19__7), .A1 (nx2016), .S0 (
             nx12897)) ;
    aoi222 ix11631 (.Y (nx11630), .A0 (data_in[15]), .A1 (nx13271), .B0 (
           data_in[23]), .B1 (nx13275), .C0 (data_in[7]), .C1 (nx13279)) ;
    dff reg_data_18__0 (.Q (dataOut_18__0), .QB (\$dummy [48]), .D (nx9592), .CLK (
        clk)) ;
    mux21_ni ix9593 (.Y (nx9592), .A0 (dataOut_18__0), .A1 (nx2080), .S0 (
             nx12907)) ;
    aoi222 ix11639 (.Y (nx11638), .A0 (data_in[8]), .A1 (nx13281), .B0 (
           data_in[16]), .B1 (nx13285), .C0 (data_in[0]), .C1 (nx13289)) ;
    nor04 ix11649 (.Y (nx11648), .A0 (nx13281), .A1 (nx13285), .A2 (nx13793), .A3 (
          nx13795)) ;
    nor02_2x ix11651 (.Y (nx11650), .A0 (nx1714), .A1 (nx13869)) ;
    oai22 ix2053 (.Y (nx2052), .A0 (nx13861), .A1 (nx13289), .B0 (nx12835), .B1 (
          nx11586)) ;
    dff reg_data_18__1 (.Q (dataOut_18__1), .QB (\$dummy [49]), .D (nx9602), .CLK (
        clk)) ;
    mux21_ni ix9603 (.Y (nx9602), .A0 (dataOut_18__1), .A1 (nx2114), .S0 (
             nx12907)) ;
    aoi222 ix11660 (.Y (nx11659), .A0 (data_in[9]), .A1 (nx13281), .B0 (
           data_in[17]), .B1 (nx13285), .C0 (data_in[1]), .C1 (nx13289)) ;
    dff reg_data_18__2 (.Q (dataOut_18__2), .QB (\$dummy [50]), .D (nx9612), .CLK (
        clk)) ;
    mux21_ni ix9613 (.Y (nx9612), .A0 (dataOut_18__2), .A1 (nx2148), .S0 (
             nx12907)) ;
    aoi222 ix11666 (.Y (nx11665), .A0 (data_in[10]), .A1 (nx13281), .B0 (
           data_in[18]), .B1 (nx13285), .C0 (data_in[2]), .C1 (nx13289)) ;
    dff reg_data_18__3 (.Q (dataOut_18__3), .QB (\$dummy [51]), .D (nx9622), .CLK (
        clk)) ;
    mux21_ni ix9623 (.Y (nx9622), .A0 (dataOut_18__3), .A1 (nx2182), .S0 (
             nx12907)) ;
    aoi222 ix11672 (.Y (nx11671), .A0 (data_in[11]), .A1 (nx13281), .B0 (
           data_in[19]), .B1 (nx13285), .C0 (data_in[3]), .C1 (nx13289)) ;
    dff reg_data_18__4 (.Q (dataOut_18__4), .QB (\$dummy [52]), .D (nx9632), .CLK (
        clk)) ;
    mux21_ni ix9633 (.Y (nx9632), .A0 (dataOut_18__4), .A1 (nx2216), .S0 (
             nx12907)) ;
    aoi222 ix11678 (.Y (nx11677), .A0 (data_in[12]), .A1 (nx13281), .B0 (
           data_in[20]), .B1 (nx13285), .C0 (data_in[4]), .C1 (nx13289)) ;
    dff reg_data_18__5 (.Q (dataOut_18__5), .QB (\$dummy [53]), .D (nx9642), .CLK (
        clk)) ;
    mux21_ni ix9643 (.Y (nx9642), .A0 (dataOut_18__5), .A1 (nx2250), .S0 (
             nx12907)) ;
    aoi222 ix11684 (.Y (nx11683), .A0 (data_in[13]), .A1 (nx13281), .B0 (
           data_in[21]), .B1 (nx13285), .C0 (data_in[5]), .C1 (nx13289)) ;
    dff reg_data_18__6 (.Q (dataOut_18__6), .QB (\$dummy [54]), .D (nx9652), .CLK (
        clk)) ;
    mux21_ni ix9653 (.Y (nx9652), .A0 (dataOut_18__6), .A1 (nx2284), .S0 (
             nx12907)) ;
    aoi222 ix11690 (.Y (nx11689), .A0 (data_in[14]), .A1 (nx13283), .B0 (
           data_in[22]), .B1 (nx13287), .C0 (data_in[6]), .C1 (nx13291)) ;
    dff reg_data_18__7 (.Q (dataOut_18__7), .QB (\$dummy [55]), .D (nx9662), .CLK (
        clk)) ;
    mux21_ni ix9663 (.Y (nx9662), .A0 (dataOut_18__7), .A1 (nx2318), .S0 (
             nx12909)) ;
    aoi222 ix11696 (.Y (nx11695), .A0 (data_in[15]), .A1 (nx13283), .B0 (
           data_in[23]), .B1 (nx13287), .C0 (data_in[7]), .C1 (nx13291)) ;
    dff reg_data_17__0 (.Q (dataOut_17__0), .QB (\$dummy [56]), .D (nx9672), .CLK (
        clk)) ;
    mux21_ni ix9673 (.Y (nx9672), .A0 (dataOut_17__0), .A1 (nx2382), .S0 (
             nx12919)) ;
    aoi222 ix11704 (.Y (nx11703), .A0 (data_in[8]), .A1 (nx13293), .B0 (
           data_in[16]), .B1 (nx13297), .C0 (data_in[0]), .C1 (nx13301)) ;
    and02 ix11706 (.Y (nx11705), .A0 (nx11564), .A1 (nx11284)) ;
    nor04 ix11710 (.Y (nx11709), .A0 (nx13293), .A1 (nx13297), .A2 (nx13799), .A3 (
          nx13803)) ;
    oai22 ix2355 (.Y (nx2354), .A0 (nx13861), .A1 (nx13301), .B0 (nx12831), .B1 (
          nx11586)) ;
    dff reg_data_17__1 (.Q (dataOut_17__1), .QB (\$dummy [57]), .D (nx9682), .CLK (
        clk)) ;
    mux21_ni ix9683 (.Y (nx9682), .A0 (dataOut_17__1), .A1 (nx2416), .S0 (
             nx12919)) ;
    aoi222 ix11722 (.Y (nx11721), .A0 (data_in[9]), .A1 (nx13293), .B0 (
           data_in[17]), .B1 (nx13297), .C0 (data_in[1]), .C1 (nx13301)) ;
    dff reg_data_17__2 (.Q (dataOut_17__2), .QB (\$dummy [58]), .D (nx9692), .CLK (
        clk)) ;
    mux21_ni ix9693 (.Y (nx9692), .A0 (dataOut_17__2), .A1 (nx2450), .S0 (
             nx12919)) ;
    aoi222 ix11728 (.Y (nx11727), .A0 (data_in[10]), .A1 (nx13293), .B0 (
           data_in[18]), .B1 (nx13297), .C0 (data_in[2]), .C1 (nx13301)) ;
    dff reg_data_17__3 (.Q (dataOut_17__3), .QB (\$dummy [59]), .D (nx9702), .CLK (
        clk)) ;
    mux21_ni ix9703 (.Y (nx9702), .A0 (dataOut_17__3), .A1 (nx2484), .S0 (
             nx12919)) ;
    aoi222 ix11734 (.Y (nx11733), .A0 (data_in[11]), .A1 (nx13293), .B0 (
           data_in[19]), .B1 (nx13297), .C0 (data_in[3]), .C1 (nx13301)) ;
    dff reg_data_17__4 (.Q (dataOut_17__4), .QB (\$dummy [60]), .D (nx9712), .CLK (
        clk)) ;
    mux21_ni ix9713 (.Y (nx9712), .A0 (dataOut_17__4), .A1 (nx2518), .S0 (
             nx12919)) ;
    aoi222 ix11740 (.Y (nx11739), .A0 (data_in[12]), .A1 (nx13293), .B0 (
           data_in[20]), .B1 (nx13297), .C0 (data_in[4]), .C1 (nx13301)) ;
    dff reg_data_17__5 (.Q (dataOut_17__5), .QB (\$dummy [61]), .D (nx9722), .CLK (
        clk)) ;
    mux21_ni ix9723 (.Y (nx9722), .A0 (dataOut_17__5), .A1 (nx2552), .S0 (
             nx12919)) ;
    aoi222 ix11746 (.Y (nx11745), .A0 (data_in[13]), .A1 (nx13293), .B0 (
           data_in[21]), .B1 (nx13297), .C0 (data_in[5]), .C1 (nx13301)) ;
    dff reg_data_17__6 (.Q (dataOut_17__6), .QB (\$dummy [62]), .D (nx9732), .CLK (
        clk)) ;
    mux21_ni ix9733 (.Y (nx9732), .A0 (dataOut_17__6), .A1 (nx2586), .S0 (
             nx12919)) ;
    aoi222 ix11752 (.Y (nx11751), .A0 (data_in[14]), .A1 (nx13295), .B0 (
           data_in[22]), .B1 (nx13299), .C0 (data_in[6]), .C1 (nx13303)) ;
    dff reg_data_17__7 (.Q (dataOut_17__7), .QB (\$dummy [63]), .D (nx9742), .CLK (
        clk)) ;
    mux21_ni ix9743 (.Y (nx9742), .A0 (dataOut_17__7), .A1 (nx2620), .S0 (
             nx12921)) ;
    aoi222 ix11758 (.Y (nx11757), .A0 (data_in[15]), .A1 (nx13295), .B0 (
           data_in[23]), .B1 (nx13299), .C0 (data_in[7]), .C1 (nx13303)) ;
    dff reg_data_16__0 (.Q (dataOut_16__0), .QB (\$dummy [64]), .D (nx9752), .CLK (
        clk)) ;
    mux21_ni ix9753 (.Y (nx9752), .A0 (dataOut_16__0), .A1 (nx2684), .S0 (
             nx12931)) ;
    aoi222 ix11766 (.Y (nx11765), .A0 (data_in[8]), .A1 (nx13305), .B0 (
           data_in[16]), .B1 (nx13309), .C0 (data_in[0]), .C1 (nx13313)) ;
    nor04 ix11772 (.Y (nx11771), .A0 (nx13305), .A1 (nx13309), .A2 (nx13807), .A3 (
          nx13809)) ;
    nor02_2x ix11774 (.Y (nx11773), .A0 (nx1714), .A1 (nx72)) ;
    oai22 ix2657 (.Y (nx2656), .A0 (nx13229), .A1 (nx13313), .B0 (nx12823), .B1 (
          nx11586)) ;
    dff reg_data_16__1 (.Q (dataOut_16__1), .QB (\$dummy [65]), .D (nx9762), .CLK (
        clk)) ;
    mux21_ni ix9763 (.Y (nx9762), .A0 (dataOut_16__1), .A1 (nx2718), .S0 (
             nx12931)) ;
    aoi222 ix11783 (.Y (nx11782), .A0 (data_in[9]), .A1 (nx13305), .B0 (
           data_in[17]), .B1 (nx13309), .C0 (data_in[1]), .C1 (nx13313)) ;
    dff reg_data_16__2 (.Q (dataOut_16__2), .QB (\$dummy [66]), .D (nx9772), .CLK (
        clk)) ;
    mux21_ni ix9773 (.Y (nx9772), .A0 (dataOut_16__2), .A1 (nx2752), .S0 (
             nx12931)) ;
    aoi222 ix11789 (.Y (nx11788), .A0 (data_in[10]), .A1 (nx13305), .B0 (
           data_in[18]), .B1 (nx13309), .C0 (data_in[2]), .C1 (nx13313)) ;
    dff reg_data_16__3 (.Q (dataOut_16__3), .QB (\$dummy [67]), .D (nx9782), .CLK (
        clk)) ;
    mux21_ni ix9783 (.Y (nx9782), .A0 (dataOut_16__3), .A1 (nx2786), .S0 (
             nx12931)) ;
    aoi222 ix11795 (.Y (nx11794), .A0 (data_in[11]), .A1 (nx13305), .B0 (
           data_in[19]), .B1 (nx13309), .C0 (data_in[3]), .C1 (nx13313)) ;
    dff reg_data_16__4 (.Q (dataOut_16__4), .QB (\$dummy [68]), .D (nx9792), .CLK (
        clk)) ;
    mux21_ni ix9793 (.Y (nx9792), .A0 (dataOut_16__4), .A1 (nx2820), .S0 (
             nx12931)) ;
    aoi222 ix11801 (.Y (nx11800), .A0 (data_in[12]), .A1 (nx13305), .B0 (
           data_in[20]), .B1 (nx13309), .C0 (data_in[4]), .C1 (nx13313)) ;
    dff reg_data_16__5 (.Q (dataOut_16__5), .QB (\$dummy [69]), .D (nx9802), .CLK (
        clk)) ;
    mux21_ni ix9803 (.Y (nx9802), .A0 (dataOut_16__5), .A1 (nx2854), .S0 (
             nx12931)) ;
    aoi222 ix11807 (.Y (nx11806), .A0 (data_in[13]), .A1 (nx13305), .B0 (
           data_in[21]), .B1 (nx13309), .C0 (data_in[5]), .C1 (nx13313)) ;
    dff reg_data_16__6 (.Q (dataOut_16__6), .QB (\$dummy [70]), .D (nx9812), .CLK (
        clk)) ;
    mux21_ni ix9813 (.Y (nx9812), .A0 (dataOut_16__6), .A1 (nx2888), .S0 (
             nx12931)) ;
    aoi222 ix11813 (.Y (nx11812), .A0 (data_in[14]), .A1 (nx13307), .B0 (
           data_in[22]), .B1 (nx13311), .C0 (data_in[6]), .C1 (nx13315)) ;
    dff reg_data_16__7 (.Q (dataOut_16__7), .QB (\$dummy [71]), .D (nx9822), .CLK (
        clk)) ;
    mux21_ni ix9823 (.Y (nx9822), .A0 (dataOut_16__7), .A1 (nx2922), .S0 (
             nx12933)) ;
    aoi222 ix11819 (.Y (nx11818), .A0 (data_in[15]), .A1 (nx13307), .B0 (
           data_in[23]), .B1 (nx13311), .C0 (data_in[7]), .C1 (nx13315)) ;
    dff reg_data_15__0 (.Q (dataOut_15__0), .QB (\$dummy [72]), .D (nx9832), .CLK (
        clk)) ;
    mux21_ni ix9833 (.Y (nx9832), .A0 (dataOut_15__0), .A1 (nx3024), .S0 (
             nx12943)) ;
    nor03_2x ix11826 (.Y (nx11825), .A0 (nx13723), .A1 (nx13737), .A2 (nx11118)
             ) ;
    nor03_2x ix11829 (.Y (nx11828), .A0 (nx13743), .A1 (nx13747), .A2 (nx13723)
             ) ;
    aoi222 ix11831 (.Y (nx11830), .A0 (data_in[8]), .A1 (nx13317), .B0 (
           data_in[16]), .B1 (nx13321), .C0 (data_in[0]), .C1 (nx13325)) ;
    and02 ix11833 (.Y (nx11832), .A0 (nx11834), .A1 (nx11836)) ;
    nor03_2x ix11835 (.Y (nx11834), .A0 (nx13749), .A1 (nx12837), .A2 (nx13723)
             ) ;
    nand02 ix2971 (.Y (nx2970), .A0 (nx100), .A1 (nx94)) ;
    nor04 ix11843 (.Y (nx11842), .A0 (nx13317), .A1 (nx13321), .A2 (nx13813), .A3 (
          nx13817)) ;
    oai22 ix2997 (.Y (nx2996), .A0 (nx13229), .A1 (nx13325), .B0 (nx12845), .B1 (
          nx11851)) ;
    nand03 ix11852 (.Y (nx11851), .A0 (nx13737), .A1 (nx13731), .A2 (nx2932)) ;
    dff reg_data_15__1 (.Q (dataOut_15__1), .QB (\$dummy [73]), .D (nx9842), .CLK (
        clk)) ;
    mux21_ni ix9843 (.Y (nx9842), .A0 (dataOut_15__1), .A1 (nx3058), .S0 (
             nx12943)) ;
    aoi222 ix11859 (.Y (nx11858), .A0 (data_in[9]), .A1 (nx13317), .B0 (
           data_in[17]), .B1 (nx13321), .C0 (data_in[1]), .C1 (nx13325)) ;
    dff reg_data_15__2 (.Q (dataOut_15__2), .QB (\$dummy [74]), .D (nx9852), .CLK (
        clk)) ;
    mux21_ni ix9853 (.Y (nx9852), .A0 (dataOut_15__2), .A1 (nx3092), .S0 (
             nx12943)) ;
    aoi222 ix11865 (.Y (nx11864), .A0 (data_in[10]), .A1 (nx13317), .B0 (
           data_in[18]), .B1 (nx13321), .C0 (data_in[2]), .C1 (nx13325)) ;
    dff reg_data_15__3 (.Q (dataOut_15__3), .QB (\$dummy [75]), .D (nx9862), .CLK (
        clk)) ;
    mux21_ni ix9863 (.Y (nx9862), .A0 (dataOut_15__3), .A1 (nx3126), .S0 (
             nx12943)) ;
    aoi222 ix11871 (.Y (nx11870), .A0 (data_in[11]), .A1 (nx13317), .B0 (
           data_in[19]), .B1 (nx13321), .C0 (data_in[3]), .C1 (nx13325)) ;
    dff reg_data_15__4 (.Q (dataOut_15__4), .QB (\$dummy [76]), .D (nx9872), .CLK (
        clk)) ;
    mux21_ni ix9873 (.Y (nx9872), .A0 (dataOut_15__4), .A1 (nx3160), .S0 (
             nx12943)) ;
    aoi222 ix11877 (.Y (nx11876), .A0 (data_in[12]), .A1 (nx13317), .B0 (
           data_in[20]), .B1 (nx13321), .C0 (data_in[4]), .C1 (nx13325)) ;
    dff reg_data_15__5 (.Q (dataOut_15__5), .QB (\$dummy [77]), .D (nx9882), .CLK (
        clk)) ;
    mux21_ni ix9883 (.Y (nx9882), .A0 (dataOut_15__5), .A1 (nx3194), .S0 (
             nx12943)) ;
    aoi222 ix11883 (.Y (nx11882), .A0 (data_in[13]), .A1 (nx13317), .B0 (
           data_in[21]), .B1 (nx13321), .C0 (data_in[5]), .C1 (nx13325)) ;
    dff reg_data_15__6 (.Q (dataOut_15__6), .QB (\$dummy [78]), .D (nx9892), .CLK (
        clk)) ;
    mux21_ni ix9893 (.Y (nx9892), .A0 (dataOut_15__6), .A1 (nx3228), .S0 (
             nx12943)) ;
    aoi222 ix11889 (.Y (nx11888), .A0 (data_in[14]), .A1 (nx13319), .B0 (
           data_in[22]), .B1 (nx13323), .C0 (data_in[6]), .C1 (nx13327)) ;
    dff reg_data_15__7 (.Q (dataOut_15__7), .QB (\$dummy [79]), .D (nx9902), .CLK (
        clk)) ;
    mux21_ni ix9903 (.Y (nx9902), .A0 (dataOut_15__7), .A1 (nx3262), .S0 (
             nx12945)) ;
    aoi222 ix11895 (.Y (nx11894), .A0 (data_in[15]), .A1 (nx13319), .B0 (
           data_in[23]), .B1 (nx13323), .C0 (data_in[7]), .C1 (nx13327)) ;
    dff reg_data_14__0 (.Q (dataOut_14__0), .QB (\$dummy [80]), .D (nx9912), .CLK (
        clk)) ;
    mux21_ni ix9913 (.Y (nx9912), .A0 (dataOut_14__0), .A1 (nx3338), .S0 (
             nx12955)) ;
    nor03_2x ix11903 (.Y (nx11902), .A0 (nx11141), .A1 (nx58), .A2 (nx11378)) ;
    aoi222 ix11905 (.Y (nx11904), .A0 (data_in[8]), .A1 (nx13329), .B0 (
           data_in[16]), .B1 (nx13333), .C0 (data_in[0]), .C1 (nx13337)) ;
    and02 ix11907 (.Y (nx11906), .A0 (nx11908), .A1 (nx11836)) ;
    nor03_2x ix11909 (.Y (nx11908), .A0 (nx13743), .A1 (nx11127), .A2 (nx13723)
             ) ;
    nor04 ix11911 (.Y (nx11910), .A0 (nx13723), .A1 (nx13743), .A2 (nx13749), .A3 (
          nx2970)) ;
    nor04 ix11913 (.Y (nx11912), .A0 (nx13329), .A1 (nx13333), .A2 (nx13821), .A3 (
          nx13825)) ;
    oai22 ix3311 (.Y (nx3310), .A0 (nx13229), .A1 (nx13337), .B0 (nx12837), .B1 (
          nx11851)) ;
    dff reg_data_14__1 (.Q (dataOut_14__1), .QB (\$dummy [81]), .D (nx9922), .CLK (
        clk)) ;
    mux21_ni ix9923 (.Y (nx9922), .A0 (dataOut_14__1), .A1 (nx3372), .S0 (
             nx12955)) ;
    aoi222 ix11924 (.Y (nx11923), .A0 (data_in[9]), .A1 (nx13329), .B0 (
           data_in[17]), .B1 (nx13333), .C0 (data_in[1]), .C1 (nx13337)) ;
    dff reg_data_14__2 (.Q (dataOut_14__2), .QB (\$dummy [82]), .D (nx9932), .CLK (
        clk)) ;
    mux21_ni ix9933 (.Y (nx9932), .A0 (dataOut_14__2), .A1 (nx3406), .S0 (
             nx12955)) ;
    aoi222 ix11930 (.Y (nx11929), .A0 (data_in[10]), .A1 (nx13329), .B0 (
           data_in[18]), .B1 (nx13333), .C0 (data_in[2]), .C1 (nx13337)) ;
    dff reg_data_14__3 (.Q (dataOut_14__3), .QB (\$dummy [83]), .D (nx9942), .CLK (
        clk)) ;
    mux21_ni ix9943 (.Y (nx9942), .A0 (dataOut_14__3), .A1 (nx3440), .S0 (
             nx12955)) ;
    aoi222 ix11936 (.Y (nx11935), .A0 (data_in[11]), .A1 (nx13329), .B0 (
           data_in[19]), .B1 (nx13333), .C0 (data_in[3]), .C1 (nx13337)) ;
    dff reg_data_14__4 (.Q (dataOut_14__4), .QB (\$dummy [84]), .D (nx9952), .CLK (
        clk)) ;
    mux21_ni ix9953 (.Y (nx9952), .A0 (dataOut_14__4), .A1 (nx3474), .S0 (
             nx12955)) ;
    aoi222 ix11942 (.Y (nx11941), .A0 (data_in[12]), .A1 (nx13329), .B0 (
           data_in[20]), .B1 (nx13333), .C0 (data_in[4]), .C1 (nx13337)) ;
    dff reg_data_14__5 (.Q (dataOut_14__5), .QB (\$dummy [85]), .D (nx9962), .CLK (
        clk)) ;
    mux21_ni ix9963 (.Y (nx9962), .A0 (dataOut_14__5), .A1 (nx3508), .S0 (
             nx12955)) ;
    aoi222 ix11948 (.Y (nx11947), .A0 (data_in[13]), .A1 (nx13329), .B0 (
           data_in[21]), .B1 (nx13333), .C0 (data_in[5]), .C1 (nx13337)) ;
    dff reg_data_14__6 (.Q (dataOut_14__6), .QB (\$dummy [86]), .D (nx9972), .CLK (
        clk)) ;
    mux21_ni ix9973 (.Y (nx9972), .A0 (dataOut_14__6), .A1 (nx3542), .S0 (
             nx12955)) ;
    aoi222 ix11954 (.Y (nx11953), .A0 (data_in[14]), .A1 (nx13331), .B0 (
           data_in[22]), .B1 (nx13335), .C0 (data_in[6]), .C1 (nx13339)) ;
    dff reg_data_14__7 (.Q (dataOut_14__7), .QB (\$dummy [87]), .D (nx9982), .CLK (
        clk)) ;
    mux21_ni ix9983 (.Y (nx9982), .A0 (dataOut_14__7), .A1 (nx3576), .S0 (
             nx12957)) ;
    aoi222 ix11960 (.Y (nx11959), .A0 (data_in[15]), .A1 (nx13331), .B0 (
           data_in[23]), .B1 (nx13335), .C0 (data_in[7]), .C1 (nx13339)) ;
    dff reg_data_13__0 (.Q (dataOut_13__0), .QB (\$dummy [88]), .D (nx9992), .CLK (
        clk)) ;
    mux21_ni ix9993 (.Y (nx9992), .A0 (dataOut_13__0), .A1 (nx3644), .S0 (
             nx12963)) ;
    oai221 ix3645 (.Y (nx3644), .A0 (nx13071), .A1 (nx12959), .B0 (nx13081), .B1 (
           nx12961), .C0 (nx11967)) ;
    nand02 ix3589 (.Y (nx3588), .A0 (nx11825), .A1 (nx13111)) ;
    nand02 ix3591 (.Y (nx3590), .A0 (nx11902), .A1 (nx13753)) ;
    aoi222 ix11968 (.Y (nx11967), .A0 (data_in[8]), .A1 (nx13341), .B0 (
           data_in[16]), .B1 (nx13345), .C0 (data_in[0]), .C1 (nx13349)) ;
    nor03_2x ix11972 (.Y (nx11971), .A0 (nx13743), .A1 (nx13749), .A2 (nx13725)
             ) ;
    and04 ix11976 (.Y (nx11975), .A0 (nx3604), .A1 (nx3600), .A2 (nx12961), .A3 (
          nx12959)) ;
    nand02 ix3605 (.Y (nx3604), .A0 (nx11971), .A1 (nx11836)) ;
    nand02 ix3601 (.Y (nx3600), .A0 (nx11979), .A1 (nx11981)) ;
    oai22 ix3617 (.Y (nx3616), .A0 (nx13229), .A1 (nx13349), .B0 (nx12831), .B1 (
          nx11851)) ;
    dff reg_data_13__1 (.Q (dataOut_13__1), .QB (\$dummy [89]), .D (nx10002), .CLK (
        clk)) ;
    mux21_ni ix10003 (.Y (nx10002), .A0 (dataOut_13__1), .A1 (nx3678), .S0 (
             nx12963)) ;
    oai221 ix3679 (.Y (nx3678), .A0 (nx13119), .A1 (nx12959), .B0 (nx13125), .B1 (
           nx12961), .C0 (nx11991)) ;
    aoi222 ix11992 (.Y (nx11991), .A0 (data_in[9]), .A1 (nx13341), .B0 (
           data_in[17]), .B1 (nx13345), .C0 (data_in[1]), .C1 (nx13349)) ;
    dff reg_data_13__2 (.Q (dataOut_13__2), .QB (\$dummy [90]), .D (nx10012), .CLK (
        clk)) ;
    mux21_ni ix10013 (.Y (nx10012), .A0 (dataOut_13__2), .A1 (nx3712), .S0 (
             nx12963)) ;
    oai221 ix3713 (.Y (nx3712), .A0 (nx13133), .A1 (nx12959), .B0 (nx13139), .B1 (
           nx12961), .C0 (nx11997)) ;
    aoi222 ix11998 (.Y (nx11997), .A0 (data_in[10]), .A1 (nx13341), .B0 (
           data_in[18]), .B1 (nx13345), .C0 (data_in[2]), .C1 (nx13349)) ;
    dff reg_data_13__3 (.Q (dataOut_13__3), .QB (\$dummy [91]), .D (nx10022), .CLK (
        clk)) ;
    mux21_ni ix10023 (.Y (nx10022), .A0 (dataOut_13__3), .A1 (nx3746), .S0 (
             nx12963)) ;
    oai221 ix3747 (.Y (nx3746), .A0 (nx13147), .A1 (nx12959), .B0 (nx13153), .B1 (
           nx12961), .C0 (nx12003)) ;
    aoi222 ix12004 (.Y (nx12003), .A0 (data_in[11]), .A1 (nx13341), .B0 (
           data_in[19]), .B1 (nx13345), .C0 (data_in[3]), .C1 (nx13349)) ;
    dff reg_data_13__4 (.Q (dataOut_13__4), .QB (\$dummy [92]), .D (nx10032), .CLK (
        clk)) ;
    mux21_ni ix10033 (.Y (nx10032), .A0 (dataOut_13__4), .A1 (nx3780), .S0 (
             nx12963)) ;
    oai221 ix3781 (.Y (nx3780), .A0 (nx13161), .A1 (nx3588), .B0 (nx13167), .B1 (
           nx3590), .C0 (nx12009)) ;
    aoi222 ix12010 (.Y (nx12009), .A0 (data_in[12]), .A1 (nx13341), .B0 (
           data_in[20]), .B1 (nx13345), .C0 (data_in[4]), .C1 (nx13349)) ;
    dff reg_data_13__5 (.Q (dataOut_13__5), .QB (\$dummy [93]), .D (nx10042), .CLK (
        clk)) ;
    mux21_ni ix10043 (.Y (nx10042), .A0 (dataOut_13__5), .A1 (nx3814), .S0 (
             nx12963)) ;
    oai221 ix3815 (.Y (nx3814), .A0 (nx13175), .A1 (nx3588), .B0 (nx13181), .B1 (
           nx3590), .C0 (nx12015)) ;
    aoi222 ix12016 (.Y (nx12015), .A0 (data_in[13]), .A1 (nx13341), .B0 (
           data_in[21]), .B1 (nx13345), .C0 (data_in[5]), .C1 (nx13349)) ;
    dff reg_data_13__6 (.Q (dataOut_13__6), .QB (\$dummy [94]), .D (nx10052), .CLK (
        clk)) ;
    mux21_ni ix10053 (.Y (nx10052), .A0 (dataOut_13__6), .A1 (nx3848), .S0 (
             nx12963)) ;
    oai221 ix3849 (.Y (nx3848), .A0 (nx13189), .A1 (nx3588), .B0 (nx13195), .B1 (
           nx3590), .C0 (nx12021)) ;
    aoi222 ix12022 (.Y (nx12021), .A0 (data_in[14]), .A1 (nx13341), .B0 (
           data_in[22]), .B1 (nx13345), .C0 (data_in[6]), .C1 (nx13351)) ;
    dff reg_data_13__7 (.Q (dataOut_13__7), .QB (\$dummy [95]), .D (nx10062), .CLK (
        clk)) ;
    mux21_ni ix10063 (.Y (nx10062), .A0 (dataOut_13__7), .A1 (nx3882), .S0 (
             nx12965)) ;
    oai221 ix3883 (.Y (nx3882), .A0 (nx13203), .A1 (nx3588), .B0 (nx13209), .B1 (
           nx3590), .C0 (nx12027)) ;
    aoi222 ix12028 (.Y (nx12027), .A0 (data_in[15]), .A1 (nx13343), .B0 (
           data_in[23]), .B1 (nx13347), .C0 (data_in[7]), .C1 (nx13351)) ;
    dff reg_data_12__0 (.Q (dataOut_12__0), .QB (\$dummy [96]), .D (nx10072), .CLK (
        clk)) ;
    mux21_ni ix10073 (.Y (nx10072), .A0 (dataOut_12__0), .A1 (nx3950), .S0 (
             nx12971)) ;
    oai221 ix3951 (.Y (nx3950), .A0 (nx13071), .A1 (nx12967), .B0 (nx13081), .B1 (
           nx12969), .C0 (nx12035)) ;
    nand02 ix3895 (.Y (nx3894), .A0 (nx11825), .A1 (nx13075)) ;
    nand02 ix3897 (.Y (nx3896), .A0 (nx11902), .A1 (nx11125)) ;
    aoi222 ix12036 (.Y (nx12035), .A0 (data_in[8]), .A1 (nx13353), .B0 (
           data_in[16]), .B1 (nx13357), .C0 (data_in[0]), .C1 (nx13361)) ;
    nor02_2x ix12040 (.Y (nx12039), .A0 (nx13869), .A1 (nx144)) ;
    and04 ix12044 (.Y (nx12043), .A0 (nx3910), .A1 (nx3906), .A2 (nx12969), .A3 (
          nx12967)) ;
    nand02 ix3911 (.Y (nx3910), .A0 (nx12039), .A1 (nx11836)) ;
    nand02 ix3907 (.Y (nx3906), .A0 (nx12047), .A1 (nx11981)) ;
    oai22 ix3923 (.Y (nx3922), .A0 (nx13229), .A1 (nx13361), .B0 (nx12825), .B1 (
          nx11851)) ;
    dff reg_data_12__1 (.Q (dataOut_12__1), .QB (\$dummy [97]), .D (nx10082), .CLK (
        clk)) ;
    mux21_ni ix10083 (.Y (nx10082), .A0 (dataOut_12__1), .A1 (nx3984), .S0 (
             nx12971)) ;
    oai221 ix3985 (.Y (nx3984), .A0 (nx13119), .A1 (nx12967), .B0 (nx13125), .B1 (
           nx12969), .C0 (nx12054)) ;
    aoi222 ix12055 (.Y (nx12054), .A0 (data_in[9]), .A1 (nx13353), .B0 (
           data_in[17]), .B1 (nx13357), .C0 (data_in[1]), .C1 (nx13361)) ;
    dff reg_data_12__2 (.Q (dataOut_12__2), .QB (\$dummy [98]), .D (nx10092), .CLK (
        clk)) ;
    mux21_ni ix10093 (.Y (nx10092), .A0 (dataOut_12__2), .A1 (nx4018), .S0 (
             nx12971)) ;
    oai221 ix4019 (.Y (nx4018), .A0 (nx13133), .A1 (nx12967), .B0 (nx13139), .B1 (
           nx12969), .C0 (nx12060)) ;
    aoi222 ix12061 (.Y (nx12060), .A0 (data_in[10]), .A1 (nx13353), .B0 (
           data_in[18]), .B1 (nx13357), .C0 (data_in[2]), .C1 (nx13361)) ;
    dff reg_data_12__3 (.Q (dataOut_12__3), .QB (\$dummy [99]), .D (nx10102), .CLK (
        clk)) ;
    mux21_ni ix10103 (.Y (nx10102), .A0 (dataOut_12__3), .A1 (nx4052), .S0 (
             nx12971)) ;
    oai221 ix4053 (.Y (nx4052), .A0 (nx13147), .A1 (nx12967), .B0 (nx13153), .B1 (
           nx12969), .C0 (nx12066)) ;
    aoi222 ix12067 (.Y (nx12066), .A0 (data_in[11]), .A1 (nx13353), .B0 (
           data_in[19]), .B1 (nx13357), .C0 (data_in[3]), .C1 (nx13361)) ;
    dff reg_data_12__4 (.Q (dataOut_12__4), .QB (\$dummy [100]), .D (nx10112), .CLK (
        clk)) ;
    mux21_ni ix10113 (.Y (nx10112), .A0 (dataOut_12__4), .A1 (nx4086), .S0 (
             nx12971)) ;
    oai221 ix4087 (.Y (nx4086), .A0 (nx13161), .A1 (nx3894), .B0 (nx13167), .B1 (
           nx3896), .C0 (nx12072)) ;
    aoi222 ix12073 (.Y (nx12072), .A0 (data_in[12]), .A1 (nx13353), .B0 (
           data_in[20]), .B1 (nx13357), .C0 (data_in[4]), .C1 (nx13361)) ;
    dff reg_data_12__5 (.Q (dataOut_12__5), .QB (\$dummy [101]), .D (nx10122), .CLK (
        clk)) ;
    mux21_ni ix10123 (.Y (nx10122), .A0 (dataOut_12__5), .A1 (nx4120), .S0 (
             nx12971)) ;
    oai221 ix4121 (.Y (nx4120), .A0 (nx13175), .A1 (nx3894), .B0 (nx13181), .B1 (
           nx3896), .C0 (nx12078)) ;
    aoi222 ix12079 (.Y (nx12078), .A0 (data_in[13]), .A1 (nx13353), .B0 (
           data_in[21]), .B1 (nx13357), .C0 (data_in[5]), .C1 (nx13361)) ;
    dff reg_data_12__6 (.Q (dataOut_12__6), .QB (\$dummy [102]), .D (nx10132), .CLK (
        clk)) ;
    mux21_ni ix10133 (.Y (nx10132), .A0 (dataOut_12__6), .A1 (nx4154), .S0 (
             nx12971)) ;
    oai221 ix4155 (.Y (nx4154), .A0 (nx13189), .A1 (nx3894), .B0 (nx13195), .B1 (
           nx3896), .C0 (nx12084)) ;
    aoi222 ix12085 (.Y (nx12084), .A0 (data_in[14]), .A1 (nx13353), .B0 (
           data_in[22]), .B1 (nx13357), .C0 (data_in[6]), .C1 (nx13363)) ;
    dff reg_data_12__7 (.Q (dataOut_12__7), .QB (\$dummy [103]), .D (nx10142), .CLK (
        clk)) ;
    mux21_ni ix10143 (.Y (nx10142), .A0 (dataOut_12__7), .A1 (nx4188), .S0 (
             nx12973)) ;
    oai221 ix4189 (.Y (nx4188), .A0 (nx13203), .A1 (nx3894), .B0 (nx13209), .B1 (
           nx3896), .C0 (nx12090)) ;
    aoi222 ix12091 (.Y (nx12090), .A0 (data_in[15]), .A1 (nx13355), .B0 (
           data_in[23]), .B1 (nx13359), .C0 (data_in[7]), .C1 (nx13363)) ;
    dff reg_data_11__0 (.Q (dataOut_11__0), .QB (\$dummy [104]), .D (nx10152), .CLK (
        clk)) ;
    mux21_ni ix10153 (.Y (nx10152), .A0 (dataOut_11__0), .A1 (nx4266), .S0 (
             nx12979)) ;
    oai221 ix4267 (.Y (nx4266), .A0 (nx13071), .A1 (nx12975), .B0 (nx13081), .B1 (
           nx12977), .C0 (nx12100)) ;
    nand02 ix4215 (.Y (nx4214), .A0 (nx12097), .A1 (nx13857)) ;
    nor03_2x ix12098 (.Y (nx12097), .A0 (nx13725), .A1 (nx13089), .A2 (nx13731)
             ) ;
    nand02 ix4217 (.Y (nx4216), .A0 (nx11828), .A1 (nx11135)) ;
    aoi222 ix12101 (.Y (nx12100), .A0 (data_in[8]), .A1 (nx13365), .B0 (
           data_in[16]), .B1 (nx13369), .C0 (data_in[0]), .C1 (nx13373)) ;
    and04 ix12107 (.Y (nx12106), .A0 (nx4226), .A1 (nx4224), .A2 (nx12977), .A3 (
          nx12975)) ;
    nand02 ix4227 (.Y (nx4226), .A0 (nx11834), .A1 (nx11193)) ;
    nand02 ix4225 (.Y (nx4224), .A0 (nx12110), .A1 (nx11199)) ;
    nor03_2x ix12111 (.Y (nx12110), .A0 (nx13725), .A1 (nx13743), .A2 (nx11127)
             ) ;
    oai22 ix4239 (.Y (nx4238), .A0 (nx13229), .A1 (nx13373), .B0 (nx12845), .B1 (
          nx12113)) ;
    nand03 ix12114 (.Y (nx12113), .A0 (nx2932), .A1 (nx13731), .A2 (nx13089)) ;
    dff reg_data_11__1 (.Q (dataOut_11__1), .QB (\$dummy [105]), .D (nx10162), .CLK (
        clk)) ;
    mux21_ni ix10163 (.Y (nx10162), .A0 (dataOut_11__1), .A1 (nx4300), .S0 (
             nx12979)) ;
    oai221 ix4301 (.Y (nx4300), .A0 (nx13119), .A1 (nx12975), .B0 (nx13125), .B1 (
           nx12977), .C0 (nx12119)) ;
    aoi222 ix12120 (.Y (nx12119), .A0 (data_in[9]), .A1 (nx13365), .B0 (
           data_in[17]), .B1 (nx13369), .C0 (data_in[1]), .C1 (nx13373)) ;
    dff reg_data_11__2 (.Q (dataOut_11__2), .QB (\$dummy [106]), .D (nx10172), .CLK (
        clk)) ;
    mux21_ni ix10173 (.Y (nx10172), .A0 (dataOut_11__2), .A1 (nx4334), .S0 (
             nx12979)) ;
    oai221 ix4335 (.Y (nx4334), .A0 (nx13133), .A1 (nx12975), .B0 (nx13139), .B1 (
           nx12977), .C0 (nx12125)) ;
    aoi222 ix12126 (.Y (nx12125), .A0 (data_in[10]), .A1 (nx13365), .B0 (
           data_in[18]), .B1 (nx13369), .C0 (data_in[2]), .C1 (nx13373)) ;
    dff reg_data_11__3 (.Q (dataOut_11__3), .QB (\$dummy [107]), .D (nx10182), .CLK (
        clk)) ;
    mux21_ni ix10183 (.Y (nx10182), .A0 (dataOut_11__3), .A1 (nx4368), .S0 (
             nx12979)) ;
    oai221 ix4369 (.Y (nx4368), .A0 (nx13147), .A1 (nx12975), .B0 (nx13153), .B1 (
           nx12977), .C0 (nx12131)) ;
    aoi222 ix12132 (.Y (nx12131), .A0 (data_in[11]), .A1 (nx13365), .B0 (
           data_in[19]), .B1 (nx13369), .C0 (data_in[3]), .C1 (nx13373)) ;
    dff reg_data_11__4 (.Q (dataOut_11__4), .QB (\$dummy [108]), .D (nx10192), .CLK (
        clk)) ;
    mux21_ni ix10193 (.Y (nx10192), .A0 (dataOut_11__4), .A1 (nx4402), .S0 (
             nx12979)) ;
    oai221 ix4403 (.Y (nx4402), .A0 (nx13161), .A1 (nx4214), .B0 (nx13167), .B1 (
           nx4216), .C0 (nx12137)) ;
    aoi222 ix12138 (.Y (nx12137), .A0 (data_in[12]), .A1 (nx13365), .B0 (
           data_in[20]), .B1 (nx13369), .C0 (data_in[4]), .C1 (nx13373)) ;
    dff reg_data_11__5 (.Q (dataOut_11__5), .QB (\$dummy [109]), .D (nx10202), .CLK (
        clk)) ;
    mux21_ni ix10203 (.Y (nx10202), .A0 (dataOut_11__5), .A1 (nx4436), .S0 (
             nx12979)) ;
    oai221 ix4437 (.Y (nx4436), .A0 (nx13175), .A1 (nx4214), .B0 (nx13181), .B1 (
           nx4216), .C0 (nx12143)) ;
    aoi222 ix12144 (.Y (nx12143), .A0 (data_in[13]), .A1 (nx13365), .B0 (
           data_in[21]), .B1 (nx13369), .C0 (data_in[5]), .C1 (nx13373)) ;
    dff reg_data_11__6 (.Q (dataOut_11__6), .QB (\$dummy [110]), .D (nx10212), .CLK (
        clk)) ;
    mux21_ni ix10213 (.Y (nx10212), .A0 (dataOut_11__6), .A1 (nx4470), .S0 (
             nx12979)) ;
    oai221 ix4471 (.Y (nx4470), .A0 (nx13189), .A1 (nx4214), .B0 (nx13195), .B1 (
           nx4216), .C0 (nx12149)) ;
    aoi222 ix12150 (.Y (nx12149), .A0 (data_in[14]), .A1 (nx13365), .B0 (
           data_in[22]), .B1 (nx13369), .C0 (data_in[6]), .C1 (nx13375)) ;
    dff reg_data_11__7 (.Q (dataOut_11__7), .QB (\$dummy [111]), .D (nx10222), .CLK (
        clk)) ;
    mux21_ni ix10223 (.Y (nx10222), .A0 (dataOut_11__7), .A1 (nx4504), .S0 (
             nx12981)) ;
    oai221 ix4505 (.Y (nx4504), .A0 (nx13203), .A1 (nx4214), .B0 (nx13209), .B1 (
           nx4216), .C0 (nx12155)) ;
    aoi222 ix12156 (.Y (nx12155), .A0 (data_in[15]), .A1 (nx13367), .B0 (
           data_in[23]), .B1 (nx13371), .C0 (data_in[7]), .C1 (nx13375)) ;
    dff reg_data_10__0 (.Q (dataOut_10__0), .QB (\$dummy [112]), .D (nx10232), .CLK (
        clk)) ;
    mux21_ni ix10233 (.Y (nx10232), .A0 (dataOut_10__0), .A1 (nx4570), .S0 (
             nx12991)) ;
    nand02 ix4519 (.Y (nx4518), .A0 (nx11135), .A1 (nx11282)) ;
    aoi222 ix12165 (.Y (nx12164), .A0 (data_in[8]), .A1 (nx13377), .B0 (
           data_in[16]), .B1 (nx13381), .C0 (data_in[0]), .C1 (nx13385)) ;
    and02 ix12167 (.Y (nx12166), .A0 (nx11908), .A1 (nx11193)) ;
    nor04 ix12169 (.Y (nx12168), .A0 (nx13725), .A1 (nx13745), .A2 (nx13749), .A3 (
          nx104)) ;
    nor04 ix12171 (.Y (nx12170), .A0 (nx13377), .A1 (nx13381), .A2 (nx13829), .A3 (
          nx13831)) ;
    nor02_2x ix12173 (.Y (nx12172), .A0 (nx4518), .A1 (nx13869)) ;
    oai22 ix4543 (.Y (nx4542), .A0 (nx13231), .A1 (nx13385), .B0 (nx12837), .B1 (
          nx12113)) ;
    dff reg_data_10__1 (.Q (dataOut_10__1), .QB (\$dummy [113]), .D (nx10242), .CLK (
        clk)) ;
    mux21_ni ix10243 (.Y (nx10242), .A0 (dataOut_10__1), .A1 (nx4604), .S0 (
             nx12991)) ;
    aoi222 ix12183 (.Y (nx12182), .A0 (data_in[9]), .A1 (nx13377), .B0 (
           data_in[17]), .B1 (nx13381), .C0 (data_in[1]), .C1 (nx13385)) ;
    dff reg_data_10__2 (.Q (dataOut_10__2), .QB (\$dummy [114]), .D (nx10252), .CLK (
        clk)) ;
    mux21_ni ix10253 (.Y (nx10252), .A0 (dataOut_10__2), .A1 (nx4638), .S0 (
             nx12991)) ;
    aoi222 ix12189 (.Y (nx12188), .A0 (data_in[10]), .A1 (nx13377), .B0 (
           data_in[18]), .B1 (nx13381), .C0 (data_in[2]), .C1 (nx13385)) ;
    dff reg_data_10__3 (.Q (dataOut_10__3), .QB (\$dummy [115]), .D (nx10262), .CLK (
        clk)) ;
    mux21_ni ix10263 (.Y (nx10262), .A0 (dataOut_10__3), .A1 (nx4672), .S0 (
             nx12991)) ;
    aoi222 ix12195 (.Y (nx12194), .A0 (data_in[11]), .A1 (nx13377), .B0 (
           data_in[19]), .B1 (nx13381), .C0 (data_in[3]), .C1 (nx13385)) ;
    dff reg_data_10__4 (.Q (dataOut_10__4), .QB (\$dummy [116]), .D (nx10272), .CLK (
        clk)) ;
    mux21_ni ix10273 (.Y (nx10272), .A0 (dataOut_10__4), .A1 (nx4706), .S0 (
             nx12991)) ;
    aoi222 ix12201 (.Y (nx12200), .A0 (data_in[12]), .A1 (nx13377), .B0 (
           data_in[20]), .B1 (nx13381), .C0 (data_in[4]), .C1 (nx13385)) ;
    dff reg_data_10__5 (.Q (dataOut_10__5), .QB (\$dummy [117]), .D (nx10282), .CLK (
        clk)) ;
    mux21_ni ix10283 (.Y (nx10282), .A0 (dataOut_10__5), .A1 (nx4740), .S0 (
             nx12991)) ;
    aoi222 ix12207 (.Y (nx12206), .A0 (data_in[13]), .A1 (nx13377), .B0 (
           data_in[21]), .B1 (nx13381), .C0 (data_in[5]), .C1 (nx13385)) ;
    dff reg_data_10__6 (.Q (dataOut_10__6), .QB (\$dummy [118]), .D (nx10292), .CLK (
        clk)) ;
    mux21_ni ix10293 (.Y (nx10292), .A0 (dataOut_10__6), .A1 (nx4774), .S0 (
             nx12991)) ;
    aoi222 ix12213 (.Y (nx12212), .A0 (data_in[14]), .A1 (nx13379), .B0 (
           data_in[22]), .B1 (nx13383), .C0 (data_in[6]), .C1 (nx13387)) ;
    dff reg_data_10__7 (.Q (dataOut_10__7), .QB (\$dummy [119]), .D (nx10302), .CLK (
        clk)) ;
    mux21_ni ix10303 (.Y (nx10302), .A0 (dataOut_10__7), .A1 (nx4808), .S0 (
             nx12993)) ;
    aoi222 ix12219 (.Y (nx12218), .A0 (data_in[15]), .A1 (nx13379), .B0 (
           data_in[23]), .B1 (nx13383), .C0 (data_in[7]), .C1 (nx13387)) ;
    dff reg_data_9__0 (.Q (dataOut_9__0), .QB (\$dummy [120]), .D (nx10312), .CLK (
        clk)) ;
    mux21_ni ix10313 (.Y (nx10312), .A0 (dataOut_9__0), .A1 (nx4872), .S0 (
             nx13003)) ;
    aoi222 ix12229 (.Y (nx12228), .A0 (data_in[8]), .A1 (nx13389), .B0 (
           data_in[16]), .B1 (nx13393), .C0 (data_in[0]), .C1 (nx13397)) ;
    nor04 ix12231 (.Y (nx12230), .A0 (nx13745), .A1 (nx13749), .A2 (nx13725), .A3 (
          nx142)) ;
    nor03_2x ix12233 (.Y (nx12232), .A0 (nx12845), .A1 (nx106), .A2 (nx104)) ;
    nor04 ix12235 (.Y (nx12234), .A0 (nx13389), .A1 (nx13393), .A2 (nx13835), .A3 (
          nx13839)) ;
    oai22 ix4845 (.Y (nx4844), .A0 (nx13231), .A1 (nx13397), .B0 (nx12831), .B1 (
          nx12113)) ;
    dff reg_data_9__1 (.Q (dataOut_9__1), .QB (\$dummy [121]), .D (nx10322), .CLK (
        clk)) ;
    mux21_ni ix10323 (.Y (nx10322), .A0 (dataOut_9__1), .A1 (nx4906), .S0 (
             nx13003)) ;
    aoi222 ix12246 (.Y (nx12245), .A0 (data_in[9]), .A1 (nx13389), .B0 (
           data_in[17]), .B1 (nx13393), .C0 (data_in[1]), .C1 (nx13397)) ;
    dff reg_data_9__2 (.Q (dataOut_9__2), .QB (\$dummy [122]), .D (nx10332), .CLK (
        clk)) ;
    mux21_ni ix10333 (.Y (nx10332), .A0 (dataOut_9__2), .A1 (nx4940), .S0 (
             nx13003)) ;
    aoi222 ix12252 (.Y (nx12251), .A0 (data_in[10]), .A1 (nx13389), .B0 (
           data_in[18]), .B1 (nx13393), .C0 (data_in[2]), .C1 (nx13397)) ;
    dff reg_data_9__3 (.Q (dataOut_9__3), .QB (\$dummy [123]), .D (nx10342), .CLK (
        clk)) ;
    mux21_ni ix10343 (.Y (nx10342), .A0 (dataOut_9__3), .A1 (nx4974), .S0 (
             nx13003)) ;
    aoi222 ix12258 (.Y (nx12257), .A0 (data_in[11]), .A1 (nx13389), .B0 (
           data_in[19]), .B1 (nx13393), .C0 (data_in[3]), .C1 (nx13397)) ;
    dff reg_data_9__4 (.Q (dataOut_9__4), .QB (\$dummy [124]), .D (nx10352), .CLK (
        clk)) ;
    mux21_ni ix10353 (.Y (nx10352), .A0 (dataOut_9__4), .A1 (nx5008), .S0 (
             nx13003)) ;
    aoi222 ix12264 (.Y (nx12263), .A0 (data_in[12]), .A1 (nx13389), .B0 (
           data_in[20]), .B1 (nx13393), .C0 (data_in[4]), .C1 (nx13397)) ;
    dff reg_data_9__5 (.Q (dataOut_9__5), .QB (\$dummy [125]), .D (nx10362), .CLK (
        clk)) ;
    mux21_ni ix10363 (.Y (nx10362), .A0 (dataOut_9__5), .A1 (nx5042), .S0 (
             nx13003)) ;
    aoi222 ix12270 (.Y (nx12269), .A0 (data_in[13]), .A1 (nx13389), .B0 (
           data_in[21]), .B1 (nx13393), .C0 (data_in[5]), .C1 (nx13397)) ;
    dff reg_data_9__6 (.Q (dataOut_9__6), .QB (\$dummy [126]), .D (nx10372), .CLK (
        clk)) ;
    mux21_ni ix10373 (.Y (nx10372), .A0 (dataOut_9__6), .A1 (nx5076), .S0 (
             nx13003)) ;
    aoi222 ix12276 (.Y (nx12275), .A0 (data_in[14]), .A1 (nx13391), .B0 (
           data_in[22]), .B1 (nx13395), .C0 (data_in[6]), .C1 (nx13399)) ;
    dff reg_data_9__7 (.Q (dataOut_9__7), .QB (\$dummy [127]), .D (nx10382), .CLK (
        clk)) ;
    mux21_ni ix10383 (.Y (nx10382), .A0 (dataOut_9__7), .A1 (nx5110), .S0 (
             nx13005)) ;
    aoi222 ix12282 (.Y (nx12281), .A0 (data_in[15]), .A1 (nx13391), .B0 (
           data_in[23]), .B1 (nx13395), .C0 (data_in[7]), .C1 (nx13399)) ;
    dff reg_data_8__0 (.Q (dataOut_8__0), .QB (\$dummy [128]), .D (nx10392), .CLK (
        clk)) ;
    mux21_ni ix10393 (.Y (nx10392), .A0 (dataOut_8__0), .A1 (nx5174), .S0 (
             nx13015)) ;
    aoi222 ix12290 (.Y (nx12289), .A0 (data_in[8]), .A1 (nx13401), .B0 (
           data_in[16]), .B1 (nx13405), .C0 (data_in[0]), .C1 (nx13409)) ;
    and02 ix12292 (.Y (nx12291), .A0 (nx12039), .A1 (nx11193)) ;
    nor03_2x ix12294 (.Y (nx12293), .A0 (nx12837), .A1 (nx106), .A2 (nx104)) ;
    nor04 ix12296 (.Y (nx12295), .A0 (nx13401), .A1 (nx13405), .A2 (nx13843), .A3 (
          nx13845)) ;
    nor02_2x ix12298 (.Y (nx12297), .A0 (nx4518), .A1 (nx72)) ;
    oai22 ix5147 (.Y (nx5146), .A0 (nx13231), .A1 (nx13409), .B0 (nx12825), .B1 (
          nx12113)) ;
    dff reg_data_8__1 (.Q (dataOut_8__1), .QB (\$dummy [129]), .D (nx10402), .CLK (
        clk)) ;
    mux21_ni ix10403 (.Y (nx10402), .A0 (dataOut_8__1), .A1 (nx5208), .S0 (
             nx13015)) ;
    aoi222 ix12307 (.Y (nx12306), .A0 (data_in[9]), .A1 (nx13401), .B0 (
           data_in[17]), .B1 (nx13405), .C0 (data_in[1]), .C1 (nx13409)) ;
    dff reg_data_8__2 (.Q (dataOut_8__2), .QB (\$dummy [130]), .D (nx10412), .CLK (
        clk)) ;
    mux21_ni ix10413 (.Y (nx10412), .A0 (dataOut_8__2), .A1 (nx5242), .S0 (
             nx13015)) ;
    aoi222 ix12313 (.Y (nx12312), .A0 (data_in[10]), .A1 (nx13401), .B0 (
           data_in[18]), .B1 (nx13405), .C0 (data_in[2]), .C1 (nx13409)) ;
    dff reg_data_8__3 (.Q (dataOut_8__3), .QB (\$dummy [131]), .D (nx10422), .CLK (
        clk)) ;
    mux21_ni ix10423 (.Y (nx10422), .A0 (dataOut_8__3), .A1 (nx5276), .S0 (
             nx13015)) ;
    aoi222 ix12319 (.Y (nx12318), .A0 (data_in[11]), .A1 (nx13401), .B0 (
           data_in[19]), .B1 (nx13405), .C0 (data_in[3]), .C1 (nx13409)) ;
    dff reg_data_8__4 (.Q (dataOut_8__4), .QB (\$dummy [132]), .D (nx10432), .CLK (
        clk)) ;
    mux21_ni ix10433 (.Y (nx10432), .A0 (dataOut_8__4), .A1 (nx5310), .S0 (
             nx13015)) ;
    aoi222 ix12325 (.Y (nx12324), .A0 (data_in[12]), .A1 (nx13401), .B0 (
           data_in[20]), .B1 (nx13405), .C0 (data_in[4]), .C1 (nx13409)) ;
    dff reg_data_8__5 (.Q (dataOut_8__5), .QB (\$dummy [133]), .D (nx10442), .CLK (
        clk)) ;
    mux21_ni ix10443 (.Y (nx10442), .A0 (dataOut_8__5), .A1 (nx5344), .S0 (
             nx13015)) ;
    aoi222 ix12331 (.Y (nx12330), .A0 (data_in[13]), .A1 (nx13401), .B0 (
           data_in[21]), .B1 (nx13405), .C0 (data_in[5]), .C1 (nx13409)) ;
    dff reg_data_8__6 (.Q (dataOut_8__6), .QB (\$dummy [134]), .D (nx10452), .CLK (
        clk)) ;
    mux21_ni ix10453 (.Y (nx10452), .A0 (dataOut_8__6), .A1 (nx5378), .S0 (
             nx13015)) ;
    aoi222 ix12337 (.Y (nx12336), .A0 (data_in[14]), .A1 (nx13403), .B0 (
           data_in[22]), .B1 (nx13407), .C0 (data_in[6]), .C1 (nx13411)) ;
    dff reg_data_8__7 (.Q (dataOut_8__7), .QB (\$dummy [135]), .D (nx10462), .CLK (
        clk)) ;
    mux21_ni ix10463 (.Y (nx10462), .A0 (dataOut_8__7), .A1 (nx5412), .S0 (
             nx13017)) ;
    aoi222 ix12343 (.Y (nx12342), .A0 (data_in[15]), .A1 (nx13403), .B0 (
           data_in[23]), .B1 (nx13407), .C0 (data_in[7]), .C1 (nx13411)) ;
    dff reg_data_7__0 (.Q (dataOut_7__0), .QB (\$dummy [136]), .D (nx10472), .CLK (
        clk)) ;
    mux21_ni ix10473 (.Y (nx10472), .A0 (nx5486), .A1 (dataOut_7__0), .S0 (
             nx13425)) ;
    oai221 ix5487 (.Y (nx5486), .A0 (nx13073), .A1 (nx13019), .B0 (nx13083), .B1 (
           nx13021), .C0 (nx12352)) ;
    nand02 ix5435 (.Y (nx5434), .A0 (nx12349), .A1 (nx13857)) ;
    nor03_2x ix12350 (.Y (nx12349), .A0 (nx13725), .A1 (nx13737), .A2 (nx13731)
             ) ;
    aoi222 ix12353 (.Y (nx12352), .A0 (data_in[8]), .A1 (nx13413), .B0 (
           data_in[16]), .B1 (nx13417), .C0 (data_in[0]), .C1 (nx13421)) ;
    nor04 ix12362 (.Y (nx12361), .A0 (nx13745), .A1 (nx13749), .A2 (nx13725), .A3 (
          nx466)) ;
    aoi22 ix12366 (.Y (nx12365), .A0 (nx13857), .A1 (nx5424), .B0 (nx13717), .B1 (
          nx5454)) ;
    nor04 ix5425 (.Y (nx5424), .A0 (nx13727), .A1 (nx13231), .A2 (nx13731), .A3 (
          nx13089)) ;
    nand04 ix5455 (.Y (nx5454), .A0 (nx5446), .A1 (nx5444), .A2 (nx13021), .A3 (
           nx13019)) ;
    nand02 ix5447 (.Y (nx5446), .A0 (nx11834), .A1 (nx11366)) ;
    nand02 ix5445 (.Y (nx5444), .A0 (nx12110), .A1 (nx11298)) ;
    dff reg_data_7__1 (.Q (dataOut_7__1), .QB (\$dummy [137]), .D (nx10482), .CLK (
        clk)) ;
    mux21_ni ix10483 (.Y (nx10482), .A0 (nx5520), .A1 (dataOut_7__1), .S0 (
             nx13425)) ;
    oai221 ix5521 (.Y (nx5520), .A0 (nx13121), .A1 (nx13019), .B0 (nx13127), .B1 (
           nx13021), .C0 (nx12375)) ;
    aoi222 ix12376 (.Y (nx12375), .A0 (data_in[9]), .A1 (nx13413), .B0 (
           data_in[17]), .B1 (nx13417), .C0 (data_in[1]), .C1 (nx13421)) ;
    dff reg_data_7__2 (.Q (dataOut_7__2), .QB (\$dummy [138]), .D (nx10492), .CLK (
        clk)) ;
    mux21_ni ix10493 (.Y (nx10492), .A0 (nx5554), .A1 (dataOut_7__2), .S0 (
             nx13425)) ;
    oai221 ix5555 (.Y (nx5554), .A0 (nx13135), .A1 (nx13019), .B0 (nx13141), .B1 (
           nx13021), .C0 (nx12381)) ;
    aoi222 ix12382 (.Y (nx12381), .A0 (data_in[10]), .A1 (nx13413), .B0 (
           data_in[18]), .B1 (nx13417), .C0 (data_in[2]), .C1 (nx13421)) ;
    dff reg_data_7__3 (.Q (dataOut_7__3), .QB (\$dummy [139]), .D (nx10502), .CLK (
        clk)) ;
    mux21_ni ix10503 (.Y (nx10502), .A0 (nx5588), .A1 (dataOut_7__3), .S0 (
             nx13425)) ;
    oai221 ix5589 (.Y (nx5588), .A0 (nx13149), .A1 (nx13019), .B0 (nx13155), .B1 (
           nx13021), .C0 (nx12387)) ;
    aoi222 ix12388 (.Y (nx12387), .A0 (data_in[11]), .A1 (nx13413), .B0 (
           data_in[19]), .B1 (nx13417), .C0 (data_in[3]), .C1 (nx13421)) ;
    dff reg_data_7__4 (.Q (dataOut_7__4), .QB (\$dummy [140]), .D (nx10512), .CLK (
        clk)) ;
    mux21_ni ix10513 (.Y (nx10512), .A0 (nx5622), .A1 (dataOut_7__4), .S0 (
             nx13425)) ;
    oai221 ix5623 (.Y (nx5622), .A0 (nx13163), .A1 (nx5434), .B0 (nx13169), .B1 (
           nx13021), .C0 (nx12393)) ;
    aoi222 ix12394 (.Y (nx12393), .A0 (data_in[12]), .A1 (nx13413), .B0 (
           data_in[20]), .B1 (nx13417), .C0 (data_in[4]), .C1 (nx13421)) ;
    dff reg_data_7__5 (.Q (dataOut_7__5), .QB (\$dummy [141]), .D (nx10522), .CLK (
        clk)) ;
    mux21_ni ix10523 (.Y (nx10522), .A0 (nx5656), .A1 (dataOut_7__5), .S0 (
             nx13425)) ;
    oai221 ix5657 (.Y (nx5656), .A0 (nx13177), .A1 (nx5434), .B0 (nx13183), .B1 (
           nx13021), .C0 (nx12399)) ;
    aoi222 ix12400 (.Y (nx12399), .A0 (data_in[13]), .A1 (nx13413), .B0 (
           data_in[21]), .B1 (nx13417), .C0 (data_in[5]), .C1 (nx13421)) ;
    dff reg_data_7__6 (.Q (dataOut_7__6), .QB (\$dummy [142]), .D (nx10532), .CLK (
        clk)) ;
    mux21_ni ix10533 (.Y (nx10532), .A0 (nx5690), .A1 (dataOut_7__6), .S0 (
             nx13425)) ;
    oai221 ix5691 (.Y (nx5690), .A0 (nx13191), .A1 (nx5434), .B0 (nx13197), .B1 (
           nx13023), .C0 (nx12405)) ;
    aoi222 ix12406 (.Y (nx12405), .A0 (data_in[14]), .A1 (nx13413), .B0 (
           data_in[22]), .B1 (nx13417), .C0 (data_in[6]), .C1 (nx13421)) ;
    dff reg_data_7__7 (.Q (dataOut_7__7), .QB (\$dummy [143]), .D (nx10542), .CLK (
        clk)) ;
    mux21_ni ix10543 (.Y (nx10542), .A0 (nx5724), .A1 (dataOut_7__7), .S0 (
             nx13427)) ;
    oai221 ix5725 (.Y (nx5724), .A0 (nx13205), .A1 (nx5434), .B0 (nx13211), .B1 (
           nx13023), .C0 (nx12411)) ;
    aoi222 ix12412 (.Y (nx12411), .A0 (data_in[15]), .A1 (nx13415), .B0 (
           data_in[23]), .B1 (nx13419), .C0 (data_in[7]), .C1 (nx13423)) ;
    dff reg_data_6__0 (.Q (dataOut_6__0), .QB (\$dummy [144]), .D (nx10552), .CLK (
        clk)) ;
    mux21_ni ix10553 (.Y (nx10552), .A0 (nx5790), .A1 (dataOut_6__0), .S0 (
             nx13441)) ;
    oai221 ix5791 (.Y (nx5790), .A0 (nx13073), .A1 (nx13025), .B0 (nx13083), .B1 (
           nx13027), .C0 (nx12421)) ;
    nand02 ix5737 (.Y (nx5736), .A0 (nx12349), .A1 (nx13859)) ;
    nand02 ix5741 (.Y (nx5740), .A0 (nx12419), .A1 (nx11188)) ;
    nor02_2x ix12420 (.Y (nx12419), .A0 (nx466), .A1 (nx58)) ;
    aoi222 ix12422 (.Y (nx12421), .A0 (data_in[8]), .A1 (nx13429), .B0 (
           data_in[16]), .B1 (nx13433), .C0 (data_in[0]), .C1 (nx13437)) ;
    nor03_2x ix12429 (.Y (nx12428), .A0 (nx13727), .A1 (nx13745), .A2 (nx13749)
             ) ;
    nand02 ix5751 (.Y (nx5750), .A0 (nx11908), .A1 (nx11366)) ;
    nand02 ix5749 (.Y (nx5748), .A0 (nx12428), .A1 (nx11298)) ;
    aoi22 ix12435 (.Y (nx12434), .A0 (nx13859), .A1 (nx5424), .B0 (nx13717), .B1 (
          nx5758)) ;
    nand04 ix5759 (.Y (nx5758), .A0 (nx5750), .A1 (nx5748), .A2 (nx13027), .A3 (
           nx13025)) ;
    dff reg_data_6__1 (.Q (dataOut_6__1), .QB (\$dummy [145]), .D (nx10562), .CLK (
        clk)) ;
    mux21_ni ix10563 (.Y (nx10562), .A0 (nx5824), .A1 (dataOut_6__1), .S0 (
             nx13441)) ;
    oai221 ix5825 (.Y (nx5824), .A0 (nx13121), .A1 (nx13025), .B0 (nx13127), .B1 (
           nx13027), .C0 (nx12441)) ;
    aoi222 ix12442 (.Y (nx12441), .A0 (data_in[9]), .A1 (nx13429), .B0 (
           data_in[17]), .B1 (nx13433), .C0 (data_in[1]), .C1 (nx13437)) ;
    dff reg_data_6__2 (.Q (dataOut_6__2), .QB (\$dummy [146]), .D (nx10572), .CLK (
        clk)) ;
    mux21_ni ix10573 (.Y (nx10572), .A0 (nx5858), .A1 (dataOut_6__2), .S0 (
             nx13441)) ;
    oai221 ix5859 (.Y (nx5858), .A0 (nx13135), .A1 (nx13025), .B0 (nx13141), .B1 (
           nx13027), .C0 (nx12447)) ;
    aoi222 ix12448 (.Y (nx12447), .A0 (data_in[10]), .A1 (nx13429), .B0 (
           data_in[18]), .B1 (nx13433), .C0 (data_in[2]), .C1 (nx13437)) ;
    dff reg_data_6__3 (.Q (dataOut_6__3), .QB (\$dummy [147]), .D (nx10582), .CLK (
        clk)) ;
    mux21_ni ix10583 (.Y (nx10582), .A0 (nx5892), .A1 (dataOut_6__3), .S0 (
             nx13441)) ;
    oai221 ix5893 (.Y (nx5892), .A0 (nx13149), .A1 (nx13025), .B0 (nx13155), .B1 (
           nx13027), .C0 (nx12453)) ;
    aoi222 ix12454 (.Y (nx12453), .A0 (data_in[11]), .A1 (nx13429), .B0 (
           data_in[19]), .B1 (nx13433), .C0 (data_in[3]), .C1 (nx13437)) ;
    dff reg_data_6__4 (.Q (dataOut_6__4), .QB (\$dummy [148]), .D (nx10592), .CLK (
        clk)) ;
    mux21_ni ix10593 (.Y (nx10592), .A0 (nx5926), .A1 (dataOut_6__4), .S0 (
             nx13441)) ;
    oai221 ix5927 (.Y (nx5926), .A0 (nx13163), .A1 (nx5736), .B0 (nx13169), .B1 (
           nx5740), .C0 (nx12459)) ;
    aoi222 ix12460 (.Y (nx12459), .A0 (data_in[12]), .A1 (nx13429), .B0 (
           data_in[20]), .B1 (nx13433), .C0 (data_in[4]), .C1 (nx13437)) ;
    dff reg_data_6__5 (.Q (dataOut_6__5), .QB (\$dummy [149]), .D (nx10602), .CLK (
        clk)) ;
    mux21_ni ix10603 (.Y (nx10602), .A0 (nx5960), .A1 (dataOut_6__5), .S0 (
             nx13441)) ;
    oai221 ix5961 (.Y (nx5960), .A0 (nx13177), .A1 (nx5736), .B0 (nx13183), .B1 (
           nx5740), .C0 (nx12465)) ;
    aoi222 ix12466 (.Y (nx12465), .A0 (data_in[13]), .A1 (nx13429), .B0 (
           data_in[21]), .B1 (nx13433), .C0 (data_in[5]), .C1 (nx13437)) ;
    dff reg_data_6__6 (.Q (dataOut_6__6), .QB (\$dummy [150]), .D (nx10612), .CLK (
        clk)) ;
    mux21_ni ix10613 (.Y (nx10612), .A0 (nx5994), .A1 (dataOut_6__6), .S0 (
             nx13441)) ;
    oai221 ix5995 (.Y (nx5994), .A0 (nx13191), .A1 (nx5736), .B0 (nx13197), .B1 (
           nx5740), .C0 (nx12471)) ;
    aoi222 ix12472 (.Y (nx12471), .A0 (data_in[14]), .A1 (nx13429), .B0 (
           data_in[22]), .B1 (nx13433), .C0 (data_in[6]), .C1 (nx13437)) ;
    dff reg_data_6__7 (.Q (dataOut_6__7), .QB (\$dummy [151]), .D (nx10622), .CLK (
        clk)) ;
    mux21_ni ix10623 (.Y (nx10622), .A0 (nx6028), .A1 (dataOut_6__7), .S0 (
             nx13443)) ;
    oai221 ix6029 (.Y (nx6028), .A0 (nx13205), .A1 (nx5736), .B0 (nx13211), .B1 (
           nx5740), .C0 (nx12477)) ;
    aoi222 ix12478 (.Y (nx12477), .A0 (data_in[15]), .A1 (nx13431), .B0 (
           data_in[23]), .B1 (nx13435), .C0 (data_in[7]), .C1 (nx13439)) ;
    dff reg_data_5__0 (.Q (dataOut_5__0), .QB (\$dummy [152]), .D (nx10632), .CLK (
        clk)) ;
    mux21_ni ix10633 (.Y (nx10632), .A0 (nx6092), .A1 (dataOut_5__0), .S0 (
             nx13457)) ;
    oai221 ix6093 (.Y (nx6092), .A0 (nx13073), .A1 (nx13029), .B0 (nx13083), .B1 (
           nx13031), .C0 (nx12485)) ;
    nand02 ix6041 (.Y (nx6040), .A0 (nx12349), .A1 (nx13111)) ;
    nand02 ix6043 (.Y (nx6042), .A0 (nx12419), .A1 (nx13753)) ;
    aoi222 ix12486 (.Y (nx12485), .A0 (data_in[8]), .A1 (nx13445), .B0 (
           data_in[16]), .B1 (nx13449), .C0 (data_in[0]), .C1 (nx13453)) ;
    nor04 ix12488 (.Y (nx12487), .A0 (nx13745), .A1 (nx13751), .A2 (nx13727), .A3 (
          nx494)) ;
    aoi22 ix12498 (.Y (nx12497), .A0 (nx13111), .A1 (nx5424), .B0 (nx13717), .B1 (
          nx6060)) ;
    nand04 ix6061 (.Y (nx6060), .A0 (nx6052), .A1 (nx6050), .A2 (nx13031), .A3 (
           nx13029)) ;
    nand02 ix6051 (.Y (nx6050), .A0 (nx11979), .A1 (nx11298)) ;
    dff reg_data_5__1 (.Q (dataOut_5__1), .QB (\$dummy [153]), .D (nx10642), .CLK (
        clk)) ;
    mux21_ni ix10643 (.Y (nx10642), .A0 (nx6126), .A1 (dataOut_5__1), .S0 (
             nx13457)) ;
    oai221 ix6127 (.Y (nx6126), .A0 (nx13121), .A1 (nx13029), .B0 (nx13127), .B1 (
           nx13031), .C0 (nx12506)) ;
    aoi222 ix12507 (.Y (nx12506), .A0 (data_in[9]), .A1 (nx13445), .B0 (
           data_in[17]), .B1 (nx13449), .C0 (data_in[1]), .C1 (nx13453)) ;
    dff reg_data_5__2 (.Q (dataOut_5__2), .QB (\$dummy [154]), .D (nx10652), .CLK (
        clk)) ;
    mux21_ni ix10653 (.Y (nx10652), .A0 (nx6160), .A1 (dataOut_5__2), .S0 (
             nx13457)) ;
    oai221 ix6161 (.Y (nx6160), .A0 (nx13135), .A1 (nx13029), .B0 (nx13141), .B1 (
           nx13031), .C0 (nx12512)) ;
    aoi222 ix12513 (.Y (nx12512), .A0 (data_in[10]), .A1 (nx13445), .B0 (
           data_in[18]), .B1 (nx13449), .C0 (data_in[2]), .C1 (nx13453)) ;
    dff reg_data_5__3 (.Q (dataOut_5__3), .QB (\$dummy [155]), .D (nx10662), .CLK (
        clk)) ;
    mux21_ni ix10663 (.Y (nx10662), .A0 (nx6194), .A1 (dataOut_5__3), .S0 (
             nx13457)) ;
    oai221 ix6195 (.Y (nx6194), .A0 (nx13149), .A1 (nx13029), .B0 (nx13155), .B1 (
           nx13031), .C0 (nx12518)) ;
    aoi222 ix12519 (.Y (nx12518), .A0 (data_in[11]), .A1 (nx13445), .B0 (
           data_in[19]), .B1 (nx13449), .C0 (data_in[3]), .C1 (nx13453)) ;
    dff reg_data_5__4 (.Q (dataOut_5__4), .QB (\$dummy [156]), .D (nx10672), .CLK (
        clk)) ;
    mux21_ni ix10673 (.Y (nx10672), .A0 (nx6228), .A1 (dataOut_5__4), .S0 (
             nx13457)) ;
    oai221 ix6229 (.Y (nx6228), .A0 (nx13163), .A1 (nx6040), .B0 (nx13169), .B1 (
           nx6042), .C0 (nx12524)) ;
    aoi222 ix12525 (.Y (nx12524), .A0 (data_in[12]), .A1 (nx13445), .B0 (
           data_in[20]), .B1 (nx13449), .C0 (data_in[4]), .C1 (nx13453)) ;
    dff reg_data_5__5 (.Q (dataOut_5__5), .QB (\$dummy [157]), .D (nx10682), .CLK (
        clk)) ;
    mux21_ni ix10683 (.Y (nx10682), .A0 (nx6262), .A1 (dataOut_5__5), .S0 (
             nx13457)) ;
    oai221 ix6263 (.Y (nx6262), .A0 (nx13177), .A1 (nx6040), .B0 (nx13183), .B1 (
           nx6042), .C0 (nx12530)) ;
    aoi222 ix12531 (.Y (nx12530), .A0 (data_in[13]), .A1 (nx13445), .B0 (
           data_in[21]), .B1 (nx13449), .C0 (data_in[5]), .C1 (nx13453)) ;
    dff reg_data_5__6 (.Q (dataOut_5__6), .QB (\$dummy [158]), .D (nx10692), .CLK (
        clk)) ;
    mux21_ni ix10693 (.Y (nx10692), .A0 (nx6296), .A1 (dataOut_5__6), .S0 (
             nx13457)) ;
    oai221 ix6297 (.Y (nx6296), .A0 (nx13191), .A1 (nx6040), .B0 (nx13197), .B1 (
           nx6042), .C0 (nx12536)) ;
    aoi222 ix12537 (.Y (nx12536), .A0 (data_in[14]), .A1 (nx13445), .B0 (
           data_in[22]), .B1 (nx13449), .C0 (data_in[6]), .C1 (nx13453)) ;
    dff reg_data_5__7 (.Q (dataOut_5__7), .QB (\$dummy [159]), .D (nx10702), .CLK (
        clk)) ;
    mux21_ni ix10703 (.Y (nx10702), .A0 (nx6330), .A1 (dataOut_5__7), .S0 (
             nx13459)) ;
    oai221 ix6331 (.Y (nx6330), .A0 (nx13205), .A1 (nx6040), .B0 (nx13211), .B1 (
           nx6042), .C0 (nx12542)) ;
    aoi222 ix12543 (.Y (nx12542), .A0 (data_in[15]), .A1 (nx13447), .B0 (
           data_in[23]), .B1 (nx13451), .C0 (data_in[7]), .C1 (nx13455)) ;
    dff reg_data_4__0 (.Q (dataOut_4__0), .QB (\$dummy [160]), .D (nx10712), .CLK (
        clk)) ;
    mux21_ni ix10713 (.Y (nx10712), .A0 (nx6394), .A1 (dataOut_4__0), .S0 (
             nx13473)) ;
    oai221 ix6395 (.Y (nx6394), .A0 (nx13073), .A1 (nx13033), .B0 (nx13083), .B1 (
           nx13035), .C0 (nx12550)) ;
    nand02 ix6343 (.Y (nx6342), .A0 (nx12349), .A1 (nx13075)) ;
    nand02 ix6345 (.Y (nx6344), .A0 (nx12419), .A1 (nx11125)) ;
    aoi222 ix12551 (.Y (nx12550), .A0 (data_in[8]), .A1 (nx13461), .B0 (
           data_in[16]), .B1 (nx13465), .C0 (data_in[0]), .C1 (nx13469)) ;
    nand02 ix6355 (.Y (nx6354), .A0 (nx12039), .A1 (nx11366)) ;
    nand02 ix6353 (.Y (nx6352), .A0 (nx12047), .A1 (nx11298)) ;
    aoi22 ix12561 (.Y (nx12560), .A0 (nx13855), .A1 (nx5424), .B0 (nx13719), .B1 (
          nx6362)) ;
    nand04 ix6363 (.Y (nx6362), .A0 (nx6354), .A1 (nx6352), .A2 (nx13035), .A3 (
           nx13033)) ;
    dff reg_data_4__1 (.Q (dataOut_4__1), .QB (\$dummy [161]), .D (nx10722), .CLK (
        clk)) ;
    mux21_ni ix10723 (.Y (nx10722), .A0 (nx6428), .A1 (dataOut_4__1), .S0 (
             nx13473)) ;
    oai221 ix6429 (.Y (nx6428), .A0 (nx13121), .A1 (nx13033), .B0 (nx13127), .B1 (
           nx13035), .C0 (nx12567)) ;
    aoi222 ix12568 (.Y (nx12567), .A0 (data_in[9]), .A1 (nx13461), .B0 (
           data_in[17]), .B1 (nx13465), .C0 (data_in[1]), .C1 (nx13469)) ;
    dff reg_data_4__2 (.Q (dataOut_4__2), .QB (\$dummy [162]), .D (nx10732), .CLK (
        clk)) ;
    mux21_ni ix10733 (.Y (nx10732), .A0 (nx6462), .A1 (dataOut_4__2), .S0 (
             nx13473)) ;
    oai221 ix6463 (.Y (nx6462), .A0 (nx13135), .A1 (nx13033), .B0 (nx13141), .B1 (
           nx13035), .C0 (nx12573)) ;
    aoi222 ix12574 (.Y (nx12573), .A0 (data_in[10]), .A1 (nx13461), .B0 (
           data_in[18]), .B1 (nx13465), .C0 (data_in[2]), .C1 (nx13469)) ;
    dff reg_data_4__3 (.Q (dataOut_4__3), .QB (\$dummy [163]), .D (nx10742), .CLK (
        clk)) ;
    mux21_ni ix10743 (.Y (nx10742), .A0 (nx6496), .A1 (dataOut_4__3), .S0 (
             nx13473)) ;
    oai221 ix6497 (.Y (nx6496), .A0 (nx13149), .A1 (nx13033), .B0 (nx13155), .B1 (
           nx13035), .C0 (nx12579)) ;
    aoi222 ix12580 (.Y (nx12579), .A0 (data_in[11]), .A1 (nx13461), .B0 (
           data_in[19]), .B1 (nx13465), .C0 (data_in[3]), .C1 (nx13469)) ;
    dff reg_data_4__4 (.Q (dataOut_4__4), .QB (\$dummy [164]), .D (nx10752), .CLK (
        clk)) ;
    mux21_ni ix10753 (.Y (nx10752), .A0 (nx6530), .A1 (dataOut_4__4), .S0 (
             nx13473)) ;
    oai221 ix6531 (.Y (nx6530), .A0 (nx13163), .A1 (nx6342), .B0 (nx13169), .B1 (
           nx6344), .C0 (nx12585)) ;
    aoi222 ix12586 (.Y (nx12585), .A0 (data_in[12]), .A1 (nx13461), .B0 (
           data_in[20]), .B1 (nx13465), .C0 (data_in[4]), .C1 (nx13469)) ;
    dff reg_data_4__5 (.Q (dataOut_4__5), .QB (\$dummy [165]), .D (nx10762), .CLK (
        clk)) ;
    mux21_ni ix10763 (.Y (nx10762), .A0 (nx6564), .A1 (dataOut_4__5), .S0 (
             nx13473)) ;
    oai221 ix6565 (.Y (nx6564), .A0 (nx13177), .A1 (nx6342), .B0 (nx13183), .B1 (
           nx6344), .C0 (nx12591)) ;
    aoi222 ix12592 (.Y (nx12591), .A0 (data_in[13]), .A1 (nx13461), .B0 (
           data_in[21]), .B1 (nx13465), .C0 (data_in[5]), .C1 (nx13469)) ;
    dff reg_data_4__6 (.Q (dataOut_4__6), .QB (\$dummy [166]), .D (nx10772), .CLK (
        clk)) ;
    mux21_ni ix10773 (.Y (nx10772), .A0 (nx6598), .A1 (dataOut_4__6), .S0 (
             nx13473)) ;
    oai221 ix6599 (.Y (nx6598), .A0 (nx13191), .A1 (nx6342), .B0 (nx13197), .B1 (
           nx6344), .C0 (nx12597)) ;
    aoi222 ix12598 (.Y (nx12597), .A0 (data_in[14]), .A1 (nx13461), .B0 (
           data_in[22]), .B1 (nx13465), .C0 (data_in[6]), .C1 (nx13469)) ;
    dff reg_data_4__7 (.Q (dataOut_4__7), .QB (\$dummy [167]), .D (nx10782), .CLK (
        clk)) ;
    mux21_ni ix10783 (.Y (nx10782), .A0 (nx6632), .A1 (dataOut_4__7), .S0 (
             nx13475)) ;
    oai221 ix6633 (.Y (nx6632), .A0 (nx13205), .A1 (nx6342), .B0 (nx13211), .B1 (
           nx6344), .C0 (nx12603)) ;
    aoi222 ix12604 (.Y (nx12603), .A0 (data_in[15]), .A1 (nx13463), .B0 (
           data_in[23]), .B1 (nx13467), .C0 (data_in[7]), .C1 (nx13471)) ;
    dff reg_data_3__0 (.Q (dataOut_3__0), .QB (\$dummy [168]), .D (nx10792), .CLK (
        clk)) ;
    mux21_ni ix10793 (.Y (nx10792), .A0 (dataOut_3__0), .A1 (nx6690), .S0 (
             nx13045)) ;
    inv01 ix12611 (.Y (nx12610), .A (data_in[16])) ;
    nand02 ix6655 (.Y (nx6654), .A0 (nx12110), .A1 (nx11574)) ;
    aoi22 ix12614 (.Y (nx12613), .A0 (data_in[8]), .A1 (nx13863), .B0 (
          data_in[0]), .B1 (nx13479)) ;
    nor03_2x ix12618 (.Y (nx12617), .A0 (nx13849), .A1 (nx13851), .A2 (nx13863)
             ) ;
    oai22 ix6669 (.Y (nx6668), .A0 (nx13231), .A1 (nx13479), .B0 (nx12845), .B1 (
          nx12624)) ;
    nand02 ix12625 (.Y (nx12624), .A0 (nx11588), .A1 (nx2932)) ;
    dff reg_data_3__1 (.Q (dataOut_3__1), .QB (\$dummy [169]), .D (nx10802), .CLK (
        clk)) ;
    mux21_ni ix10803 (.Y (nx10802), .A0 (dataOut_3__1), .A1 (nx6718), .S0 (
             nx13045)) ;
    inv01 ix12631 (.Y (nx12630), .A (data_in[17])) ;
    aoi22 ix12633 (.Y (nx12632), .A0 (data_in[9]), .A1 (nx13863), .B0 (
          data_in[1]), .B1 (nx13479)) ;
    dff reg_data_3__2 (.Q (dataOut_3__2), .QB (\$dummy [170]), .D (nx10812), .CLK (
        clk)) ;
    mux21_ni ix10813 (.Y (nx10812), .A0 (dataOut_3__2), .A1 (nx6746), .S0 (
             nx13045)) ;
    inv01 ix12639 (.Y (nx12638), .A (data_in[18])) ;
    aoi22 ix12641 (.Y (nx12640), .A0 (data_in[10]), .A1 (nx13863), .B0 (
          data_in[2]), .B1 (nx13479)) ;
    dff reg_data_3__3 (.Q (dataOut_3__3), .QB (\$dummy [171]), .D (nx10822), .CLK (
        clk)) ;
    mux21_ni ix10823 (.Y (nx10822), .A0 (dataOut_3__3), .A1 (nx6774), .S0 (
             nx13045)) ;
    inv01 ix12647 (.Y (nx12646), .A (data_in[19])) ;
    aoi22 ix12649 (.Y (nx12648), .A0 (data_in[11]), .A1 (nx13863), .B0 (
          data_in[3]), .B1 (nx13479)) ;
    dff reg_data_3__4 (.Q (dataOut_3__4), .QB (\$dummy [172]), .D (nx10832), .CLK (
        clk)) ;
    mux21_ni ix10833 (.Y (nx10832), .A0 (dataOut_3__4), .A1 (nx6802), .S0 (
             nx13045)) ;
    inv01 ix12655 (.Y (nx12654), .A (data_in[20])) ;
    aoi22 ix12657 (.Y (nx12656), .A0 (data_in[12]), .A1 (nx13863), .B0 (
          data_in[4]), .B1 (nx13479)) ;
    dff reg_data_3__5 (.Q (dataOut_3__5), .QB (\$dummy [173]), .D (nx10842), .CLK (
        clk)) ;
    mux21_ni ix10843 (.Y (nx10842), .A0 (dataOut_3__5), .A1 (nx6830), .S0 (
             nx13045)) ;
    inv01 ix12663 (.Y (nx12662), .A (data_in[21])) ;
    aoi22 ix12665 (.Y (nx12664), .A0 (data_in[13]), .A1 (nx13863), .B0 (
          data_in[5]), .B1 (nx13479)) ;
    dff reg_data_3__6 (.Q (dataOut_3__6), .QB (\$dummy [174]), .D (nx10852), .CLK (
        clk)) ;
    mux21_ni ix10853 (.Y (nx10852), .A0 (dataOut_3__6), .A1 (nx6858), .S0 (
             nx13045)) ;
    inv01 ix12671 (.Y (nx12670), .A (data_in[22])) ;
    aoi22 ix12673 (.Y (nx12672), .A0 (data_in[14]), .A1 (nx12615), .B0 (
          data_in[6]), .B1 (nx13481)) ;
    dff reg_data_3__7 (.Q (dataOut_3__7), .QB (\$dummy [175]), .D (nx10862), .CLK (
        clk)) ;
    mux21_ni ix10863 (.Y (nx10862), .A0 (dataOut_3__7), .A1 (nx6886), .S0 (
             nx13047)) ;
    inv01 ix12679 (.Y (nx12678), .A (data_in[23])) ;
    aoi22 ix12681 (.Y (nx12680), .A0 (data_in[15]), .A1 (nx12615), .B0 (
          data_in[7]), .B1 (nx13481)) ;
    dff reg_data_2__0 (.Q (dataOut_2__0), .QB (\$dummy [176]), .D (nx10872), .CLK (
        clk)) ;
    mux21_ni ix10873 (.Y (nx10872), .A0 (dataOut_2__0), .A1 (nx6926), .S0 (
             nx13061)) ;
    oai222 ix6927 (.Y (nx6926), .A0 (nx12686), .A1 (nx13053), .B0 (nx12689), .B1 (
           nx13057), .C0 (nx12610), .C1 (nx13049)) ;
    inv01 ix12687 (.Y (nx12686), .A (data_in[8])) ;
    inv01 ix12690 (.Y (nx12689), .A (data_in[0])) ;
    nor04 ix6907 (.Y (nx6906), .A0 (nx13745), .A1 (nx13727), .A2 (nx13731), .A3 (
          nx13737)) ;
    nand02 ix6899 (.Y (nx6898), .A0 (nx12428), .A1 (nx11574)) ;
    oai22 ix6911 (.Y (nx6910), .A0 (nx13231), .A1 (nx12694), .B0 (nx12837), .B1 (
          nx12624)) ;
    dff reg_data_2__1 (.Q (dataOut_2__1), .QB (\$dummy [177]), .D (nx10882), .CLK (
        clk)) ;
    mux21_ni ix10883 (.Y (nx10882), .A0 (dataOut_2__1), .A1 (nx6948), .S0 (
             nx13061)) ;
    oai222 ix6949 (.Y (nx6948), .A0 (nx12704), .A1 (nx13053), .B0 (nx12706), .B1 (
           nx13057), .C0 (nx12630), .C1 (nx13049)) ;
    inv01 ix12705 (.Y (nx12704), .A (data_in[9])) ;
    inv01 ix12707 (.Y (nx12706), .A (data_in[1])) ;
    dff reg_data_2__2 (.Q (dataOut_2__2), .QB (\$dummy [178]), .D (nx10892), .CLK (
        clk)) ;
    mux21_ni ix10893 (.Y (nx10892), .A0 (dataOut_2__2), .A1 (nx6970), .S0 (
             nx13061)) ;
    oai222 ix6971 (.Y (nx6970), .A0 (nx12712), .A1 (nx13053), .B0 (nx12714), .B1 (
           nx13057), .C0 (nx12638), .C1 (nx13049)) ;
    inv01 ix12713 (.Y (nx12712), .A (data_in[10])) ;
    inv01 ix12715 (.Y (nx12714), .A (data_in[2])) ;
    dff reg_data_2__3 (.Q (dataOut_2__3), .QB (\$dummy [179]), .D (nx10902), .CLK (
        clk)) ;
    mux21_ni ix10903 (.Y (nx10902), .A0 (dataOut_2__3), .A1 (nx6992), .S0 (
             nx13061)) ;
    oai222 ix6993 (.Y (nx6992), .A0 (nx12720), .A1 (nx13053), .B0 (nx12722), .B1 (
           nx13057), .C0 (nx12646), .C1 (nx13049)) ;
    inv01 ix12721 (.Y (nx12720), .A (data_in[11])) ;
    inv01 ix12723 (.Y (nx12722), .A (data_in[3])) ;
    dff reg_data_2__4 (.Q (dataOut_2__4), .QB (\$dummy [180]), .D (nx10912), .CLK (
        clk)) ;
    mux21_ni ix10913 (.Y (nx10912), .A0 (dataOut_2__4), .A1 (nx7014), .S0 (
             nx13061)) ;
    oai222 ix7015 (.Y (nx7014), .A0 (nx12728), .A1 (nx13053), .B0 (nx12730), .B1 (
           nx13057), .C0 (nx12654), .C1 (nx13049)) ;
    inv01 ix12729 (.Y (nx12728), .A (data_in[12])) ;
    inv01 ix12731 (.Y (nx12730), .A (data_in[4])) ;
    dff reg_data_2__5 (.Q (dataOut_2__5), .QB (\$dummy [181]), .D (nx10922), .CLK (
        clk)) ;
    mux21_ni ix10923 (.Y (nx10922), .A0 (dataOut_2__5), .A1 (nx7036), .S0 (
             nx13061)) ;
    oai222 ix7037 (.Y (nx7036), .A0 (nx12736), .A1 (nx13053), .B0 (nx12738), .B1 (
           nx13057), .C0 (nx12662), .C1 (nx13049)) ;
    inv01 ix12737 (.Y (nx12736), .A (data_in[13])) ;
    inv01 ix12739 (.Y (nx12738), .A (data_in[5])) ;
    dff reg_data_2__6 (.Q (dataOut_2__6), .QB (\$dummy [182]), .D (nx10932), .CLK (
        clk)) ;
    mux21_ni ix10933 (.Y (nx10932), .A0 (dataOut_2__6), .A1 (nx7058), .S0 (
             nx13061)) ;
    oai222 ix7059 (.Y (nx7058), .A0 (nx12744), .A1 (nx13053), .B0 (nx12746), .B1 (
           nx13057), .C0 (nx12670), .C1 (nx13049)) ;
    inv01 ix12745 (.Y (nx12744), .A (data_in[14])) ;
    inv01 ix12747 (.Y (nx12746), .A (data_in[6])) ;
    dff reg_data_2__7 (.Q (dataOut_2__7), .QB (\$dummy [183]), .D (nx10942), .CLK (
        clk)) ;
    mux21_ni ix10943 (.Y (nx10942), .A0 (dataOut_2__7), .A1 (nx7080), .S0 (
             nx13063)) ;
    oai222 ix7081 (.Y (nx7080), .A0 (nx12752), .A1 (nx13055), .B0 (nx12754), .B1 (
           nx13059), .C0 (nx12678), .C1 (nx13051)) ;
    inv01 ix12753 (.Y (nx12752), .A (data_in[15])) ;
    inv01 ix12755 (.Y (nx12754), .A (data_in[7])) ;
    dff reg_data_1__0 (.Q (dataOut_1__0), .QB (\$dummy [184]), .D (nx10952), .CLK (
        clk)) ;
    mux21_ni ix10953 (.Y (nx10952), .A0 (dataOut_1__0), .A1 (nx7108), .S0 (
             nx13065)) ;
    mux21_ni ix7109 (.Y (nx7108), .A0 (data_in[0]), .A1 (data_in[8]), .S0 (
             nx13483)) ;
    nor04 ix12761 (.Y (nx12760), .A0 (nx12825), .A1 (nx13727), .A2 (nx13737), .A3 (
          nx13733)) ;
    oai21 ix7101 (.Y (nx7100), .A0 (nx12833), .A1 (nx12624), .B0 (nx13487)) ;
    nand02 ix12764 (.Y (nx12763), .A0 (nx13719), .A1 (nx13483)) ;
    dff reg_data_1__1 (.Q (dataOut_1__1), .QB (\$dummy [185]), .D (nx10962), .CLK (
        clk)) ;
    mux21_ni ix10963 (.Y (nx10962), .A0 (dataOut_1__1), .A1 (nx7122), .S0 (
             nx13065)) ;
    mux21_ni ix7123 (.Y (nx7122), .A0 (data_in[1]), .A1 (data_in[9]), .S0 (
             nx13483)) ;
    dff reg_data_1__2 (.Q (dataOut_1__2), .QB (\$dummy [186]), .D (nx10972), .CLK (
        clk)) ;
    mux21_ni ix10973 (.Y (nx10972), .A0 (dataOut_1__2), .A1 (nx7136), .S0 (
             nx13065)) ;
    mux21_ni ix7137 (.Y (nx7136), .A0 (data_in[2]), .A1 (data_in[10]), .S0 (
             nx13483)) ;
    dff reg_data_1__3 (.Q (dataOut_1__3), .QB (\$dummy [187]), .D (nx10982), .CLK (
        clk)) ;
    mux21_ni ix10983 (.Y (nx10982), .A0 (dataOut_1__3), .A1 (nx7150), .S0 (
             nx13065)) ;
    mux21_ni ix7151 (.Y (nx7150), .A0 (data_in[3]), .A1 (data_in[11]), .S0 (
             nx13483)) ;
    dff reg_data_1__4 (.Q (dataOut_1__4), .QB (\$dummy [188]), .D (nx10992), .CLK (
        clk)) ;
    mux21_ni ix10993 (.Y (nx10992), .A0 (dataOut_1__4), .A1 (nx7164), .S0 (
             nx13065)) ;
    mux21_ni ix7165 (.Y (nx7164), .A0 (data_in[4]), .A1 (data_in[12]), .S0 (
             nx13483)) ;
    dff reg_data_1__5 (.Q (dataOut_1__5), .QB (\$dummy [189]), .D (nx11002), .CLK (
        clk)) ;
    mux21_ni ix11003 (.Y (nx11002), .A0 (dataOut_1__5), .A1 (nx7178), .S0 (
             nx13065)) ;
    mux21_ni ix7179 (.Y (nx7178), .A0 (data_in[5]), .A1 (data_in[13]), .S0 (
             nx13483)) ;
    dff reg_data_1__6 (.Q (dataOut_1__6), .QB (\$dummy [190]), .D (nx11012), .CLK (
        clk)) ;
    mux21_ni ix11013 (.Y (nx11012), .A0 (dataOut_1__6), .A1 (nx7192), .S0 (
             nx13065)) ;
    mux21_ni ix7193 (.Y (nx7192), .A0 (data_in[6]), .A1 (data_in[14]), .S0 (
             nx13485)) ;
    dff reg_data_1__7 (.Q (dataOut_1__7), .QB (\$dummy [191]), .D (nx11022), .CLK (
        clk)) ;
    mux21_ni ix11023 (.Y (nx11022), .A0 (dataOut_1__7), .A1 (nx7206), .S0 (
             nx13067)) ;
    mux21_ni ix7207 (.Y (nx7206), .A0 (data_in[7]), .A1 (data_in[15]), .S0 (
             nx13485)) ;
    dff reg_data_0__0 (.Q (dataOut_0__0), .QB (\$dummy [192]), .D (nx11032), .CLK (
        clk)) ;
    mux21_ni ix11033 (.Y (nx11032), .A0 (data_in[0]), .A1 (dataOut_0__0), .S0 (
             nx13487)) ;
    dff reg_data_0__1 (.Q (dataOut_0__1), .QB (\$dummy [193]), .D (nx11042), .CLK (
        clk)) ;
    mux21_ni ix11043 (.Y (nx11042), .A0 (data_in[1]), .A1 (dataOut_0__1), .S0 (
             nx13487)) ;
    dff reg_data_0__2 (.Q (dataOut_0__2), .QB (\$dummy [194]), .D (nx11052), .CLK (
        clk)) ;
    mux21_ni ix11053 (.Y (nx11052), .A0 (data_in[2]), .A1 (dataOut_0__2), .S0 (
             nx13487)) ;
    dff reg_data_0__3 (.Q (dataOut_0__3), .QB (\$dummy [195]), .D (nx11062), .CLK (
        clk)) ;
    mux21_ni ix11063 (.Y (nx11062), .A0 (data_in[3]), .A1 (dataOut_0__3), .S0 (
             nx13487)) ;
    dff reg_data_0__4 (.Q (dataOut_0__4), .QB (\$dummy [196]), .D (nx11072), .CLK (
        clk)) ;
    mux21_ni ix11073 (.Y (nx11072), .A0 (data_in[4]), .A1 (dataOut_0__4), .S0 (
             nx12763)) ;
    dff reg_data_0__5 (.Q (dataOut_0__5), .QB (\$dummy [197]), .D (nx11082), .CLK (
        clk)) ;
    mux21_ni ix11083 (.Y (nx11082), .A0 (data_in[5]), .A1 (dataOut_0__5), .S0 (
             nx12763)) ;
    dff reg_data_0__6 (.Q (dataOut_0__6), .QB (\$dummy [198]), .D (nx11092), .CLK (
        clk)) ;
    mux21_ni ix11093 (.Y (nx11092), .A0 (data_in[6]), .A1 (dataOut_0__6), .S0 (
             nx12763)) ;
    dff reg_data_0__7 (.Q (dataOut_0__7), .QB (\$dummy [199]), .D (nx11102), .CLK (
        clk)) ;
    mux21_ni ix11103 (.Y (nx11102), .A0 (data_in[7]), .A1 (dataOut_0__7), .S0 (
             nx12763)) ;
    inv01 ix12695 (.Y (nx12694), .A (nx6906)) ;
    inv01 ix12620 (.Y (nx12619), .A (nx6654)) ;
    inv01 ix6053 (.Y (nx6052), .A (nx12487)) ;
    inv01 ix11982 (.Y (nx11981), .A (nx2970)) ;
    inv01 ix11443 (.Y (nx11442), .A (nx1094)) ;
    inv01 ix11367 (.Y (nx11366), .A (nx494)) ;
    inv01 ix11304 (.Y (nx11303), .A (nx472)) ;
    inv01 ix11189 (.Y (nx11188), .A (nx150)) ;
    inv01 ix143 (.Y (nx142), .A (nx11193)) ;
    inv01 ix11568 (.Y (nx11567), .A (nx138)) ;
    inv01 ix11200 (.Y (nx11199), .A (nx104)) ;
    inv01 ix101 (.Y (nx100), .A (nx11168)) ;
    inv01 ix11126 (.Y (nx11125), .A (nx72)) ;
    inv01 ix11197 (.Y (nx11196), .A (nx66)) ;
    inv01 ix11283 (.Y (nx11282), .A (nx58)) ;
    inv01 ix11379 (.Y (nx11378), .A (nx52)) ;
    inv01 ix47 (.Y (nx46), .A (nx11141)) ;
    inv01 ix5 (.Y (nx4), .A (nx11120)) ;
    inv02 ix12822 (.Y (nx12823), .A (nx13855)) ;
    inv02 ix12824 (.Y (nx12825), .A (nx13855)) ;
    buf02 ix12826 (.Y (nx12827), .A (nx36)) ;
    buf02 ix12828 (.Y (nx12829), .A (nx36)) ;
    inv02 ix12830 (.Y (nx12831), .A (nx13111)) ;
    inv02 ix12832 (.Y (nx12833), .A (nx13113)) ;
    inv02 ix12834 (.Y (nx12835), .A (nx13859)) ;
    inv02 ix12836 (.Y (nx12837), .A (nx11196)) ;
    buf02 ix12838 (.Y (nx12839), .A (nx78)) ;
    buf02 ix12840 (.Y (nx12841), .A (nx78)) ;
    inv02 ix12842 (.Y (nx12843), .A (nx13857)) ;
    inv02 ix12844 (.Y (nx12845), .A (nx13097)) ;
    buf02 ix12852 (.Y (nx12853), .A (nx512)) ;
    buf02 ix12854 (.Y (nx12855), .A (nx512)) ;
    buf02 ix12862 (.Y (nx12863), .A (nx814)) ;
    buf02 ix12864 (.Y (nx12865), .A (nx814)) ;
    buf02 ix12872 (.Y (nx12873), .A (nx1116)) ;
    buf02 ix12874 (.Y (nx12875), .A (nx1116)) ;
    buf02 ix12882 (.Y (nx12883), .A (nx1418)) ;
    buf02 ix12884 (.Y (nx12885), .A (nx1418)) ;
    buf02 ix12894 (.Y (nx12895), .A (nx1750)) ;
    buf02 ix12896 (.Y (nx12897), .A (nx1750)) ;
    buf02 ix12906 (.Y (nx12907), .A (nx2052)) ;
    buf02 ix12908 (.Y (nx12909), .A (nx2052)) ;
    buf02 ix12918 (.Y (nx12919), .A (nx2354)) ;
    buf02 ix12920 (.Y (nx12921), .A (nx2354)) ;
    buf02 ix12930 (.Y (nx12931), .A (nx2656)) ;
    buf02 ix12932 (.Y (nx12933), .A (nx2656)) ;
    buf02 ix12942 (.Y (nx12943), .A (nx2996)) ;
    buf02 ix12944 (.Y (nx12945), .A (nx2996)) ;
    buf02 ix12954 (.Y (nx12955), .A (nx3310)) ;
    buf02 ix12956 (.Y (nx12957), .A (nx3310)) ;
    nand02 ix12958 (.Y (nx12959), .A0 (nx11825), .A1 (nx13113)) ;
    nand02 ix12960 (.Y (nx12961), .A0 (nx11902), .A1 (nx13753)) ;
    buf02 ix12962 (.Y (nx12963), .A (nx3616)) ;
    buf02 ix12964 (.Y (nx12965), .A (nx3616)) ;
    nand02 ix12966 (.Y (nx12967), .A0 (nx11825), .A1 (nx13855)) ;
    nand02 ix12968 (.Y (nx12969), .A0 (nx11902), .A1 (nx11125)) ;
    buf02 ix12970 (.Y (nx12971), .A (nx3922)) ;
    buf02 ix12972 (.Y (nx12973), .A (nx3922)) ;
    nand02 ix12974 (.Y (nx12975), .A0 (nx12097), .A1 (nx13097)) ;
    nand02 ix12976 (.Y (nx12977), .A0 (nx11828), .A1 (nx11135)) ;
    buf02 ix12978 (.Y (nx12979), .A (nx4238)) ;
    buf02 ix12980 (.Y (nx12981), .A (nx4238)) ;
    buf02 ix12990 (.Y (nx12991), .A (nx4542)) ;
    buf02 ix12992 (.Y (nx12993), .A (nx4542)) ;
    buf02 ix13002 (.Y (nx13003), .A (nx4844)) ;
    buf02 ix13004 (.Y (nx13005), .A (nx4844)) ;
    buf02 ix13014 (.Y (nx13015), .A (nx5146)) ;
    buf02 ix13016 (.Y (nx13017), .A (nx5146)) ;
    nand02 ix13018 (.Y (nx13019), .A0 (nx12349), .A1 (nx13097)) ;
    inv02 ix13020 (.Y (nx13021), .A (nx12361)) ;
    inv02 ix13022 (.Y (nx13023), .A (nx12361)) ;
    nand02 ix13024 (.Y (nx13025), .A0 (nx12349), .A1 (nx13859)) ;
    nand02 ix13026 (.Y (nx13027), .A0 (nx12419), .A1 (nx11188)) ;
    nand02 ix13028 (.Y (nx13029), .A0 (nx12349), .A1 (nx13113)) ;
    nand02 ix13030 (.Y (nx13031), .A0 (nx12419), .A1 (nx13753)) ;
    nand02 ix13032 (.Y (nx13033), .A0 (nx12349), .A1 (nx13855)) ;
    nand02 ix13034 (.Y (nx13035), .A0 (nx12419), .A1 (nx11125)) ;
    buf02 ix13044 (.Y (nx13045), .A (nx6668)) ;
    buf02 ix13046 (.Y (nx13047), .A (nx6668)) ;
    buf02 ix13048 (.Y (nx13049), .A (nx6898)) ;
    buf02 ix13050 (.Y (nx13051), .A (nx6898)) ;
    inv02 ix13052 (.Y (nx13053), .A (nx12696)) ;
    inv02 ix13054 (.Y (nx13055), .A (nx12696)) ;
    inv02 ix13056 (.Y (nx13057), .A (nx12694)) ;
    inv02 ix13058 (.Y (nx13059), .A (nx12694)) ;
    buf02 ix13060 (.Y (nx13061), .A (nx6910)) ;
    buf02 ix13062 (.Y (nx13063), .A (nx6910)) ;
    buf02 ix13064 (.Y (nx13065), .A (nx7100)) ;
    buf02 ix13066 (.Y (nx13067), .A (nx7100)) ;
    inv02 ix13068 (.Y (nx13069), .A (data_in[32])) ;
    inv02 ix13070 (.Y (nx13071), .A (data_in[32])) ;
    inv02 ix13072 (.Y (nx13073), .A (data_in[32])) ;
    inv02 ix13074 (.Y (nx13075), .A (nx4)) ;
    inv02 ix13076 (.Y (nx13077), .A (nx4)) ;
    inv02 ix13078 (.Y (nx13079), .A (data_in[24])) ;
    inv02 ix13080 (.Y (nx13081), .A (data_in[24])) ;
    inv02 ix13082 (.Y (nx13083), .A (data_in[24])) ;
    inv02 ix13086 (.Y (nx13087), .A (address[2])) ;
    inv02 ix13088 (.Y (nx13089), .A (nx13737)) ;
    inv02 ix13090 (.Y (nx13091), .A (nx156)) ;
    inv02 ix13092 (.Y (nx13093), .A (nx156)) ;
    inv02 ix13094 (.Y (nx13095), .A (nx118)) ;
    inv02 ix13096 (.Y (nx13097), .A (nx118)) ;
    inv02 ix13098 (.Y (nx13099), .A (nx112)) ;
    inv02 ix13100 (.Y (nx13101), .A (nx112)) ;
    inv02 ix13102 (.Y (nx13103), .A (nx164)) ;
    inv02 ix13104 (.Y (nx13105), .A (nx164)) ;
    buf02 ix13106 (.Y (nx13107), .A (nx11181)) ;
    buf02 ix13108 (.Y (nx13109), .A (nx11181)) ;
    inv01 ix13110 (.Y (nx13111), .A (nx62)) ;
    inv01 ix13112 (.Y (nx13113), .A (nx62)) ;
    inv01 ix13114 (.Y (nx13115), .A (nx66)) ;
    inv02 ix13116 (.Y (nx13117), .A (data_in[33])) ;
    inv02 ix13118 (.Y (nx13119), .A (data_in[33])) ;
    inv02 ix13120 (.Y (nx13121), .A (data_in[33])) ;
    inv02 ix13122 (.Y (nx13123), .A (data_in[25])) ;
    inv02 ix13124 (.Y (nx13125), .A (data_in[25])) ;
    inv02 ix13126 (.Y (nx13127), .A (data_in[25])) ;
    inv02 ix13130 (.Y (nx13131), .A (data_in[34])) ;
    inv02 ix13132 (.Y (nx13133), .A (data_in[34])) ;
    inv02 ix13134 (.Y (nx13135), .A (data_in[34])) ;
    inv02 ix13136 (.Y (nx13137), .A (data_in[26])) ;
    inv02 ix13138 (.Y (nx13139), .A (data_in[26])) ;
    inv02 ix13140 (.Y (nx13141), .A (data_in[26])) ;
    inv02 ix13144 (.Y (nx13145), .A (data_in[35])) ;
    inv02 ix13146 (.Y (nx13147), .A (data_in[35])) ;
    inv02 ix13148 (.Y (nx13149), .A (data_in[35])) ;
    inv02 ix13150 (.Y (nx13151), .A (data_in[27])) ;
    inv02 ix13152 (.Y (nx13153), .A (data_in[27])) ;
    inv02 ix13154 (.Y (nx13155), .A (data_in[27])) ;
    inv02 ix13158 (.Y (nx13159), .A (data_in[36])) ;
    inv02 ix13160 (.Y (nx13161), .A (data_in[36])) ;
    inv02 ix13162 (.Y (nx13163), .A (data_in[36])) ;
    inv02 ix13164 (.Y (nx13165), .A (data_in[28])) ;
    inv02 ix13166 (.Y (nx13167), .A (data_in[28])) ;
    inv02 ix13168 (.Y (nx13169), .A (data_in[28])) ;
    inv02 ix13172 (.Y (nx13173), .A (data_in[37])) ;
    inv02 ix13174 (.Y (nx13175), .A (data_in[37])) ;
    inv02 ix13176 (.Y (nx13177), .A (data_in[37])) ;
    inv02 ix13178 (.Y (nx13179), .A (data_in[29])) ;
    inv02 ix13180 (.Y (nx13181), .A (data_in[29])) ;
    inv02 ix13182 (.Y (nx13183), .A (data_in[29])) ;
    inv02 ix13186 (.Y (nx13187), .A (data_in[38])) ;
    inv02 ix13188 (.Y (nx13189), .A (data_in[38])) ;
    inv02 ix13190 (.Y (nx13191), .A (data_in[38])) ;
    inv02 ix13192 (.Y (nx13193), .A (data_in[30])) ;
    inv02 ix13194 (.Y (nx13195), .A (data_in[30])) ;
    inv02 ix13196 (.Y (nx13197), .A (data_in[30])) ;
    inv02 ix13200 (.Y (nx13201), .A (data_in[39])) ;
    inv02 ix13202 (.Y (nx13203), .A (data_in[39])) ;
    inv02 ix13204 (.Y (nx13205), .A (data_in[39])) ;
    inv02 ix13206 (.Y (nx13207), .A (data_in[31])) ;
    inv02 ix13208 (.Y (nx13209), .A (data_in[31])) ;
    inv02 ix13210 (.Y (nx13211), .A (data_in[31])) ;
    buf02 ix13214 (.Y (nx13215), .A (nx11288)) ;
    buf02 ix13216 (.Y (nx13217), .A (nx11288)) ;
    buf02 ix13218 (.Y (nx13219), .A (nx11295)) ;
    buf02 ix13220 (.Y (nx13221), .A (nx11295)) ;
    buf02 ix13222 (.Y (nx13223), .A (nx11301)) ;
    buf02 ix13224 (.Y (nx13225), .A (nx11301)) ;
    inv02 ix13226 (.Y (nx13227), .A (wr)) ;
    inv02 ix13228 (.Y (nx13229), .A (nx13719)) ;
    inv02 ix13230 (.Y (nx13231), .A (nx13719)) ;
    buf02 ix13232 (.Y (nx13233), .A (nx11363)) ;
    buf02 ix13234 (.Y (nx13235), .A (nx11363)) ;
    buf02 ix13236 (.Y (nx13237), .A (nx11369)) ;
    buf02 ix13238 (.Y (nx13239), .A (nx11369)) ;
    buf02 ix13240 (.Y (nx13241), .A (nx11371)) ;
    buf02 ix13242 (.Y (nx13243), .A (nx11371)) ;
    buf02 ix13244 (.Y (nx13245), .A (nx11436)) ;
    buf02 ix13246 (.Y (nx13247), .A (nx11436)) ;
    buf02 ix13248 (.Y (nx13249), .A (nx11438)) ;
    buf02 ix13250 (.Y (nx13251), .A (nx11438)) ;
    buf02 ix13252 (.Y (nx13253), .A (nx11440)) ;
    buf02 ix13254 (.Y (nx13255), .A (nx11440)) ;
    buf02 ix13256 (.Y (nx13257), .A (nx11497)) ;
    buf02 ix13258 (.Y (nx13259), .A (nx11497)) ;
    buf02 ix13260 (.Y (nx13261), .A (nx11499)) ;
    buf02 ix13262 (.Y (nx13263), .A (nx11499)) ;
    buf02 ix13264 (.Y (nx13265), .A (nx11501)) ;
    buf02 ix13266 (.Y (nx13267), .A (nx11501)) ;
    buf02 ix13268 (.Y (nx13269), .A (nx11562)) ;
    buf02 ix13270 (.Y (nx13271), .A (nx11562)) ;
    buf02 ix13272 (.Y (nx13273), .A (nx11571)) ;
    buf02 ix13274 (.Y (nx13275), .A (nx11571)) ;
    buf02 ix13276 (.Y (nx13277), .A (nx11577)) ;
    buf02 ix13278 (.Y (nx13279), .A (nx11577)) ;
    buf02 ix13280 (.Y (nx13281), .A (nx11640)) ;
    buf02 ix13282 (.Y (nx13283), .A (nx11640)) ;
    buf02 ix13284 (.Y (nx13285), .A (nx11646)) ;
    buf02 ix13286 (.Y (nx13287), .A (nx11646)) ;
    buf02 ix13288 (.Y (nx13289), .A (nx11648)) ;
    buf02 ix13290 (.Y (nx13291), .A (nx11648)) ;
    buf02 ix13292 (.Y (nx13293), .A (nx11705)) ;
    buf02 ix13294 (.Y (nx13295), .A (nx11705)) ;
    buf02 ix13296 (.Y (nx13297), .A (nx11707)) ;
    buf02 ix13298 (.Y (nx13299), .A (nx11707)) ;
    buf02 ix13300 (.Y (nx13301), .A (nx11709)) ;
    buf02 ix13302 (.Y (nx13303), .A (nx11709)) ;
    buf02 ix13304 (.Y (nx13305), .A (nx11767)) ;
    buf02 ix13306 (.Y (nx13307), .A (nx11767)) ;
    buf02 ix13308 (.Y (nx13309), .A (nx11769)) ;
    buf02 ix13310 (.Y (nx13311), .A (nx11769)) ;
    buf02 ix13312 (.Y (nx13313), .A (nx11771)) ;
    buf02 ix13314 (.Y (nx13315), .A (nx11771)) ;
    buf02 ix13316 (.Y (nx13317), .A (nx11832)) ;
    buf02 ix13318 (.Y (nx13319), .A (nx11832)) ;
    buf02 ix13320 (.Y (nx13321), .A (nx11838)) ;
    buf02 ix13322 (.Y (nx13323), .A (nx11838)) ;
    buf02 ix13324 (.Y (nx13325), .A (nx11842)) ;
    buf02 ix13326 (.Y (nx13327), .A (nx11842)) ;
    buf02 ix13328 (.Y (nx13329), .A (nx11906)) ;
    buf02 ix13330 (.Y (nx13331), .A (nx11906)) ;
    buf02 ix13332 (.Y (nx13333), .A (nx11910)) ;
    buf02 ix13334 (.Y (nx13335), .A (nx11910)) ;
    buf02 ix13336 (.Y (nx13337), .A (nx11912)) ;
    buf02 ix13338 (.Y (nx13339), .A (nx11912)) ;
    inv02 ix13340 (.Y (nx13341), .A (nx3604)) ;
    inv02 ix13342 (.Y (nx13343), .A (nx3604)) ;
    inv02 ix13344 (.Y (nx13345), .A (nx3600)) ;
    inv02 ix13346 (.Y (nx13347), .A (nx3600)) ;
    buf02 ix13348 (.Y (nx13349), .A (nx11975)) ;
    buf02 ix13350 (.Y (nx13351), .A (nx11975)) ;
    inv02 ix13352 (.Y (nx13353), .A (nx3910)) ;
    inv02 ix13354 (.Y (nx13355), .A (nx3910)) ;
    inv02 ix13356 (.Y (nx13357), .A (nx3906)) ;
    inv02 ix13358 (.Y (nx13359), .A (nx3906)) ;
    buf02 ix13360 (.Y (nx13361), .A (nx12043)) ;
    buf02 ix13362 (.Y (nx13363), .A (nx12043)) ;
    inv02 ix13364 (.Y (nx13365), .A (nx4226)) ;
    inv02 ix13366 (.Y (nx13367), .A (nx4226)) ;
    inv02 ix13368 (.Y (nx13369), .A (nx4224)) ;
    inv02 ix13370 (.Y (nx13371), .A (nx4224)) ;
    buf02 ix13372 (.Y (nx13373), .A (nx12106)) ;
    buf02 ix13374 (.Y (nx13375), .A (nx12106)) ;
    buf02 ix13376 (.Y (nx13377), .A (nx12166)) ;
    buf02 ix13378 (.Y (nx13379), .A (nx12166)) ;
    buf02 ix13380 (.Y (nx13381), .A (nx12168)) ;
    buf02 ix13382 (.Y (nx13383), .A (nx12168)) ;
    buf02 ix13384 (.Y (nx13385), .A (nx12170)) ;
    buf02 ix13386 (.Y (nx13387), .A (nx12170)) ;
    buf02 ix13388 (.Y (nx13389), .A (nx12230)) ;
    buf02 ix13390 (.Y (nx13391), .A (nx12230)) ;
    buf02 ix13392 (.Y (nx13393), .A (nx12232)) ;
    buf02 ix13394 (.Y (nx13395), .A (nx12232)) ;
    buf02 ix13396 (.Y (nx13397), .A (nx12234)) ;
    buf02 ix13398 (.Y (nx13399), .A (nx12234)) ;
    buf02 ix13400 (.Y (nx13401), .A (nx12291)) ;
    buf02 ix13402 (.Y (nx13403), .A (nx12291)) ;
    buf02 ix13404 (.Y (nx13405), .A (nx12293)) ;
    buf02 ix13406 (.Y (nx13407), .A (nx12293)) ;
    buf02 ix13408 (.Y (nx13409), .A (nx12295)) ;
    buf02 ix13410 (.Y (nx13411), .A (nx12295)) ;
    inv02 ix13412 (.Y (nx13413), .A (nx5446)) ;
    inv02 ix13414 (.Y (nx13415), .A (nx5446)) ;
    inv02 ix13416 (.Y (nx13417), .A (nx5444)) ;
    inv02 ix13418 (.Y (nx13419), .A (nx5444)) ;
    inv02 ix13420 (.Y (nx13421), .A (nx5454)) ;
    inv02 ix13422 (.Y (nx13423), .A (nx5454)) ;
    buf02 ix13424 (.Y (nx13425), .A (nx12365)) ;
    buf02 ix13426 (.Y (nx13427), .A (nx12365)) ;
    inv02 ix13428 (.Y (nx13429), .A (nx5750)) ;
    inv02 ix13430 (.Y (nx13431), .A (nx5750)) ;
    inv02 ix13432 (.Y (nx13433), .A (nx5748)) ;
    inv02 ix13434 (.Y (nx13435), .A (nx5748)) ;
    inv02 ix13436 (.Y (nx13437), .A (nx5758)) ;
    inv02 ix13438 (.Y (nx13439), .A (nx5758)) ;
    buf02 ix13440 (.Y (nx13441), .A (nx12434)) ;
    buf02 ix13442 (.Y (nx13443), .A (nx12434)) ;
    inv02 ix13444 (.Y (nx13445), .A (nx6052)) ;
    inv02 ix13446 (.Y (nx13447), .A (nx6052)) ;
    inv02 ix13448 (.Y (nx13449), .A (nx6050)) ;
    inv02 ix13450 (.Y (nx13451), .A (nx6050)) ;
    inv02 ix13452 (.Y (nx13453), .A (nx6060)) ;
    inv02 ix13454 (.Y (nx13455), .A (nx6060)) ;
    buf02 ix13456 (.Y (nx13457), .A (nx12497)) ;
    buf02 ix13458 (.Y (nx13459), .A (nx12497)) ;
    inv02 ix13460 (.Y (nx13461), .A (nx6354)) ;
    inv02 ix13462 (.Y (nx13463), .A (nx6354)) ;
    inv02 ix13464 (.Y (nx13465), .A (nx6352)) ;
    inv02 ix13466 (.Y (nx13467), .A (nx6352)) ;
    inv02 ix13468 (.Y (nx13469), .A (nx6362)) ;
    inv02 ix13470 (.Y (nx13471), .A (nx6362)) ;
    buf02 ix13472 (.Y (nx13473), .A (nx12560)) ;
    buf02 ix13474 (.Y (nx13475), .A (nx12560)) ;
    buf02 ix13478 (.Y (nx13479), .A (nx12617)) ;
    buf02 ix13480 (.Y (nx13481), .A (nx12617)) ;
    buf02 ix13482 (.Y (nx13483), .A (nx12760)) ;
    buf02 ix13484 (.Y (nx13485), .A (nx12760)) ;
    nand02 ix13486 (.Y (nx13487), .A0 (nx13719), .A1 (nx13483)) ;
    and02 ix39 (.Y (nx38), .A0 (nx13739), .A1 (nx4)) ;
    and02 ix123 (.Y (nx122), .A0 (nx13739), .A1 (nx13857)) ;
    nand03 ix11161 (.Y (nx112), .A0 (nx13859), .A1 (nx106), .A2 (nx11199)) ;
    nor02ii ix11 (.Y (nx10), .A0 (nx11184), .A1 (nx13855)) ;
    or02 ix11191 (.Y (nx62), .A0 (nx13745), .A1 (nx11127)) ;
    ao221 ix541 (.Y (nx540), .A0 (data_in[32]), .A1 (nx13759), .B0 (data_in[24])
          , .B1 (nx13757), .C0 (nx13493)) ;
    inv01 ix13492 (.Y (nx13493), .A (nx11286)) ;
    nor02ii ix11280 (.Y (nx11279), .A0 (nx466), .A1 (nx58)) ;
    nor02ii ix11291 (.Y (nx11290), .A0 (nx494), .A1 (nx144)) ;
    nor02ii ix11294 (.Y (nx11293), .A0 (nx13751), .A1 (nx13859)) ;
    nor02ii ix11296 (.Y (nx11295), .A0 (nx486), .A1 (nx13111)) ;
    nor02ii ix11306 (.Y (nx11305), .A0 (nx456), .A1 (nx13857)) ;
    ao221 ix575 (.Y (nx574), .A0 (data_in[33]), .A1 (nx13759), .B0 (data_in[25])
          , .B1 (nx13757), .C0 (nx13495)) ;
    inv01 ix13494 (.Y (nx13495), .A (nx11317)) ;
    ao221 ix609 (.Y (nx608), .A0 (data_in[34]), .A1 (nx13759), .B0 (data_in[26])
          , .B1 (nx13757), .C0 (nx13497)) ;
    inv01 ix13496 (.Y (nx13497), .A (nx11323)) ;
    ao221 ix643 (.Y (nx642), .A0 (data_in[35]), .A1 (nx13759), .B0 (data_in[27])
          , .B1 (nx13757), .C0 (nx13499)) ;
    inv01 ix13498 (.Y (nx13499), .A (nx11329)) ;
    ao221 ix677 (.Y (nx676), .A0 (data_in[36]), .A1 (nx13759), .B0 (data_in[28])
          , .B1 (nx11303), .C0 (nx13501)) ;
    inv01 ix13500 (.Y (nx13501), .A (nx11335)) ;
    ao221 ix711 (.Y (nx710), .A0 (data_in[37]), .A1 (nx13759), .B0 (data_in[29])
          , .B1 (nx11303), .C0 (nx13503)) ;
    inv01 ix13502 (.Y (nx13503), .A (nx11341)) ;
    ao221 ix745 (.Y (nx744), .A0 (data_in[38]), .A1 (nx13761), .B0 (data_in[30])
          , .B1 (nx11303), .C0 (nx13505)) ;
    inv01 ix13504 (.Y (nx13505), .A (nx11347)) ;
    ao221 ix779 (.Y (nx778), .A0 (data_in[39]), .A1 (nx13761), .B0 (data_in[31])
          , .B1 (nx11303), .C0 (nx13507)) ;
    inv01 ix13506 (.Y (nx13507), .A (nx11353)) ;
    ao221 ix843 (.Y (nx842), .A0 (data_in[32]), .A1 (nx13767), .B0 (data_in[24])
          , .B1 (nx13763), .C0 (nx13509)) ;
    inv01 ix13508 (.Y (nx13509), .A (nx11361)) ;
    nor02ii ix793 (.Y (nx11373), .A0 (nx13869), .A1 (nx11279)) ;
    nor02ii ix11364 (.Y (nx11363), .A0 (nx72), .A1 (nx11290)) ;
    nor02ii ix11370 (.Y (nx11369), .A0 (nx486), .A1 (nx13855)) ;
    nor02ii ix11384 (.Y (nx11383), .A0 (nx456), .A1 (nx13859)) ;
    ao221 ix877 (.Y (nx876), .A0 (data_in[33]), .A1 (nx13767), .B0 (data_in[25])
          , .B1 (nx13763), .C0 (nx13511)) ;
    inv01 ix13510 (.Y (nx13511), .A (nx11390)) ;
    ao221 ix911 (.Y (nx910), .A0 (data_in[34]), .A1 (nx13767), .B0 (data_in[26])
          , .B1 (nx13763), .C0 (nx13513)) ;
    inv01 ix13512 (.Y (nx13513), .A (nx11396)) ;
    ao221 ix945 (.Y (nx944), .A0 (data_in[35]), .A1 (nx13767), .B0 (data_in[27])
          , .B1 (nx13763), .C0 (nx13515)) ;
    inv01 ix13514 (.Y (nx13515), .A (nx11402)) ;
    ao221 ix979 (.Y (nx978), .A0 (data_in[36]), .A1 (nx13767), .B0 (data_in[28])
          , .B1 (nx13763), .C0 (nx13517)) ;
    inv01 ix13516 (.Y (nx13517), .A (nx11408)) ;
    ao221 ix1013 (.Y (nx1012), .A0 (data_in[37]), .A1 (nx13767), .B0 (
          data_in[29]), .B1 (nx13763), .C0 (nx13519)) ;
    inv01 ix13518 (.Y (nx13519), .A (nx11414)) ;
    ao221 ix1047 (.Y (nx1046), .A0 (data_in[38]), .A1 (nx13769), .B0 (
          data_in[30]), .B1 (nx13765), .C0 (nx13521)) ;
    inv01 ix13520 (.Y (nx13521), .A (nx11420)) ;
    ao221 ix1081 (.Y (nx1080), .A0 (data_in[39]), .A1 (nx13769), .B0 (
          data_in[31]), .B1 (nx13765), .C0 (nx13523)) ;
    inv01 ix13522 (.Y (nx13523), .A (nx11426)) ;
    ao221 ix1145 (.Y (nx1144), .A0 (data_in[32]), .A1 (nx13773), .B0 (
          data_in[24]), .B1 (nx13771), .C0 (nx13525)) ;
    inv01 ix13524 (.Y (nx13525), .A (nx11434)) ;
    nor02ii ix11439 (.Y (nx11438), .A0 (nx486), .A1 (nx13095)) ;
    nor02ii ix11445 (.Y (nx11444), .A0 (nx456), .A1 (nx13111)) ;
    ao221 ix1179 (.Y (nx1178), .A0 (data_in[33]), .A1 (nx13773), .B0 (
          data_in[25]), .B1 (nx13771), .C0 (nx13527)) ;
    inv01 ix13526 (.Y (nx13527), .A (nx11451)) ;
    ao221 ix1213 (.Y (nx1212), .A0 (data_in[34]), .A1 (nx13773), .B0 (
          data_in[26]), .B1 (nx13771), .C0 (nx13529)) ;
    inv01 ix13528 (.Y (nx13529), .A (nx11457)) ;
    ao221 ix1247 (.Y (nx1246), .A0 (data_in[35]), .A1 (nx13773), .B0 (
          data_in[27]), .B1 (nx13771), .C0 (nx13531)) ;
    inv01 ix13530 (.Y (nx13531), .A (nx11463)) ;
    ao221 ix1281 (.Y (nx1280), .A0 (data_in[36]), .A1 (nx13773), .B0 (
          data_in[28]), .B1 (nx11442), .C0 (nx13533)) ;
    inv01 ix13532 (.Y (nx13533), .A (nx11469)) ;
    ao221 ix1315 (.Y (nx1314), .A0 (data_in[37]), .A1 (nx13773), .B0 (
          data_in[29]), .B1 (nx11442), .C0 (nx13535)) ;
    inv01 ix13534 (.Y (nx13535), .A (nx11475)) ;
    ao221 ix1349 (.Y (nx1348), .A0 (data_in[38]), .A1 (nx13775), .B0 (
          data_in[30]), .B1 (nx11442), .C0 (nx13537)) ;
    inv01 ix13536 (.Y (nx13537), .A (nx11481)) ;
    ao221 ix1383 (.Y (nx1382), .A0 (data_in[39]), .A1 (nx13775), .B0 (
          data_in[31]), .B1 (nx11442), .C0 (nx13539)) ;
    inv01 ix13538 (.Y (nx13539), .A (nx11487)) ;
    ao221 ix1447 (.Y (nx1446), .A0 (data_in[32]), .A1 (nx13781), .B0 (
          data_in[24]), .B1 (nx13777), .C0 (nx13541)) ;
    inv01 ix13540 (.Y (nx13541), .A (nx11495)) ;
    nor02ii ix1397 (.Y (nx11503), .A0 (nx72), .A1 (nx11279)) ;
    nor02ii ix11498 (.Y (nx11497), .A0 (nx13869), .A1 (nx11290)) ;
    nor02ii ix11500 (.Y (nx11499), .A0 (nx486), .A1 (nx13115)) ;
    nor02ii ix11506 (.Y (nx11505), .A0 (nx456), .A1 (nx13077)) ;
    ao221 ix1481 (.Y (nx1480), .A0 (data_in[33]), .A1 (nx13781), .B0 (
          data_in[25]), .B1 (nx13777), .C0 (nx13543)) ;
    inv01 ix13542 (.Y (nx13543), .A (nx11512)) ;
    ao221 ix1515 (.Y (nx1514), .A0 (data_in[34]), .A1 (nx13781), .B0 (
          data_in[26]), .B1 (nx13777), .C0 (nx13545)) ;
    inv01 ix13544 (.Y (nx13545), .A (nx11518)) ;
    ao221 ix1549 (.Y (nx1548), .A0 (data_in[35]), .A1 (nx13781), .B0 (
          data_in[27]), .B1 (nx13777), .C0 (nx13547)) ;
    inv01 ix13546 (.Y (nx13547), .A (nx11524)) ;
    ao221 ix1583 (.Y (nx1582), .A0 (data_in[36]), .A1 (nx13781), .B0 (
          data_in[28]), .B1 (nx13777), .C0 (nx13549)) ;
    inv01 ix13548 (.Y (nx13549), .A (nx11530)) ;
    ao221 ix1617 (.Y (nx1616), .A0 (data_in[37]), .A1 (nx13781), .B0 (
          data_in[29]), .B1 (nx13777), .C0 (nx13551)) ;
    inv01 ix13550 (.Y (nx13551), .A (nx11536)) ;
    ao221 ix1651 (.Y (nx1650), .A0 (data_in[38]), .A1 (nx13783), .B0 (
          data_in[30]), .B1 (nx13779), .C0 (nx13553)) ;
    inv01 ix13552 (.Y (nx13553), .A (nx11542)) ;
    ao221 ix1685 (.Y (nx1684), .A0 (data_in[39]), .A1 (nx13783), .B0 (
          data_in[31]), .B1 (nx13779), .C0 (nx13555)) ;
    inv01 ix13554 (.Y (nx13555), .A (nx11548)) ;
    ao221 ix1779 (.Y (nx1778), .A0 (data_in[32]), .A1 (nx13789), .B0 (
          data_in[24]), .B1 (nx13785), .C0 (nx13557)) ;
    inv01 ix13556 (.Y (nx13557), .A (nx11560)) ;
    nor02ii ix1709 (.Y (nx11582), .A0 (nx118), .A1 (nx11555)) ;
    nor02ii ix11565 (.Y (nx11564), .A0 (nx1732), .A1 (nx144)) ;
    nor02ii ix11572 (.Y (nx11571), .A0 (nx1728), .A1 (nx13111)) ;
    nor02ii ix11575 (.Y (nx11574), .A0 (nx94), .A1 (nx11168)) ;
    ao221 ix1813 (.Y (nx1812), .A0 (data_in[33]), .A1 (nx13789), .B0 (
          data_in[25]), .B1 (nx13785), .C0 (nx13559)) ;
    inv01 ix13558 (.Y (nx13559), .A (nx11594)) ;
    ao221 ix1847 (.Y (nx1846), .A0 (data_in[34]), .A1 (nx13789), .B0 (
          data_in[26]), .B1 (nx13785), .C0 (nx13561)) ;
    inv01 ix13560 (.Y (nx13561), .A (nx11600)) ;
    ao221 ix1881 (.Y (nx1880), .A0 (data_in[35]), .A1 (nx13789), .B0 (
          data_in[27]), .B1 (nx13785), .C0 (nx13563)) ;
    inv01 ix13562 (.Y (nx13563), .A (nx11606)) ;
    ao221 ix1915 (.Y (nx1914), .A0 (data_in[36]), .A1 (nx13789), .B0 (
          data_in[28]), .B1 (nx13785), .C0 (nx13565)) ;
    inv01 ix13564 (.Y (nx13565), .A (nx11612)) ;
    ao221 ix1949 (.Y (nx1948), .A0 (data_in[37]), .A1 (nx13789), .B0 (
          data_in[29]), .B1 (nx13785), .C0 (nx13567)) ;
    inv01 ix13566 (.Y (nx13567), .A (nx11618)) ;
    ao221 ix1983 (.Y (nx1982), .A0 (data_in[38]), .A1 (nx13791), .B0 (
          data_in[30]), .B1 (nx13787), .C0 (nx13569)) ;
    inv01 ix13568 (.Y (nx13569), .A (nx11624)) ;
    ao221 ix2017 (.Y (nx2016), .A0 (data_in[39]), .A1 (nx13791), .B0 (
          data_in[31]), .B1 (nx13787), .C0 (nx13571)) ;
    inv01 ix13570 (.Y (nx13571), .A (nx11630)) ;
    ao221 ix2081 (.Y (nx2080), .A0 (data_in[32]), .A1 (nx13795), .B0 (
          data_in[24]), .B1 (nx13793), .C0 (nx13573)) ;
    inv01 ix13572 (.Y (nx13573), .A (nx11638)) ;
    nor02ii ix2029 (.Y (nx11652), .A0 (nx66), .A1 (nx11555)) ;
    nor02ii ix11641 (.Y (nx11640), .A0 (nx72), .A1 (nx11564)) ;
    nor02ii ix11647 (.Y (nx11646), .A0 (nx1728), .A1 (nx13077)) ;
    ao221 ix2115 (.Y (nx2114), .A0 (data_in[33]), .A1 (nx13795), .B0 (
          data_in[25]), .B1 (nx13793), .C0 (nx13575)) ;
    inv01 ix13574 (.Y (nx13575), .A (nx11659)) ;
    ao221 ix2149 (.Y (nx2148), .A0 (data_in[34]), .A1 (nx13795), .B0 (
          data_in[26]), .B1 (nx13793), .C0 (nx13577)) ;
    inv01 ix13576 (.Y (nx13577), .A (nx11665)) ;
    ao221 ix2183 (.Y (nx2182), .A0 (data_in[35]), .A1 (nx13795), .B0 (
          data_in[27]), .B1 (nx13793), .C0 (nx13579)) ;
    inv01 ix13578 (.Y (nx13579), .A (nx11671)) ;
    ao221 ix2217 (.Y (nx2216), .A0 (data_in[36]), .A1 (nx13795), .B0 (
          data_in[28]), .B1 (nx13793), .C0 (nx13581)) ;
    inv01 ix13580 (.Y (nx13581), .A (nx11677)) ;
    ao221 ix2251 (.Y (nx2250), .A0 (data_in[37]), .A1 (nx13795), .B0 (
          data_in[29]), .B1 (nx13793), .C0 (nx13583)) ;
    inv01 ix13582 (.Y (nx13583), .A (nx11683)) ;
    ao221 ix2285 (.Y (nx2284), .A0 (data_in[38]), .A1 (nx13797), .B0 (
          data_in[30]), .B1 (nx11650), .C0 (nx13585)) ;
    inv01 ix13584 (.Y (nx13585), .A (nx11689)) ;
    ao221 ix2319 (.Y (nx2318), .A0 (data_in[39]), .A1 (nx13797), .B0 (
          data_in[31]), .B1 (nx11650), .C0 (nx13587)) ;
    inv01 ix13586 (.Y (nx13587), .A (nx11695)) ;
    ao221 ix2383 (.Y (nx2382), .A0 (data_in[32]), .A1 (nx13803), .B0 (
          data_in[24]), .B1 (nx13799), .C0 (nx13589)) ;
    inv01 ix13588 (.Y (nx13589), .A (nx11703)) ;
    nor02ii ix2331 (.Y (nx11714), .A0 (nx62), .A1 (nx11555)) ;
    nor02ii ix11708 (.Y (nx11707), .A0 (nx1728), .A1 (nx13095)) ;
    nor02ii ix11712 (.Y (nx11711), .A0 (nx1714), .A1 (nx13755)) ;
    ao221 ix2417 (.Y (nx2416), .A0 (data_in[33]), .A1 (nx13803), .B0 (
          data_in[25]), .B1 (nx13799), .C0 (nx13591)) ;
    inv01 ix13590 (.Y (nx13591), .A (nx11721)) ;
    ao221 ix2451 (.Y (nx2450), .A0 (data_in[34]), .A1 (nx13803), .B0 (
          data_in[26]), .B1 (nx13799), .C0 (nx13593)) ;
    inv01 ix13592 (.Y (nx13593), .A (nx11727)) ;
    ao221 ix2485 (.Y (nx2484), .A0 (data_in[35]), .A1 (nx13803), .B0 (
          data_in[27]), .B1 (nx13799), .C0 (nx13595)) ;
    inv01 ix13594 (.Y (nx13595), .A (nx11733)) ;
    ao221 ix2519 (.Y (nx2518), .A0 (data_in[36]), .A1 (nx13803), .B0 (
          data_in[28]), .B1 (nx13799), .C0 (nx13597)) ;
    inv01 ix13596 (.Y (nx13597), .A (nx11739)) ;
    ao221 ix2553 (.Y (nx2552), .A0 (data_in[37]), .A1 (nx13803), .B0 (
          data_in[29]), .B1 (nx13799), .C0 (nx13599)) ;
    inv01 ix13598 (.Y (nx13599), .A (nx11745)) ;
    ao221 ix2587 (.Y (nx2586), .A0 (data_in[38]), .A1 (nx13805), .B0 (
          data_in[30]), .B1 (nx13801), .C0 (nx13601)) ;
    inv01 ix13600 (.Y (nx13601), .A (nx11751)) ;
    ao221 ix2621 (.Y (nx2620), .A0 (data_in[39]), .A1 (nx13805), .B0 (
          data_in[31]), .B1 (nx13801), .C0 (nx13603)) ;
    inv01 ix13602 (.Y (nx13603), .A (nx11757)) ;
    ao221 ix2685 (.Y (nx2684), .A0 (data_in[32]), .A1 (nx13809), .B0 (
          data_in[24]), .B1 (nx13807), .C0 (nx13605)) ;
    inv01 ix13604 (.Y (nx13605), .A (nx11765)) ;
    nor02ii ix2633 (.Y (nx11775), .A0 (nx4), .A1 (nx11555)) ;
    nor02ii ix11768 (.Y (nx11767), .A0 (nx13869), .A1 (nx11564)) ;
    nor02ii ix11770 (.Y (nx11769), .A0 (nx1728), .A1 (nx13115)) ;
    ao221 ix2719 (.Y (nx2718), .A0 (data_in[33]), .A1 (nx13809), .B0 (
          data_in[25]), .B1 (nx13807), .C0 (nx13607)) ;
    inv01 ix13606 (.Y (nx13607), .A (nx11782)) ;
    ao221 ix2753 (.Y (nx2752), .A0 (data_in[34]), .A1 (nx13809), .B0 (
          data_in[26]), .B1 (nx13807), .C0 (nx13609)) ;
    inv01 ix13608 (.Y (nx13609), .A (nx11788)) ;
    ao221 ix2787 (.Y (nx2786), .A0 (data_in[35]), .A1 (nx13809), .B0 (
          data_in[27]), .B1 (nx13807), .C0 (nx13611)) ;
    inv01 ix13610 (.Y (nx13611), .A (nx11794)) ;
    ao221 ix2821 (.Y (nx2820), .A0 (data_in[36]), .A1 (nx13809), .B0 (
          data_in[28]), .B1 (nx13807), .C0 (nx13613)) ;
    inv01 ix13612 (.Y (nx13613), .A (nx11800)) ;
    ao221 ix2855 (.Y (nx2854), .A0 (data_in[37]), .A1 (nx13809), .B0 (
          data_in[29]), .B1 (nx13807), .C0 (nx13615)) ;
    inv01 ix13614 (.Y (nx13615), .A (nx11806)) ;
    ao221 ix2889 (.Y (nx2888), .A0 (data_in[38]), .A1 (nx13811), .B0 (
          data_in[30]), .B1 (nx11773), .C0 (nx13617)) ;
    inv01 ix13616 (.Y (nx13617), .A (nx11812)) ;
    ao221 ix2923 (.Y (nx2922), .A0 (data_in[39]), .A1 (nx13811), .B0 (
          data_in[31]), .B1 (nx11773), .C0 (nx13619)) ;
    inv01 ix13618 (.Y (nx13619), .A (nx11818)) ;
    ao221 ix3025 (.Y (nx3024), .A0 (data_in[32]), .A1 (nx13817), .B0 (
          data_in[24]), .B1 (nx13813), .C0 (nx13621)) ;
    inv01 ix13620 (.Y (nx13621), .A (nx11830)) ;
    nor02ii ix2949 (.Y (nx11847), .A0 (nx118), .A1 (nx11825)) ;
    and03 ix2959 (.Y (nx11844), .A0 (nx52), .A1 (nx46), .A2 (nx11828)) ;
    nor02ii ix11837 (.Y (nx11836), .A0 (nx11158), .A1 (nx138)) ;
    nor02ii ix11839 (.Y (nx11838), .A0 (nx2970), .A1 (nx12110)) ;
    nor02ii ix2933 (.Y (nx2932), .A0 (nx13727), .A1 (nx13719)) ;
    ao221 ix3059 (.Y (nx3058), .A0 (data_in[33]), .A1 (nx13817), .B0 (
          data_in[25]), .B1 (nx13813), .C0 (nx13623)) ;
    inv01 ix13622 (.Y (nx13623), .A (nx11858)) ;
    ao221 ix3093 (.Y (nx3092), .A0 (data_in[34]), .A1 (nx13817), .B0 (
          data_in[26]), .B1 (nx13813), .C0 (nx13625)) ;
    inv01 ix13624 (.Y (nx13625), .A (nx11864)) ;
    ao221 ix3127 (.Y (nx3126), .A0 (data_in[35]), .A1 (nx13817), .B0 (
          data_in[27]), .B1 (nx13813), .C0 (nx13627)) ;
    inv01 ix13626 (.Y (nx13627), .A (nx11870)) ;
    ao221 ix3161 (.Y (nx3160), .A0 (data_in[36]), .A1 (nx13817), .B0 (
          data_in[28]), .B1 (nx13813), .C0 (nx13629)) ;
    inv01 ix13628 (.Y (nx13629), .A (nx11876)) ;
    ao221 ix3195 (.Y (nx3194), .A0 (data_in[37]), .A1 (nx13817), .B0 (
          data_in[29]), .B1 (nx13813), .C0 (nx13631)) ;
    inv01 ix13630 (.Y (nx13631), .A (nx11882)) ;
    ao221 ix3229 (.Y (nx3228), .A0 (data_in[38]), .A1 (nx13819), .B0 (
          data_in[30]), .B1 (nx13815), .C0 (nx13633)) ;
    inv01 ix13632 (.Y (nx13633), .A (nx11888)) ;
    ao221 ix3263 (.Y (nx3262), .A0 (data_in[39]), .A1 (nx13819), .B0 (
          data_in[31]), .B1 (nx13815), .C0 (nx13635)) ;
    inv01 ix13634 (.Y (nx13635), .A (nx11894)) ;
    ao221 ix3339 (.Y (nx3338), .A0 (data_in[32]), .A1 (nx13825), .B0 (
          data_in[24]), .B1 (nx13821), .C0 (nx13637)) ;
    inv01 ix13636 (.Y (nx13637), .A (nx11904)) ;
    nor02ii ix3275 (.Y (nx11916), .A0 (nx66), .A1 (nx11825)) ;
    nor02ii ix3285 (.Y (nx11914), .A0 (nx13869), .A1 (nx11902)) ;
    ao221 ix3373 (.Y (nx3372), .A0 (data_in[33]), .A1 (nx13825), .B0 (
          data_in[25]), .B1 (nx13821), .C0 (nx13639)) ;
    inv01 ix13638 (.Y (nx13639), .A (nx11923)) ;
    ao221 ix3407 (.Y (nx3406), .A0 (data_in[34]), .A1 (nx13825), .B0 (
          data_in[26]), .B1 (nx13821), .C0 (nx13641)) ;
    inv01 ix13640 (.Y (nx13641), .A (nx11929)) ;
    ao221 ix3441 (.Y (nx3440), .A0 (data_in[35]), .A1 (nx13825), .B0 (
          data_in[27]), .B1 (nx13821), .C0 (nx13643)) ;
    inv01 ix13642 (.Y (nx13643), .A (nx11935)) ;
    ao221 ix3475 (.Y (nx3474), .A0 (data_in[36]), .A1 (nx13825), .B0 (
          data_in[28]), .B1 (nx13821), .C0 (nx13645)) ;
    inv01 ix13644 (.Y (nx13645), .A (nx11941)) ;
    ao221 ix3509 (.Y (nx3508), .A0 (data_in[37]), .A1 (nx13825), .B0 (
          data_in[29]), .B1 (nx13821), .C0 (nx13647)) ;
    inv01 ix13646 (.Y (nx13647), .A (nx11947)) ;
    ao221 ix3543 (.Y (nx3542), .A0 (data_in[38]), .A1 (nx13827), .B0 (
          data_in[30]), .B1 (nx13823), .C0 (nx13649)) ;
    inv01 ix13648 (.Y (nx13649), .A (nx11953)) ;
    ao221 ix3577 (.Y (nx3576), .A0 (data_in[39]), .A1 (nx13827), .B0 (
          data_in[31]), .B1 (nx13823), .C0 (nx13651)) ;
    inv01 ix13650 (.Y (nx13651), .A (nx11959)) ;
    nor02ii ix11980 (.Y (nx11979), .A0 (nx106), .A1 (nx13097)) ;
    nor02ii ix12048 (.Y (nx12047), .A0 (nx106), .A1 (nx11196)) ;
    ao221 ix4571 (.Y (nx4570), .A0 (data_in[32]), .A1 (nx13831), .B0 (
          data_in[24]), .B1 (nx13829), .C0 (nx13653)) ;
    inv01 ix13652 (.Y (nx13653), .A (nx12164)) ;
    nor02ii ix4517 (.Y (nx12174), .A0 (nx66), .A1 (nx12097)) ;
    ao221 ix4605 (.Y (nx4604), .A0 (data_in[33]), .A1 (nx13831), .B0 (
          data_in[25]), .B1 (nx13829), .C0 (nx13655)) ;
    inv01 ix13654 (.Y (nx13655), .A (nx12182)) ;
    ao221 ix4639 (.Y (nx4638), .A0 (data_in[34]), .A1 (nx13831), .B0 (
          data_in[26]), .B1 (nx13829), .C0 (nx13657)) ;
    inv01 ix13656 (.Y (nx13657), .A (nx12188)) ;
    ao221 ix4673 (.Y (nx4672), .A0 (data_in[35]), .A1 (nx13831), .B0 (
          data_in[27]), .B1 (nx13829), .C0 (nx13659)) ;
    inv01 ix13658 (.Y (nx13659), .A (nx12194)) ;
    ao221 ix4707 (.Y (nx4706), .A0 (data_in[36]), .A1 (nx13831), .B0 (
          data_in[28]), .B1 (nx13829), .C0 (nx13661)) ;
    inv01 ix13660 (.Y (nx13661), .A (nx12200)) ;
    ao221 ix4741 (.Y (nx4740), .A0 (data_in[37]), .A1 (nx13831), .B0 (
          data_in[29]), .B1 (nx13829), .C0 (nx13663)) ;
    inv01 ix13662 (.Y (nx13663), .A (nx12206)) ;
    ao221 ix4775 (.Y (nx4774), .A0 (data_in[38]), .A1 (nx13833), .B0 (
          data_in[30]), .B1 (nx12172), .C0 (nx13665)) ;
    inv01 ix13664 (.Y (nx13665), .A (nx12212)) ;
    ao221 ix4809 (.Y (nx4808), .A0 (data_in[39]), .A1 (nx13833), .B0 (
          data_in[31]), .B1 (nx12172), .C0 (nx13667)) ;
    inv01 ix13666 (.Y (nx13667), .A (nx12218)) ;
    ao221 ix4873 (.Y (nx4872), .A0 (data_in[32]), .A1 (nx13839), .B0 (
          data_in[24]), .B1 (nx13835), .C0 (nx13669)) ;
    inv01 ix13668 (.Y (nx13669), .A (nx12228)) ;
    nor02ii ix4821 (.Y (nx12238), .A0 (nx62), .A1 (nx12097)) ;
    nor02ii ix12237 (.Y (nx12236), .A0 (nx4518), .A1 (nx13755)) ;
    ao221 ix4907 (.Y (nx4906), .A0 (data_in[33]), .A1 (nx13839), .B0 (
          data_in[25]), .B1 (nx13835), .C0 (nx13671)) ;
    inv01 ix13670 (.Y (nx13671), .A (nx12245)) ;
    ao221 ix4941 (.Y (nx4940), .A0 (data_in[34]), .A1 (nx13839), .B0 (
          data_in[26]), .B1 (nx13835), .C0 (nx13673)) ;
    inv01 ix13672 (.Y (nx13673), .A (nx12251)) ;
    ao221 ix4975 (.Y (nx4974), .A0 (data_in[35]), .A1 (nx13839), .B0 (
          data_in[27]), .B1 (nx13835), .C0 (nx13675)) ;
    inv01 ix13674 (.Y (nx13675), .A (nx12257)) ;
    ao221 ix5009 (.Y (nx5008), .A0 (data_in[36]), .A1 (nx13839), .B0 (
          data_in[28]), .B1 (nx13835), .C0 (nx13677)) ;
    inv01 ix13676 (.Y (nx13677), .A (nx12263)) ;
    ao221 ix5043 (.Y (nx5042), .A0 (data_in[37]), .A1 (nx13839), .B0 (
          data_in[29]), .B1 (nx13835), .C0 (nx13679)) ;
    inv01 ix13678 (.Y (nx13679), .A (nx12269)) ;
    ao221 ix5077 (.Y (nx5076), .A0 (data_in[38]), .A1 (nx13841), .B0 (
          data_in[30]), .B1 (nx13837), .C0 (nx13681)) ;
    inv01 ix13680 (.Y (nx13681), .A (nx12275)) ;
    ao221 ix5111 (.Y (nx5110), .A0 (data_in[39]), .A1 (nx13841), .B0 (
          data_in[31]), .B1 (nx13837), .C0 (nx13683)) ;
    inv01 ix13682 (.Y (nx13683), .A (nx12281)) ;
    ao221 ix5175 (.Y (nx5174), .A0 (data_in[32]), .A1 (nx13845), .B0 (
          data_in[24]), .B1 (nx13843), .C0 (nx13685)) ;
    inv01 ix13684 (.Y (nx13685), .A (nx12289)) ;
    nor02ii ix5123 (.Y (nx12299), .A0 (nx4), .A1 (nx12097)) ;
    ao221 ix5209 (.Y (nx5208), .A0 (data_in[33]), .A1 (nx13845), .B0 (
          data_in[25]), .B1 (nx13843), .C0 (nx13687)) ;
    inv01 ix13686 (.Y (nx13687), .A (nx12306)) ;
    ao221 ix5243 (.Y (nx5242), .A0 (data_in[34]), .A1 (nx13845), .B0 (
          data_in[26]), .B1 (nx13843), .C0 (nx13689)) ;
    inv01 ix13688 (.Y (nx13689), .A (nx12312)) ;
    ao221 ix5277 (.Y (nx5276), .A0 (data_in[35]), .A1 (nx13845), .B0 (
          data_in[27]), .B1 (nx13843), .C0 (nx13691)) ;
    inv01 ix13690 (.Y (nx13691), .A (nx12318)) ;
    ao221 ix5311 (.Y (nx5310), .A0 (data_in[36]), .A1 (nx13845), .B0 (
          data_in[28]), .B1 (nx13843), .C0 (nx13693)) ;
    inv01 ix13692 (.Y (nx13693), .A (nx12324)) ;
    ao221 ix5345 (.Y (nx5344), .A0 (data_in[37]), .A1 (nx13845), .B0 (
          data_in[29]), .B1 (nx13843), .C0 (nx13695)) ;
    inv01 ix13694 (.Y (nx13695), .A (nx12330)) ;
    ao221 ix5379 (.Y (nx5378), .A0 (data_in[38]), .A1 (nx13847), .B0 (
          data_in[30]), .B1 (nx12297), .C0 (nx13697)) ;
    inv01 ix13696 (.Y (nx13697), .A (nx12336)) ;
    ao221 ix5413 (.Y (nx5412), .A0 (data_in[39]), .A1 (nx13847), .B0 (
          data_in[31]), .B1 (nx12297), .C0 (nx13699)) ;
    inv01 ix13698 (.Y (nx13699), .A (nx12342)) ;
    ao221 ix6691 (.Y (nx6690), .A0 (data_in[24]), .A1 (nx13851), .B0 (
          data_in[16]), .B1 (nx13849), .C0 (nx13701)) ;
    inv01 ix13700 (.Y (nx13701), .A (nx12613)) ;
    and03 ix6653 (.Y (nx12621), .A0 (nx11378), .A1 (nx11141), .A2 (nx11828)) ;
    nor02ii ix12616 (.Y (nx12615), .A0 (nx1732), .A1 (nx11834)) ;
    ao221 ix6719 (.Y (nx6718), .A0 (data_in[25]), .A1 (nx13851), .B0 (
          data_in[17]), .B1 (nx13849), .C0 (nx13703)) ;
    inv01 ix13702 (.Y (nx13703), .A (nx12632)) ;
    ao221 ix6747 (.Y (nx6746), .A0 (data_in[26]), .A1 (nx13851), .B0 (
          data_in[18]), .B1 (nx13849), .C0 (nx13705)) ;
    inv01 ix13704 (.Y (nx13705), .A (nx12640)) ;
    ao221 ix6775 (.Y (nx6774), .A0 (data_in[27]), .A1 (nx13851), .B0 (
          data_in[19]), .B1 (nx13849), .C0 (nx13707)) ;
    inv01 ix13706 (.Y (nx13707), .A (nx12648)) ;
    ao221 ix6803 (.Y (nx6802), .A0 (data_in[28]), .A1 (nx13851), .B0 (
          data_in[20]), .B1 (nx12619), .C0 (nx13709)) ;
    inv01 ix13708 (.Y (nx13709), .A (nx12656)) ;
    ao221 ix6831 (.Y (nx6830), .A0 (data_in[29]), .A1 (nx13851), .B0 (
          data_in[21]), .B1 (nx12619), .C0 (nx13711)) ;
    inv01 ix13710 (.Y (nx13711), .A (nx12664)) ;
    ao221 ix6859 (.Y (nx6858), .A0 (data_in[30]), .A1 (nx13853), .B0 (
          data_in[22]), .B1 (nx12619), .C0 (nx13713)) ;
    inv01 ix13712 (.Y (nx13713), .A (nx12672)) ;
    ao221 ix6887 (.Y (nx6886), .A0 (data_in[31]), .A1 (nx13853), .B0 (
          data_in[23]), .B1 (nx12619), .C0 (nx13715)) ;
    inv01 ix13714 (.Y (nx13715), .A (nx12680)) ;
    nor02ii ix12697 (.Y (nx12696), .A0 (nx1732), .A1 (nx11908)) ;
    nor02ii ix13476 (.Y (nx13477), .A0 (nx1732), .A1 (nx11834)) ;
    inv02 ix13716 (.Y (nx13717), .A (nx13227)) ;
    inv02 ix13718 (.Y (nx13719), .A (nx13227)) ;
    buf02 ix13720 (.Y (nx13721), .A (address[4])) ;
    buf02 ix13722 (.Y (nx13723), .A (address[4])) ;
    buf02 ix13724 (.Y (nx13725), .A (address[4])) ;
    buf02 ix13726 (.Y (nx13727), .A (address[4])) ;
    inv02 ix13728 (.Y (nx13729), .A (nx11118)) ;
    inv02 ix13730 (.Y (nx13731), .A (nx11118)) ;
    inv02 ix13732 (.Y (nx13733), .A (nx11118)) ;
    inv02 ix13734 (.Y (nx13735), .A (nx13087)) ;
    inv02 ix13736 (.Y (nx13737), .A (nx13087)) ;
    inv02 ix13738 (.Y (nx13739), .A (nx13087)) ;
    buf02 ix13740 (.Y (nx13741), .A (address[1])) ;
    buf02 ix13742 (.Y (nx13743), .A (address[1])) ;
    buf02 ix13744 (.Y (nx13745), .A (address[1])) ;
    inv04 ix13746 (.Y (nx13747), .A (nx11127)) ;
    inv04 ix13748 (.Y (nx13749), .A (nx11127)) ;
    inv04 ix13750 (.Y (nx13751), .A (nx11127)) ;
    buf02 ix13752 (.Y (nx13753), .A (nx11293)) ;
    buf02 ix13754 (.Y (nx13755), .A (nx11293)) ;
    inv01 ix13756 (.Y (nx13757), .A (nx472)) ;
    buf02 ix13758 (.Y (nx13759), .A (nx11305)) ;
    buf02 ix13760 (.Y (nx13761), .A (nx11305)) ;
    buf02 ix13762 (.Y (nx13763), .A (nx11373)) ;
    buf02 ix13764 (.Y (nx13765), .A (nx11373)) ;
    buf02 ix13766 (.Y (nx13767), .A (nx11383)) ;
    buf02 ix13768 (.Y (nx13769), .A (nx11383)) ;
    inv01 ix13770 (.Y (nx13771), .A (nx1094)) ;
    buf02 ix13772 (.Y (nx13773), .A (nx11444)) ;
    buf02 ix13774 (.Y (nx13775), .A (nx11444)) ;
    buf02 ix13776 (.Y (nx13777), .A (nx11503)) ;
    buf02 ix13778 (.Y (nx13779), .A (nx11503)) ;
    buf02 ix13780 (.Y (nx13781), .A (nx11505)) ;
    buf02 ix13782 (.Y (nx13783), .A (nx11505)) ;
    buf02 ix13784 (.Y (nx13785), .A (nx11579)) ;
    buf02 ix13786 (.Y (nx13787), .A (nx11579)) ;
    buf02 ix13788 (.Y (nx13789), .A (nx11582)) ;
    buf02 ix13790 (.Y (nx13791), .A (nx11582)) ;
    nor02_2x ix13792 (.Y (nx13793), .A0 (nx1714), .A1 (nx13871)) ;
    buf02 ix13794 (.Y (nx13795), .A (nx11652)) ;
    buf02 ix13796 (.Y (nx13797), .A (nx11652)) ;
    buf02 ix13798 (.Y (nx13799), .A (nx11711)) ;
    buf02 ix13800 (.Y (nx13801), .A (nx11711)) ;
    buf02 ix13802 (.Y (nx13803), .A (nx11714)) ;
    buf02 ix13804 (.Y (nx13805), .A (nx11714)) ;
    nor02_2x ix13806 (.Y (nx13807), .A0 (nx1714), .A1 (nx72)) ;
    buf02 ix13808 (.Y (nx13809), .A (nx11775)) ;
    buf02 ix13810 (.Y (nx13811), .A (nx11775)) ;
    buf02 ix13812 (.Y (nx13813), .A (nx11844)) ;
    buf02 ix13814 (.Y (nx13815), .A (nx11844)) ;
    buf02 ix13816 (.Y (nx13817), .A (nx11847)) ;
    buf02 ix13818 (.Y (nx13819), .A (nx11847)) ;
    buf02 ix13820 (.Y (nx13821), .A (nx11914)) ;
    buf02 ix13822 (.Y (nx13823), .A (nx11914)) ;
    buf02 ix13824 (.Y (nx13825), .A (nx11916)) ;
    buf02 ix13826 (.Y (nx13827), .A (nx11916)) ;
    nor02_2x ix13828 (.Y (nx13829), .A0 (nx4518), .A1 (nx13871)) ;
    buf02 ix13830 (.Y (nx13831), .A (nx12174)) ;
    buf02 ix13832 (.Y (nx13833), .A (nx12174)) ;
    buf02 ix13834 (.Y (nx13835), .A (nx12236)) ;
    buf02 ix13836 (.Y (nx13837), .A (nx12236)) ;
    buf02 ix13838 (.Y (nx13839), .A (nx12238)) ;
    buf02 ix13840 (.Y (nx13841), .A (nx12238)) ;
    nor02_2x ix13842 (.Y (nx13843), .A0 (nx4518), .A1 (nx72)) ;
    buf02 ix13844 (.Y (nx13845), .A (nx12299)) ;
    buf02 ix13846 (.Y (nx13847), .A (nx12299)) ;
    inv01 ix13848 (.Y (nx13849), .A (nx6654)) ;
    buf02 ix13850 (.Y (nx13851), .A (nx12621)) ;
    buf02 ix13852 (.Y (nx13853), .A (nx12621)) ;
    inv02 ix13854 (.Y (nx13855), .A (nx4)) ;
    inv02 ix13856 (.Y (nx13857), .A (nx118)) ;
    inv01 ix13858 (.Y (nx13859), .A (nx66)) ;
    inv02 ix13860 (.Y (nx13861), .A (wr)) ;
    buf02 ix13862 (.Y (nx13863), .A (nx13477)) ;
    inv02 ix13868 (.Y (nx13869), .A (nx11188)) ;
    inv02 ix13870 (.Y (nx13871), .A (nx11188)) ;
endmodule



//
// Verilog description for cell state,
// Mon May 14 03:18:08 2018
//
// LeonardoSpectrum Level 3, 2017a.2
//


//
// Verilog description for cell state,
// Mon May 14 10:12:09 2018
//
// LeonardoSpectrum Level 3, 2017a.2
//


module state ( clk, rst, filter, accFinish, done, instr, start, stride,
               rowCounterRst, windCounterRst, doneCounterRst, pcInImageEnable,
               pcOutImageEnable, cacheRegEnable, rowCounterEnable, cacheWrite,
               enableA, enableP, rEnb, k, ramWrite, aluReset, aluStart, pcSrc,
               readFilter, rowCounterOut, windCounterOut, doneCounterOut ) ;

    input clk ;
    input rst ;
    input filter ;
    input accFinish ;
    input done ;
    input instr ;
    input start ;
    input [1:0]stride ;
    output rowCounterRst ;
    output windCounterRst ;
    output doneCounterRst ;
    output pcInImageEnable ;
    output pcOutImageEnable ;
    output cacheRegEnable ;
    output rowCounterEnable ;
    output cacheWrite ;
    output enableA ;
    output enableP ;
    output rEnb ;
    output k ;
    output ramWrite ;
    output aluReset ;
    output aluStart ;
    output pcSrc ;
    output readFilter ;
    input [2:0]rowCounterOut ;
    input [7:0]windCounterOut ;
    input [7:0]doneCounterOut ;

    wire state_6, NOT_clk, state_7, nx1028, nx4, nx6, nx18, nx22, nx28, nx32,
         state_4, state_8, state_2, nx44, nx50, nx54, nx58, nx68, nx74, nx78,
         nx84, nx98, nx130, nx140, nx156, nx164, nx176, state_3, nx192, nx204,
         nx212, state_0, nx1041, nx1049, nx1054, nx1058, nx1062, nx1065, nx1068,
         nx1079, nx1082, nx1085, nx1087, nx1096, nx1098, nx1101, nx1103, nx1106,
         nx1108, nx1110, nx1114, nx1116, nx1120, nx1122, nx1124, nx1131, nx1145,
         nx1151, nx1153;
    wire [4:0] \$dummy ;




    assign windCounterRst = rowCounterRst ;
    assign doneCounterRst = rowCounterRst ;
    assign cacheRegEnable = pcOutImageEnable ;
    assign rowCounterEnable = pcInImageEnable ;
    assign cacheWrite = pcInImageEnable ;
    assign ramWrite = pcOutImageEnable ;
    assign pcSrc = pcOutImageEnable ;
    assign readFilter = enableA ;
    nor03_2x ix231 (.Y (pcInImageEnable), .A0 (rowCounterRst), .A1 (state_7), .A2 (
             pcOutImageEnable)) ;
    or02 ix221 (.Y (rowCounterRst), .A0 (state_0), .A1 (state_6)) ;
    dffsr_ni reg_state_0 (.Q (state_0), .QB (\$dummy [0]), .D (state_0), .CLK (
             nx1145), .S (rst), .R (nx54)) ;
    inv01 ix1039 (.Y (NOT_clk), .A (clk)) ;
    nor02_2x ix55 (.Y (nx54), .A0 (rst), .A1 (nx1041)) ;
    nor02_2x ix1042 (.Y (nx1041), .A0 (start), .A1 (rst)) ;
    dffr reg_state_6 (.Q (state_6), .QB (\$dummy [1]), .D (nx212), .CLK (NOT_clk
         ), .R (nx6)) ;
    ao21 ix213 (.Y (nx212), .A0 (done), .A1 (pcOutImageEnable), .B0 (state_6)) ;
    and02 ix205 (.Y (nx204), .A0 (accFinish), .A1 (nx1028)) ;
    nand02 ix203 (.Y (nx1028), .A0 (nx1049), .A1 (nx1131)) ;
    oai21 ix1050 (.Y (nx1049), .A0 (state_3), .A1 (k), .B0 (nx1153)) ;
    dffr reg_state_3 (.Q (state_3), .QB (\$dummy [2]), .D (nx192), .CLK (NOT_clk
         ), .R (nx6)) ;
    ao32 ix193 (.Y (nx192), .A0 (nx32), .A1 (state_4), .A2 (nx1098), .B0 (
         state_3), .B1 (nx1087)) ;
    nor02_2x ix33 (.Y (nx32), .A0 (rowCounterOut[0]), .A1 (nx1054)) ;
    aoi21 ix1055 (.Y (nx1054), .A0 (filter), .A1 (nx22), .B0 (nx18)) ;
    nor02ii ix23 (.Y (nx22), .A0 (rowCounterOut[1]), .A1 (rowCounterOut[2])) ;
    nor03_2x ix19 (.Y (nx18), .A0 (filter), .A1 (nx1058), .A2 (rowCounterOut[2])
             ) ;
    inv01 ix1059 (.Y (nx1058), .A (rowCounterOut[1])) ;
    oai222 ix99 (.Y (nx98), .A0 (nx1062), .A1 (nx32), .B0 (nx1065), .B1 (nx1087)
           , .C0 (done), .C1 (nx1096)) ;
    dffr reg_state_4 (.Q (state_4), .QB (nx1062), .D (nx98), .CLK (nx1145), .R (
         nx6)) ;
    dffr reg_state_8 (.Q (state_8), .QB (nx1065), .D (nx84), .CLK (nx1145), .R (
         nx6)) ;
    oai22 ix85 (.Y (nx84), .A0 (nx1068), .A1 (nx1085), .B0 (nx1065), .B1 (nx1153
          )) ;
    ao22 ix69 (.Y (nx68), .A0 (enableA), .A1 (nx1153), .B0 (state_2), .B1 (
         nx1085)) ;
    dffsr_ni reg_state_1 (.Q (enableA), .QB (\$dummy [3]), .D (nx44), .CLK (
             nx1145), .S (nx58), .R (nx50)) ;
    nor02ii ix45 (.Y (nx44), .A0 (nx1153), .A1 (enableA)) ;
    nor02ii ix29 (.Y (nx28), .A0 (nx1054), .A1 (rowCounterOut[0])) ;
    nor03_2x ix59 (.Y (nx58), .A0 (instr), .A1 (nx1041), .A2 (rst)) ;
    ao21 ix51 (.Y (nx50), .A0 (instr), .A1 (start), .B0 (rst)) ;
    dffsr_ni reg_state_2 (.Q (state_2), .QB (nx1068), .D (nx68), .CLK (nx1145),
             .S (nx78), .R (nx74)) ;
    nor03_2x ix79 (.Y (nx78), .A0 (nx1079), .A1 (nx1041), .A2 (rst)) ;
    inv01 ix1080 (.Y (nx1079), .A (instr)) ;
    oai21 ix75 (.Y (nx74), .A0 (instr), .A1 (nx1041), .B0 (nx1082)) ;
    inv01 ix1084 (.Y (nx1082), .A (rst)) ;
    dffr reg_state_5 (.Q (pcOutImageEnable), .QB (nx1096), .D (nx204), .CLK (
         NOT_clk), .R (nx6)) ;
    nand04 ix1099 (.Y (nx1098), .A0 (windCounterOut[5]), .A1 (windCounterOut[3])
           , .A2 (windCounterOut[4]), .A3 (nx164)) ;
    nor02ii ix165 (.Y (nx164), .A0 (nx1101), .A1 (windCounterOut[6])) ;
    aoi43 ix1102 (.Y (nx1101), .A0 (windCounterOut[0]), .A1 (nx1103), .A2 (
          stride[0]), .A3 (nx130), .B0 (nx140), .B1 (windCounterOut[2]), .B2 (
          nx156)) ;
    inv01 ix1104 (.Y (nx1103), .A (stride[1])) ;
    aoi21 ix131 (.Y (nx130), .A0 (nx1106), .A1 (nx1110), .B0 (nx1116)) ;
    nand03 ix1107 (.Y (nx1106), .A0 (filter), .A1 (windCounterOut[1]), .A2 (
           nx1108)) ;
    inv01 ix1109 (.Y (nx1108), .A (windCounterOut[2])) ;
    inv01 ix1115 (.Y (nx1114), .A (windCounterOut[1])) ;
    inv01 ix1117 (.Y (nx1116), .A (windCounterOut[7])) ;
    nor03_2x ix141 (.Y (nx140), .A0 (windCounterOut[7]), .A1 (nx1103), .A2 (
             stride[0])) ;
    oai21 ix157 (.Y (nx156), .A0 (filter), .A1 (nx1120), .B0 (nx1124)) ;
    nand02 ix1121 (.Y (nx1120), .A0 (nx1122), .A1 (windCounterOut[1])) ;
    inv01 ix1123 (.Y (nx1122), .A (windCounterOut[0])) ;
    nand03 ix1125 (.Y (nx1124), .A0 (filter), .A1 (windCounterOut[0]), .A2 (
           nx1114)) ;
    dffr reg_state_9 (.Q (k), .QB (\$dummy [4]), .D (nx176), .CLK (NOT_clk), .R (
         nx6)) ;
    dffr reg_state_7 (.Q (state_7), .QB (nx1131), .D (nx4), .CLK (NOT_clk), .R (
         nx6)) ;
    nor02ii ix5 (.Y (nx4), .A0 (accFinish), .A1 (nx1028)) ;
    or02 ix237 (.Y (rEnb), .A0 (state_3), .A1 (state_8)) ;
    nor04 ix1138 (.Y (aluReset), .A0 (state_3), .A1 (state_4), .A2 (state_7), .A3 (
          k)) ;
    inv01 ix1086 (.Y (nx1085), .A (nx32)) ;
    inv01 ix1088 (.Y (nx1087), .A (nx28)) ;
    inv02 ix7 (.Y (nx6), .A (nx1041)) ;
    inv01 ix243 (.Y (aluStart), .A (aluReset)) ;
    inv01 ix1144 (.Y (nx1145), .A (clk)) ;
    or03 ix1111 (.Y (nx1110), .A0 (filter), .A1 (windCounterOut[1]), .A2 (nx1108
         )) ;
    oai32 ix177 (.Y (nx176), .A0 (nx1085), .A1 (nx1062), .A2 (nx1098), .B0 (
          nx1151), .B1 (nx1153)) ;
    inv01 ix1150 (.Y (nx1151), .A (k)) ;
    nand03 ix235 (.Y (enableP), .A0 (nx1096), .A1 (nx1065), .A2 (nx1068)) ;
    inv01 ix1152 (.Y (nx1153), .A (nx1087)) ;
endmodule





module select_9_9 ( a, b, d ) ;

    input [8:0]a ;
    input [8:0]b ;
    output d ;




endmodule
