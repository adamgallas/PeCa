// Generator : SpinalHDL v1.6.4    git head : 598c18959149eb18e5eee5b0aa3eef01ecaa41a1
// Component : PeCa

`timescale 1ns/1ps 

module PeCa (
  input      [7:0]    numberOfInputFrames,
  input      [7:0]    numberOfOutputFrames,
  input      [8:0]    width,
  input      [8:0]    height,
  input      [7:0]    inputZeroPoint,
  input      [7:0]    outputZeroPoint,
  input      [15:0]   scaleBase,
  input      [5:0]    scaleExpr,
  input               enablePooling,
  input               inputs_valid,
  output              inputs_ready,
  input      [31:0]   inputs_payload,
  input               weights_valid,
  output              weights_ready,
  input      [31:0]   weights_payload,
  input               funcTable_valid,
  output              funcTable_ready,
  input      [31:0]   funcTable_payload,
  output              outputs_valid,
  input               outputs_ready,
  output     [31:0]   outputs_payload,
  input               clk,
  input               reset
);

  wire       [0:0]    streamDemux_3_io_select;
  wire       [0:0]    streamMux_1_io_select;
  wire                weightFifo_0_push_ready;
  wire                weightFifo_0_pop_valid;
  wire       [7:0]    weightFifo_0_pop_payload_0_0_0_0;
  wire       [7:0]    weightFifo_0_pop_payload_0_0_0_1;
  wire       [7:0]    weightFifo_0_pop_payload_0_0_0_2;
  wire       [7:0]    weightFifo_0_pop_payload_0_0_0_3;
  wire       [7:0]    weightFifo_0_pop_payload_0_0_1_0;
  wire       [7:0]    weightFifo_0_pop_payload_0_0_1_1;
  wire       [7:0]    weightFifo_0_pop_payload_0_0_1_2;
  wire       [7:0]    weightFifo_0_pop_payload_0_0_1_3;
  wire       [7:0]    weightFifo_0_pop_payload_0_0_2_0;
  wire       [7:0]    weightFifo_0_pop_payload_0_0_2_1;
  wire       [7:0]    weightFifo_0_pop_payload_0_0_2_2;
  wire       [7:0]    weightFifo_0_pop_payload_0_0_2_3;
  wire       [7:0]    weightFifo_0_pop_payload_0_1_0_0;
  wire       [7:0]    weightFifo_0_pop_payload_0_1_0_1;
  wire       [7:0]    weightFifo_0_pop_payload_0_1_0_2;
  wire       [7:0]    weightFifo_0_pop_payload_0_1_0_3;
  wire       [7:0]    weightFifo_0_pop_payload_0_1_1_0;
  wire       [7:0]    weightFifo_0_pop_payload_0_1_1_1;
  wire       [7:0]    weightFifo_0_pop_payload_0_1_1_2;
  wire       [7:0]    weightFifo_0_pop_payload_0_1_1_3;
  wire       [7:0]    weightFifo_0_pop_payload_0_1_2_0;
  wire       [7:0]    weightFifo_0_pop_payload_0_1_2_1;
  wire       [7:0]    weightFifo_0_pop_payload_0_1_2_2;
  wire       [7:0]    weightFifo_0_pop_payload_0_1_2_3;
  wire       [7:0]    weightFifo_0_pop_payload_0_2_0_0;
  wire       [7:0]    weightFifo_0_pop_payload_0_2_0_1;
  wire       [7:0]    weightFifo_0_pop_payload_0_2_0_2;
  wire       [7:0]    weightFifo_0_pop_payload_0_2_0_3;
  wire       [7:0]    weightFifo_0_pop_payload_0_2_1_0;
  wire       [7:0]    weightFifo_0_pop_payload_0_2_1_1;
  wire       [7:0]    weightFifo_0_pop_payload_0_2_1_2;
  wire       [7:0]    weightFifo_0_pop_payload_0_2_1_3;
  wire       [7:0]    weightFifo_0_pop_payload_0_2_2_0;
  wire       [7:0]    weightFifo_0_pop_payload_0_2_2_1;
  wire       [7:0]    weightFifo_0_pop_payload_0_2_2_2;
  wire       [7:0]    weightFifo_0_pop_payload_0_2_2_3;
  wire       [7:0]    weightFifo_0_pop_payload_1_0_0_0;
  wire       [7:0]    weightFifo_0_pop_payload_1_0_0_1;
  wire       [7:0]    weightFifo_0_pop_payload_1_0_0_2;
  wire       [7:0]    weightFifo_0_pop_payload_1_0_0_3;
  wire       [7:0]    weightFifo_0_pop_payload_1_0_1_0;
  wire       [7:0]    weightFifo_0_pop_payload_1_0_1_1;
  wire       [7:0]    weightFifo_0_pop_payload_1_0_1_2;
  wire       [7:0]    weightFifo_0_pop_payload_1_0_1_3;
  wire       [7:0]    weightFifo_0_pop_payload_1_0_2_0;
  wire       [7:0]    weightFifo_0_pop_payload_1_0_2_1;
  wire       [7:0]    weightFifo_0_pop_payload_1_0_2_2;
  wire       [7:0]    weightFifo_0_pop_payload_1_0_2_3;
  wire       [7:0]    weightFifo_0_pop_payload_1_1_0_0;
  wire       [7:0]    weightFifo_0_pop_payload_1_1_0_1;
  wire       [7:0]    weightFifo_0_pop_payload_1_1_0_2;
  wire       [7:0]    weightFifo_0_pop_payload_1_1_0_3;
  wire       [7:0]    weightFifo_0_pop_payload_1_1_1_0;
  wire       [7:0]    weightFifo_0_pop_payload_1_1_1_1;
  wire       [7:0]    weightFifo_0_pop_payload_1_1_1_2;
  wire       [7:0]    weightFifo_0_pop_payload_1_1_1_3;
  wire       [7:0]    weightFifo_0_pop_payload_1_1_2_0;
  wire       [7:0]    weightFifo_0_pop_payload_1_1_2_1;
  wire       [7:0]    weightFifo_0_pop_payload_1_1_2_2;
  wire       [7:0]    weightFifo_0_pop_payload_1_1_2_3;
  wire       [7:0]    weightFifo_0_pop_payload_1_2_0_0;
  wire       [7:0]    weightFifo_0_pop_payload_1_2_0_1;
  wire       [7:0]    weightFifo_0_pop_payload_1_2_0_2;
  wire       [7:0]    weightFifo_0_pop_payload_1_2_0_3;
  wire       [7:0]    weightFifo_0_pop_payload_1_2_1_0;
  wire       [7:0]    weightFifo_0_pop_payload_1_2_1_1;
  wire       [7:0]    weightFifo_0_pop_payload_1_2_1_2;
  wire       [7:0]    weightFifo_0_pop_payload_1_2_1_3;
  wire       [7:0]    weightFifo_0_pop_payload_1_2_2_0;
  wire       [7:0]    weightFifo_0_pop_payload_1_2_2_1;
  wire       [7:0]    weightFifo_0_pop_payload_1_2_2_2;
  wire       [7:0]    weightFifo_0_pop_payload_1_2_2_3;
  wire                weightFifo_1_push_ready;
  wire                weightFifo_1_pop_valid;
  wire       [7:0]    weightFifo_1_pop_payload_0_0_0_0;
  wire       [7:0]    weightFifo_1_pop_payload_0_0_0_1;
  wire       [7:0]    weightFifo_1_pop_payload_0_0_0_2;
  wire       [7:0]    weightFifo_1_pop_payload_0_0_0_3;
  wire       [7:0]    weightFifo_1_pop_payload_0_0_1_0;
  wire       [7:0]    weightFifo_1_pop_payload_0_0_1_1;
  wire       [7:0]    weightFifo_1_pop_payload_0_0_1_2;
  wire       [7:0]    weightFifo_1_pop_payload_0_0_1_3;
  wire       [7:0]    weightFifo_1_pop_payload_0_0_2_0;
  wire       [7:0]    weightFifo_1_pop_payload_0_0_2_1;
  wire       [7:0]    weightFifo_1_pop_payload_0_0_2_2;
  wire       [7:0]    weightFifo_1_pop_payload_0_0_2_3;
  wire       [7:0]    weightFifo_1_pop_payload_0_1_0_0;
  wire       [7:0]    weightFifo_1_pop_payload_0_1_0_1;
  wire       [7:0]    weightFifo_1_pop_payload_0_1_0_2;
  wire       [7:0]    weightFifo_1_pop_payload_0_1_0_3;
  wire       [7:0]    weightFifo_1_pop_payload_0_1_1_0;
  wire       [7:0]    weightFifo_1_pop_payload_0_1_1_1;
  wire       [7:0]    weightFifo_1_pop_payload_0_1_1_2;
  wire       [7:0]    weightFifo_1_pop_payload_0_1_1_3;
  wire       [7:0]    weightFifo_1_pop_payload_0_1_2_0;
  wire       [7:0]    weightFifo_1_pop_payload_0_1_2_1;
  wire       [7:0]    weightFifo_1_pop_payload_0_1_2_2;
  wire       [7:0]    weightFifo_1_pop_payload_0_1_2_3;
  wire       [7:0]    weightFifo_1_pop_payload_0_2_0_0;
  wire       [7:0]    weightFifo_1_pop_payload_0_2_0_1;
  wire       [7:0]    weightFifo_1_pop_payload_0_2_0_2;
  wire       [7:0]    weightFifo_1_pop_payload_0_2_0_3;
  wire       [7:0]    weightFifo_1_pop_payload_0_2_1_0;
  wire       [7:0]    weightFifo_1_pop_payload_0_2_1_1;
  wire       [7:0]    weightFifo_1_pop_payload_0_2_1_2;
  wire       [7:0]    weightFifo_1_pop_payload_0_2_1_3;
  wire       [7:0]    weightFifo_1_pop_payload_0_2_2_0;
  wire       [7:0]    weightFifo_1_pop_payload_0_2_2_1;
  wire       [7:0]    weightFifo_1_pop_payload_0_2_2_2;
  wire       [7:0]    weightFifo_1_pop_payload_0_2_2_3;
  wire       [7:0]    weightFifo_1_pop_payload_1_0_0_0;
  wire       [7:0]    weightFifo_1_pop_payload_1_0_0_1;
  wire       [7:0]    weightFifo_1_pop_payload_1_0_0_2;
  wire       [7:0]    weightFifo_1_pop_payload_1_0_0_3;
  wire       [7:0]    weightFifo_1_pop_payload_1_0_1_0;
  wire       [7:0]    weightFifo_1_pop_payload_1_0_1_1;
  wire       [7:0]    weightFifo_1_pop_payload_1_0_1_2;
  wire       [7:0]    weightFifo_1_pop_payload_1_0_1_3;
  wire       [7:0]    weightFifo_1_pop_payload_1_0_2_0;
  wire       [7:0]    weightFifo_1_pop_payload_1_0_2_1;
  wire       [7:0]    weightFifo_1_pop_payload_1_0_2_2;
  wire       [7:0]    weightFifo_1_pop_payload_1_0_2_3;
  wire       [7:0]    weightFifo_1_pop_payload_1_1_0_0;
  wire       [7:0]    weightFifo_1_pop_payload_1_1_0_1;
  wire       [7:0]    weightFifo_1_pop_payload_1_1_0_2;
  wire       [7:0]    weightFifo_1_pop_payload_1_1_0_3;
  wire       [7:0]    weightFifo_1_pop_payload_1_1_1_0;
  wire       [7:0]    weightFifo_1_pop_payload_1_1_1_1;
  wire       [7:0]    weightFifo_1_pop_payload_1_1_1_2;
  wire       [7:0]    weightFifo_1_pop_payload_1_1_1_3;
  wire       [7:0]    weightFifo_1_pop_payload_1_1_2_0;
  wire       [7:0]    weightFifo_1_pop_payload_1_1_2_1;
  wire       [7:0]    weightFifo_1_pop_payload_1_1_2_2;
  wire       [7:0]    weightFifo_1_pop_payload_1_1_2_3;
  wire       [7:0]    weightFifo_1_pop_payload_1_2_0_0;
  wire       [7:0]    weightFifo_1_pop_payload_1_2_0_1;
  wire       [7:0]    weightFifo_1_pop_payload_1_2_0_2;
  wire       [7:0]    weightFifo_1_pop_payload_1_2_0_3;
  wire       [7:0]    weightFifo_1_pop_payload_1_2_1_0;
  wire       [7:0]    weightFifo_1_pop_payload_1_2_1_1;
  wire       [7:0]    weightFifo_1_pop_payload_1_2_1_2;
  wire       [7:0]    weightFifo_1_pop_payload_1_2_1_3;
  wire       [7:0]    weightFifo_1_pop_payload_1_2_2_0;
  wire       [7:0]    weightFifo_1_pop_payload_1_2_2_1;
  wire       [7:0]    weightFifo_1_pop_payload_1_2_2_2;
  wire       [7:0]    weightFifo_1_pop_payload_1_2_2_3;
  wire                window_videoIn_ready;
  wire                window_videoOut_valid;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_0_0;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_0_1;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_0_2;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_0_3;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_1_0;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_1_1;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_1_2;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_1_3;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_2_0;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_2_1;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_2_2;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_2_3;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_0_0;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_0_1;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_0_2;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_0_3;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_1_0;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_1_1;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_1_2;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_1_3;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_2_0;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_2_1;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_2_2;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_2_3;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_2_0_0;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_2_0_1;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_2_0_2;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_2_0_3;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_2_1_0;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_2_1_1;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_2_1_2;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_2_1_3;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_2_2_0;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_2_2_1;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_2_2_2;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_2_2_3;
  wire                window_videoOut_payload_frame_line_endOfLine;
  wire                window_videoOut_payload_frame_endOfFrame;
  wire                window_videoOut_payload_endOfPack;
  wire                window_videoOut_fork_io_input_ready;
  wire                window_videoOut_fork_io_outputs_0_valid;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_0_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_0_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_0_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_0_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_1_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_1_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_1_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_1_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_2_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_2_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_2_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_2_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_0_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_0_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_0_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_0_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_1_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_1_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_1_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_1_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_2_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_2_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_2_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_2_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_0_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_0_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_0_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_0_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_1_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_1_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_1_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_1_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_2_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_2_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_2_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_2_3;
  wire                window_videoOut_fork_io_outputs_0_payload_frame_line_endOfLine;
  wire                window_videoOut_fork_io_outputs_0_payload_frame_endOfFrame;
  wire                window_videoOut_fork_io_outputs_0_payload_endOfPack;
  wire                window_videoOut_fork_io_outputs_1_valid;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_0_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_0_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_0_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_0_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_1_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_1_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_1_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_1_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_2_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_2_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_2_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_2_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_0_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_0_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_0_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_0_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_1_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_1_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_1_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_1_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_2_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_2_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_2_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_2_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_0_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_0_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_0_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_0_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_1_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_1_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_1_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_1_3;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_2_0;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_2_1;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_2_2;
  wire       [7:0]    window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_2_3;
  wire                window_videoOut_fork_io_outputs_1_payload_frame_line_endOfLine;
  wire                window_videoOut_fork_io_outputs_1_payload_frame_endOfFrame;
  wire                window_videoOut_fork_io_outputs_1_payload_endOfPack;
  wire                unit_0_inputs_ready;
  wire                unit_0_weights_ready;
  wire                unit_0_outputs_valid;
  wire       [23:0]   unit_0_outputs_payload_frame_line_pixel_0;
  wire       [23:0]   unit_0_outputs_payload_frame_line_pixel_1;
  wire                unit_0_outputs_payload_frame_line_endOfLine;
  wire                unit_0_outputs_payload_frame_endOfFrame;
  wire                unit_0_outputs_payload_endOfPack;
  wire                unit_1_inputs_ready;
  wire                unit_1_weights_ready;
  wire                unit_1_outputs_valid;
  wire       [23:0]   unit_1_outputs_payload_frame_line_pixel_0;
  wire       [23:0]   unit_1_outputs_payload_frame_line_pixel_1;
  wire                unit_1_outputs_payload_frame_line_endOfLine;
  wire                unit_1_outputs_payload_frame_endOfFrame;
  wire                unit_1_outputs_payload_endOfPack;
  wire                pool_videoIn_ready;
  wire                pool_videoOut_valid;
  wire       [7:0]    pool_videoOut_payload_frame_line_pixel_0;
  wire       [7:0]    pool_videoOut_payload_frame_line_pixel_1;
  wire       [7:0]    pool_videoOut_payload_frame_line_pixel_2;
  wire       [7:0]    pool_videoOut_payload_frame_line_pixel_3;
  wire                pool_videoOut_payload_frame_line_endOfLine;
  wire                pool_videoOut_payload_frame_endOfFrame;
  wire                pool_videoOut_payload_endOfPack;
  wire                table_1_newTable_ready;
  wire                table_1_index_ready;
  wire                table_1_value_valid;
  wire       [7:0]    table_1_value_payload_0;
  wire       [7:0]    table_1_value_payload_1;
  wire       [7:0]    table_1_value_payload_2;
  wire       [7:0]    table_1_value_payload_3;
  wire                streamDemux_2_io_input_ready;
  wire                streamDemux_2_io_outputs_0_valid;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_0_0_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_0_0_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_0_0_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_0_0_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_0_1_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_0_1_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_0_1_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_0_1_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_0_2_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_0_2_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_0_2_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_0_2_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_1_0_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_1_0_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_1_0_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_1_0_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_1_1_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_1_1_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_1_1_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_1_1_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_1_2_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_1_2_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_1_2_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_1_2_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_2_0_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_2_0_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_2_0_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_2_0_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_2_1_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_2_1_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_2_1_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_2_1_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_2_2_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_2_2_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_2_2_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_0_2_2_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_0_0_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_0_0_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_0_0_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_0_0_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_0_1_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_0_1_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_0_1_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_0_1_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_0_2_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_0_2_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_0_2_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_0_2_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_1_0_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_1_0_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_1_0_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_1_0_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_1_1_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_1_1_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_1_1_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_1_1_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_1_2_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_1_2_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_1_2_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_1_2_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_2_0_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_2_0_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_2_0_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_2_0_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_2_1_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_2_1_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_2_1_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_2_1_3;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_2_2_0;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_2_2_1;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_2_2_2;
  wire       [7:0]    streamDemux_2_io_outputs_0_payload_1_2_2_3;
  wire                streamDemux_2_io_outputs_1_valid;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_0_0_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_0_0_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_0_0_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_0_0_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_0_1_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_0_1_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_0_1_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_0_1_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_0_2_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_0_2_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_0_2_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_0_2_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_1_0_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_1_0_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_1_0_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_1_0_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_1_1_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_1_1_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_1_1_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_1_1_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_1_2_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_1_2_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_1_2_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_1_2_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_2_0_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_2_0_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_2_0_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_2_0_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_2_1_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_2_1_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_2_1_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_2_1_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_2_2_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_2_2_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_2_2_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_0_2_2_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_0_0_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_0_0_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_0_0_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_0_0_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_0_1_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_0_1_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_0_1_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_0_1_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_0_2_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_0_2_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_0_2_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_0_2_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_1_0_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_1_0_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_1_0_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_1_0_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_1_1_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_1_1_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_1_1_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_1_1_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_1_2_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_1_2_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_1_2_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_1_2_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_2_0_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_2_0_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_2_0_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_2_0_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_2_1_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_2_1_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_2_1_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_2_1_3;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_2_2_0;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_2_2_1;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_2_2_2;
  wire       [7:0]    streamDemux_2_io_outputs_1_payload_1_2_2_3;
  wire                eventM2sPipes_3_eventIn_ready;
  wire                eventM2sPipes_3_eventOut_valid;
  wire                eventM2sPipes_3_CEs_0;
  wire                eventM2sPipes_3_CEs_1;
  wire                eventM2sPipes_3_CEs_2;
  wire                eventM2sPipes_3_CEs_3;
  wire                eventM2sPipes_3_CEs_4;
  wire                eventM2sPipes_3_CEs_5;
  wire       [7:0]    scalerINT16_4_dout;
  wire       [7:0]    scalerINT16_5_dout;
  wire       [7:0]    scalerINT16_6_dout;
  wire       [7:0]    scalerINT16_7_dout;
  wire                streamDemux_3_io_input_ready;
  wire                streamDemux_3_io_outputs_0_valid;
  wire       [7:0]    streamDemux_3_io_outputs_0_payload_frame_line_pixel_0;
  wire       [7:0]    streamDemux_3_io_outputs_0_payload_frame_line_pixel_1;
  wire       [7:0]    streamDemux_3_io_outputs_0_payload_frame_line_pixel_2;
  wire       [7:0]    streamDemux_3_io_outputs_0_payload_frame_line_pixel_3;
  wire                streamDemux_3_io_outputs_0_payload_frame_line_endOfLine;
  wire                streamDemux_3_io_outputs_0_payload_frame_endOfFrame;
  wire                streamDemux_3_io_outputs_0_payload_endOfPack;
  wire                streamDemux_3_io_outputs_1_valid;
  wire       [7:0]    streamDemux_3_io_outputs_1_payload_frame_line_pixel_0;
  wire       [7:0]    streamDemux_3_io_outputs_1_payload_frame_line_pixel_1;
  wire       [7:0]    streamDemux_3_io_outputs_1_payload_frame_line_pixel_2;
  wire       [7:0]    streamDemux_3_io_outputs_1_payload_frame_line_pixel_3;
  wire                streamDemux_3_io_outputs_1_payload_frame_line_endOfLine;
  wire                streamDemux_3_io_outputs_1_payload_frame_endOfFrame;
  wire                streamDemux_3_io_outputs_1_payload_endOfPack;
  wire                streamMux_1_io_inputs_0_ready;
  wire                streamMux_1_io_inputs_1_ready;
  wire                streamMux_1_io_output_valid;
  wire       [7:0]    streamMux_1_io_output_payload_frame_line_pixel_0;
  wire       [7:0]    streamMux_1_io_output_payload_frame_line_pixel_1;
  wire       [7:0]    streamMux_1_io_output_payload_frame_line_pixel_2;
  wire       [7:0]    streamMux_1_io_output_payload_frame_line_pixel_3;
  wire                streamMux_1_io_output_payload_frame_line_endOfLine;
  wire                streamMux_1_io_output_payload_frame_endOfFrame;
  wire                streamMux_1_io_output_payload_endOfPack;
  wire       [8:0]    tmp_tmp_when_Utils_l503_3;
  wire       [0:0]    tmp_tmp_when_Utils_l503_3_1;
  wire       [8:0]    tmp_tmp_when_Utils_l503_6;
  wire       [0:0]    tmp_tmp_when_Utils_l503_6_1;
  wire       [7:0]    tmp_tmp_inputVideo_payload_endOfPack_1;
  wire       [0:0]    tmp_tmp_inputVideo_payload_endOfPack_1_1;
  wire       [4:0]    tmp_tmp_weights_ready_1;
  wire       [0:0]    tmp_tmp_weights_ready_1_1;
  wire       [511:0]  tmp_tmp_weightsAdapted_payload_0_0_0_0;
  wire       [1:0]    tmp_tmp_funcTable_ready_1;
  wire       [0:0]    tmp_tmp_funcTable_ready_1_1;
  reg        [7:0]    tmp_tableAdapted_payload_1;
  wire                inputChannelSpilt_valid;
  wire                inputChannelSpilt_ready;
  wire       [7:0]    inputChannelSpilt_payload_0;
  wire       [7:0]    inputChannelSpilt_payload_1;
  wire       [7:0]    inputChannelSpilt_payload_2;
  wire       [7:0]    inputChannelSpilt_payload_3;
  wire       [31:0]   tmp_inputChannelSpilt_payload_0;
  wire                inputChannelSpilt_translated_valid;
  reg                 inputChannelSpilt_translated_ready;
  wire       [7:0]    inputChannelSpilt_translated_payload_0;
  wire       [7:0]    inputChannelSpilt_translated_payload_1;
  wire       [7:0]    inputChannelSpilt_translated_payload_2;
  wire       [7:0]    inputChannelSpilt_translated_payload_3;
  wire                inputChannelSpilt_translated_m2sPipe_valid;
  wire                inputChannelSpilt_translated_m2sPipe_ready;
  wire       [7:0]    inputChannelSpilt_translated_m2sPipe_payload_0;
  wire       [7:0]    inputChannelSpilt_translated_m2sPipe_payload_1;
  wire       [7:0]    inputChannelSpilt_translated_m2sPipe_payload_2;
  wire       [7:0]    inputChannelSpilt_translated_m2sPipe_payload_3;
  reg                 inputChannelSpilt_translated_rValid;
  reg        [7:0]    inputChannelSpilt_translated_rData_0;
  reg        [7:0]    inputChannelSpilt_translated_rData_1;
  reg        [7:0]    inputChannelSpilt_translated_rData_2;
  reg        [7:0]    inputChannelSpilt_translated_rData_3;
  wire                when_Stream_l342;
  wire                inputChannelSpilt_translated_m2sPipe_fire;
  wire                tmp_when_Utils_l503;
  wire                tmp_when_Utils_l503_1;
  reg                 tmp_when_Utils_l503_2;
  reg        [8:0]    tmp_when_Utils_l503_3;
  reg        [8:0]    tmp_when_Utils_l503_4;
  wire                when_Utils_l503;
  reg                 tmp_when_Utils_l503_5;
  reg        [8:0]    tmp_when_Utils_l503_6;
  reg        [8:0]    tmp_when_Utils_l503_7;
  wire                when_Utils_l503_1;
  reg                 tmp_inputVideo_payload_endOfPack;
  reg        [7:0]    tmp_inputVideo_payload_endOfPack_1;
  reg        [7:0]    tmp_inputVideo_payload_endOfPack_2;
  wire                inputVideo_valid;
  wire                inputVideo_ready;
  wire       [7:0]    inputVideo_payload_frame_line_pixel_0;
  wire       [7:0]    inputVideo_payload_frame_line_pixel_1;
  wire       [7:0]    inputVideo_payload_frame_line_pixel_2;
  wire       [7:0]    inputVideo_payload_frame_line_pixel_3;
  wire                inputVideo_payload_frame_line_endOfLine;
  wire                inputVideo_payload_frame_endOfFrame;
  wire                inputVideo_payload_endOfPack;
  wire                weightsAdapted_valid;
  wire                weightsAdapted_ready;
  wire       [7:0]    weightsAdapted_payload_0_0_0_0;
  wire       [7:0]    weightsAdapted_payload_0_0_0_1;
  wire       [7:0]    weightsAdapted_payload_0_0_0_2;
  wire       [7:0]    weightsAdapted_payload_0_0_0_3;
  wire       [7:0]    weightsAdapted_payload_0_0_1_0;
  wire       [7:0]    weightsAdapted_payload_0_0_1_1;
  wire       [7:0]    weightsAdapted_payload_0_0_1_2;
  wire       [7:0]    weightsAdapted_payload_0_0_1_3;
  wire       [7:0]    weightsAdapted_payload_0_0_2_0;
  wire       [7:0]    weightsAdapted_payload_0_0_2_1;
  wire       [7:0]    weightsAdapted_payload_0_0_2_2;
  wire       [7:0]    weightsAdapted_payload_0_0_2_3;
  wire       [7:0]    weightsAdapted_payload_0_1_0_0;
  wire       [7:0]    weightsAdapted_payload_0_1_0_1;
  wire       [7:0]    weightsAdapted_payload_0_1_0_2;
  wire       [7:0]    weightsAdapted_payload_0_1_0_3;
  wire       [7:0]    weightsAdapted_payload_0_1_1_0;
  wire       [7:0]    weightsAdapted_payload_0_1_1_1;
  wire       [7:0]    weightsAdapted_payload_0_1_1_2;
  wire       [7:0]    weightsAdapted_payload_0_1_1_3;
  wire       [7:0]    weightsAdapted_payload_0_1_2_0;
  wire       [7:0]    weightsAdapted_payload_0_1_2_1;
  wire       [7:0]    weightsAdapted_payload_0_1_2_2;
  wire       [7:0]    weightsAdapted_payload_0_1_2_3;
  wire       [7:0]    weightsAdapted_payload_0_2_0_0;
  wire       [7:0]    weightsAdapted_payload_0_2_0_1;
  wire       [7:0]    weightsAdapted_payload_0_2_0_2;
  wire       [7:0]    weightsAdapted_payload_0_2_0_3;
  wire       [7:0]    weightsAdapted_payload_0_2_1_0;
  wire       [7:0]    weightsAdapted_payload_0_2_1_1;
  wire       [7:0]    weightsAdapted_payload_0_2_1_2;
  wire       [7:0]    weightsAdapted_payload_0_2_1_3;
  wire       [7:0]    weightsAdapted_payload_0_2_2_0;
  wire       [7:0]    weightsAdapted_payload_0_2_2_1;
  wire       [7:0]    weightsAdapted_payload_0_2_2_2;
  wire       [7:0]    weightsAdapted_payload_0_2_2_3;
  wire       [7:0]    weightsAdapted_payload_1_0_0_0;
  wire       [7:0]    weightsAdapted_payload_1_0_0_1;
  wire       [7:0]    weightsAdapted_payload_1_0_0_2;
  wire       [7:0]    weightsAdapted_payload_1_0_0_3;
  wire       [7:0]    weightsAdapted_payload_1_0_1_0;
  wire       [7:0]    weightsAdapted_payload_1_0_1_1;
  wire       [7:0]    weightsAdapted_payload_1_0_1_2;
  wire       [7:0]    weightsAdapted_payload_1_0_1_3;
  wire       [7:0]    weightsAdapted_payload_1_0_2_0;
  wire       [7:0]    weightsAdapted_payload_1_0_2_1;
  wire       [7:0]    weightsAdapted_payload_1_0_2_2;
  wire       [7:0]    weightsAdapted_payload_1_0_2_3;
  wire       [7:0]    weightsAdapted_payload_1_1_0_0;
  wire       [7:0]    weightsAdapted_payload_1_1_0_1;
  wire       [7:0]    weightsAdapted_payload_1_1_0_2;
  wire       [7:0]    weightsAdapted_payload_1_1_0_3;
  wire       [7:0]    weightsAdapted_payload_1_1_1_0;
  wire       [7:0]    weightsAdapted_payload_1_1_1_1;
  wire       [7:0]    weightsAdapted_payload_1_1_1_2;
  wire       [7:0]    weightsAdapted_payload_1_1_1_3;
  wire       [7:0]    weightsAdapted_payload_1_1_2_0;
  wire       [7:0]    weightsAdapted_payload_1_1_2_1;
  wire       [7:0]    weightsAdapted_payload_1_1_2_2;
  wire       [7:0]    weightsAdapted_payload_1_1_2_3;
  wire       [7:0]    weightsAdapted_payload_1_2_0_0;
  wire       [7:0]    weightsAdapted_payload_1_2_0_1;
  wire       [7:0]    weightsAdapted_payload_1_2_0_2;
  wire       [7:0]    weightsAdapted_payload_1_2_0_3;
  wire       [7:0]    weightsAdapted_payload_1_2_1_0;
  wire       [7:0]    weightsAdapted_payload_1_2_1_1;
  wire       [7:0]    weightsAdapted_payload_1_2_1_2;
  wire       [7:0]    weightsAdapted_payload_1_2_1_3;
  wire       [7:0]    weightsAdapted_payload_1_2_2_0;
  wire       [7:0]    weightsAdapted_payload_1_2_2_1;
  wire       [7:0]    weightsAdapted_payload_1_2_2_2;
  wire       [7:0]    weightsAdapted_payload_1_2_2_3;
  reg                 tmp_io_select;
  reg        [0:0]    tmp_io_select_1;
  reg        [0:0]    tmp_io_select_2;
  wire                weightsAdapted_fire;
  wire                weights_fire;
  reg                 tmp_weights_ready;
  reg        [4:0]    tmp_weights_ready_1;
  reg        [4:0]    tmp_weights_ready_2;
  wire                tmp_weights_ready_3;
  wire                tmp_1;
  reg        [543:0]  tmp_weightsAdapted_payload_0_0_0_0;
  wire                weights_fire_1;
  wire       [575:0]  tmp_weightsAdapted_payload_0_0_0_0_1;
  wire       [287:0]  tmp_weightsAdapted_payload_0_0_0_0_2;
  wire       [95:0]   tmp_weightsAdapted_payload_0_0_0_0_3;
  wire       [31:0]   tmp_weightsAdapted_payload_0_0_0_0_4;
  wire       [31:0]   tmp_weightsAdapted_payload_0_0_1_0;
  wire       [31:0]   tmp_weightsAdapted_payload_0_0_2_0;
  wire       [95:0]   tmp_weightsAdapted_payload_0_1_0_0;
  wire       [31:0]   tmp_weightsAdapted_payload_0_1_0_0_1;
  wire       [31:0]   tmp_weightsAdapted_payload_0_1_1_0;
  wire       [31:0]   tmp_weightsAdapted_payload_0_1_2_0;
  wire       [95:0]   tmp_weightsAdapted_payload_0_2_0_0;
  wire       [31:0]   tmp_weightsAdapted_payload_0_2_0_0_1;
  wire       [31:0]   tmp_weightsAdapted_payload_0_2_1_0;
  wire       [31:0]   tmp_weightsAdapted_payload_0_2_2_0;
  wire       [287:0]  tmp_weightsAdapted_payload_1_0_0_0;
  wire       [95:0]   tmp_weightsAdapted_payload_1_0_0_0_1;
  wire       [31:0]   tmp_weightsAdapted_payload_1_0_0_0_2;
  wire       [31:0]   tmp_weightsAdapted_payload_1_0_1_0;
  wire       [31:0]   tmp_weightsAdapted_payload_1_0_2_0;
  wire       [95:0]   tmp_weightsAdapted_payload_1_1_0_0;
  wire       [31:0]   tmp_weightsAdapted_payload_1_1_0_0_1;
  wire       [31:0]   tmp_weightsAdapted_payload_1_1_1_0;
  wire       [31:0]   tmp_weightsAdapted_payload_1_1_2_0;
  wire       [95:0]   tmp_weightsAdapted_payload_1_2_0_0;
  wire       [31:0]   tmp_weightsAdapted_payload_1_2_0_0_1;
  wire       [31:0]   tmp_weightsAdapted_payload_1_2_1_0;
  wire       [31:0]   tmp_weightsAdapted_payload_1_2_2_0;
  wire                accOutputs_0_valid;
  wire                accOutputs_0_ready;
  wire       [23:0]   accOutputs_0_payload_frame_line_pixel_0;
  wire       [23:0]   accOutputs_0_payload_frame_line_pixel_1;
  wire                accOutputs_0_payload_frame_line_endOfLine;
  wire                accOutputs_0_payload_frame_endOfFrame;
  wire                accOutputs_0_payload_endOfPack;
  wire                accOutputs_1_valid;
  wire                accOutputs_1_ready;
  wire       [23:0]   accOutputs_1_payload_frame_line_pixel_0;
  wire       [23:0]   accOutputs_1_payload_frame_line_pixel_1;
  wire                accOutputs_1_payload_frame_line_endOfLine;
  wire                accOutputs_1_payload_frame_endOfFrame;
  wire                accOutputs_1_payload_endOfPack;
  wire                accOutputsJoin_valid;
  wire                accOutputsJoin_ready;
  wire       [23:0]   accOutputsJoin_payload_frame_line_pixel_0;
  wire       [23:0]   accOutputsJoin_payload_frame_line_pixel_1;
  wire       [23:0]   accOutputsJoin_payload_frame_line_pixel_2;
  wire       [23:0]   accOutputsJoin_payload_frame_line_pixel_3;
  wire                accOutputsJoin_payload_frame_line_endOfLine;
  wire                accOutputsJoin_payload_frame_endOfFrame;
  wire                accOutputsJoin_payload_endOfPack;
  wire                tmp_accOutputs_0_ready;
  wire                tmp_accOutputs_0_ready_1;
  wire       [95:0]   tmp_accOutputsJoin_payload_frame_line_pixel_0;
  wire                postProcessOutputs_valid;
  wire                postProcessOutputs_ready;
  wire       [7:0]    postProcessOutputs_payload_frame_line_pixel_0;
  wire       [7:0]    postProcessOutputs_payload_frame_line_pixel_1;
  wire       [7:0]    postProcessOutputs_payload_frame_line_pixel_2;
  wire       [7:0]    postProcessOutputs_payload_frame_line_pixel_3;
  wire                postProcessOutputs_payload_frame_line_endOfLine;
  wire                postProcessOutputs_payload_frame_endOfFrame;
  wire                postProcessOutputs_payload_endOfPack;
  reg                 tmp_postProcessOutputs_payload_frame_line_endOfLine;
  reg                 tmp_postProcessOutputs_payload_frame_endOfFrame;
  reg                 tmp_postProcessOutputs_payload_endOfPack;
  reg                 tmp_postProcessOutputs_payload_frame_line_endOfLine_1;
  reg                 tmp_postProcessOutputs_payload_frame_endOfFrame_1;
  reg                 tmp_postProcessOutputs_payload_endOfPack_1;
  reg                 tmp_postProcessOutputs_payload_frame_line_endOfLine_2;
  reg                 tmp_postProcessOutputs_payload_frame_endOfFrame_2;
  reg                 tmp_postProcessOutputs_payload_endOfPack_2;
  reg                 tmp_postProcessOutputs_payload_frame_line_endOfLine_3;
  reg                 tmp_postProcessOutputs_payload_frame_endOfFrame_3;
  reg                 tmp_postProcessOutputs_payload_endOfPack_3;
  reg                 tmp_postProcessOutputs_payload_frame_line_endOfLine_4;
  reg                 tmp_postProcessOutputs_payload_frame_endOfFrame_4;
  reg                 tmp_postProcessOutputs_payload_endOfPack_4;
  reg                 tmp_postProcessOutputs_payload_frame_line_endOfLine_5;
  reg                 tmp_postProcessOutputs_payload_frame_endOfFrame_5;
  reg                 tmp_postProcessOutputs_payload_endOfPack_5;
  wire                tableAdapted_valid;
  wire                tableAdapted_ready;
  wire       [7:0]    tableAdapted_payload;
  wire                streamMux_1_io_output_translated_valid;
  wire                streamMux_1_io_output_translated_ready;
  wire       [7:0]    streamMux_1_io_output_translated_payload_0;
  wire       [7:0]    streamMux_1_io_output_translated_payload_1;
  wire       [7:0]    streamMux_1_io_output_translated_payload_2;
  wire       [7:0]    streamMux_1_io_output_translated_payload_3;
  wire                signalTrim_valid;
  wire                signalTrim_ready;
  wire       [7:0]    signalTrim_payload_0;
  wire       [7:0]    signalTrim_payload_1;
  wire       [7:0]    signalTrim_payload_2;
  wire       [7:0]    signalTrim_payload_3;
  wire       [31:0]   tmp_signalTrim_payload_0;
  wire                tableAdapted_fire;
  reg                 tmp_funcTable_ready;
  reg        [1:0]    tmp_funcTable_ready_1;
  reg        [1:0]    tmp_funcTable_ready_2;
  wire                tmp_funcTable_ready_3;
  wire       [31:0]   tmp_tableAdapted_payload;
  wire                table_1_value_transmuted_valid;
  wire                table_1_value_transmuted_ready;
  wire       [31:0]   table_1_value_transmuted_payload;

  assign tmp_tmp_when_Utils_l503_3_1 = tmp_when_Utils_l503_2;
  assign tmp_tmp_when_Utils_l503_3 = {8'd0, tmp_tmp_when_Utils_l503_3_1};
  assign tmp_tmp_when_Utils_l503_6_1 = tmp_when_Utils_l503_5;
  assign tmp_tmp_when_Utils_l503_6 = {8'd0, tmp_tmp_when_Utils_l503_6_1};
  assign tmp_tmp_inputVideo_payload_endOfPack_1_1 = tmp_inputVideo_payload_endOfPack;
  assign tmp_tmp_inputVideo_payload_endOfPack_1 = {7'd0, tmp_tmp_inputVideo_payload_endOfPack_1_1};
  assign tmp_tmp_weights_ready_1_1 = tmp_weights_ready;
  assign tmp_tmp_weights_ready_1 = {4'd0, tmp_tmp_weights_ready_1_1};
  assign tmp_tmp_weightsAdapted_payload_0_0_0_0 = (tmp_weightsAdapted_payload_0_0_0_0 >>> 32);
  assign tmp_tmp_funcTable_ready_1_1 = tmp_funcTable_ready;
  assign tmp_tmp_funcTable_ready_1 = {1'd0, tmp_tmp_funcTable_ready_1_1};
  StreamFifoHighPerf_2 weightFifo_0 (
    .push_valid              (streamDemux_2_io_outputs_0_valid                 ), //i
    .push_ready              (weightFifo_0_push_ready                          ), //o
    .push_payload_0_0_0_0    (streamDemux_2_io_outputs_0_payload_0_0_0_0[7:0]  ), //i
    .push_payload_0_0_0_1    (streamDemux_2_io_outputs_0_payload_0_0_0_1[7:0]  ), //i
    .push_payload_0_0_0_2    (streamDemux_2_io_outputs_0_payload_0_0_0_2[7:0]  ), //i
    .push_payload_0_0_0_3    (streamDemux_2_io_outputs_0_payload_0_0_0_3[7:0]  ), //i
    .push_payload_0_0_1_0    (streamDemux_2_io_outputs_0_payload_0_0_1_0[7:0]  ), //i
    .push_payload_0_0_1_1    (streamDemux_2_io_outputs_0_payload_0_0_1_1[7:0]  ), //i
    .push_payload_0_0_1_2    (streamDemux_2_io_outputs_0_payload_0_0_1_2[7:0]  ), //i
    .push_payload_0_0_1_3    (streamDemux_2_io_outputs_0_payload_0_0_1_3[7:0]  ), //i
    .push_payload_0_0_2_0    (streamDemux_2_io_outputs_0_payload_0_0_2_0[7:0]  ), //i
    .push_payload_0_0_2_1    (streamDemux_2_io_outputs_0_payload_0_0_2_1[7:0]  ), //i
    .push_payload_0_0_2_2    (streamDemux_2_io_outputs_0_payload_0_0_2_2[7:0]  ), //i
    .push_payload_0_0_2_3    (streamDemux_2_io_outputs_0_payload_0_0_2_3[7:0]  ), //i
    .push_payload_0_1_0_0    (streamDemux_2_io_outputs_0_payload_0_1_0_0[7:0]  ), //i
    .push_payload_0_1_0_1    (streamDemux_2_io_outputs_0_payload_0_1_0_1[7:0]  ), //i
    .push_payload_0_1_0_2    (streamDemux_2_io_outputs_0_payload_0_1_0_2[7:0]  ), //i
    .push_payload_0_1_0_3    (streamDemux_2_io_outputs_0_payload_0_1_0_3[7:0]  ), //i
    .push_payload_0_1_1_0    (streamDemux_2_io_outputs_0_payload_0_1_1_0[7:0]  ), //i
    .push_payload_0_1_1_1    (streamDemux_2_io_outputs_0_payload_0_1_1_1[7:0]  ), //i
    .push_payload_0_1_1_2    (streamDemux_2_io_outputs_0_payload_0_1_1_2[7:0]  ), //i
    .push_payload_0_1_1_3    (streamDemux_2_io_outputs_0_payload_0_1_1_3[7:0]  ), //i
    .push_payload_0_1_2_0    (streamDemux_2_io_outputs_0_payload_0_1_2_0[7:0]  ), //i
    .push_payload_0_1_2_1    (streamDemux_2_io_outputs_0_payload_0_1_2_1[7:0]  ), //i
    .push_payload_0_1_2_2    (streamDemux_2_io_outputs_0_payload_0_1_2_2[7:0]  ), //i
    .push_payload_0_1_2_3    (streamDemux_2_io_outputs_0_payload_0_1_2_3[7:0]  ), //i
    .push_payload_0_2_0_0    (streamDemux_2_io_outputs_0_payload_0_2_0_0[7:0]  ), //i
    .push_payload_0_2_0_1    (streamDemux_2_io_outputs_0_payload_0_2_0_1[7:0]  ), //i
    .push_payload_0_2_0_2    (streamDemux_2_io_outputs_0_payload_0_2_0_2[7:0]  ), //i
    .push_payload_0_2_0_3    (streamDemux_2_io_outputs_0_payload_0_2_0_3[7:0]  ), //i
    .push_payload_0_2_1_0    (streamDemux_2_io_outputs_0_payload_0_2_1_0[7:0]  ), //i
    .push_payload_0_2_1_1    (streamDemux_2_io_outputs_0_payload_0_2_1_1[7:0]  ), //i
    .push_payload_0_2_1_2    (streamDemux_2_io_outputs_0_payload_0_2_1_2[7:0]  ), //i
    .push_payload_0_2_1_3    (streamDemux_2_io_outputs_0_payload_0_2_1_3[7:0]  ), //i
    .push_payload_0_2_2_0    (streamDemux_2_io_outputs_0_payload_0_2_2_0[7:0]  ), //i
    .push_payload_0_2_2_1    (streamDemux_2_io_outputs_0_payload_0_2_2_1[7:0]  ), //i
    .push_payload_0_2_2_2    (streamDemux_2_io_outputs_0_payload_0_2_2_2[7:0]  ), //i
    .push_payload_0_2_2_3    (streamDemux_2_io_outputs_0_payload_0_2_2_3[7:0]  ), //i
    .push_payload_1_0_0_0    (streamDemux_2_io_outputs_0_payload_1_0_0_0[7:0]  ), //i
    .push_payload_1_0_0_1    (streamDemux_2_io_outputs_0_payload_1_0_0_1[7:0]  ), //i
    .push_payload_1_0_0_2    (streamDemux_2_io_outputs_0_payload_1_0_0_2[7:0]  ), //i
    .push_payload_1_0_0_3    (streamDemux_2_io_outputs_0_payload_1_0_0_3[7:0]  ), //i
    .push_payload_1_0_1_0    (streamDemux_2_io_outputs_0_payload_1_0_1_0[7:0]  ), //i
    .push_payload_1_0_1_1    (streamDemux_2_io_outputs_0_payload_1_0_1_1[7:0]  ), //i
    .push_payload_1_0_1_2    (streamDemux_2_io_outputs_0_payload_1_0_1_2[7:0]  ), //i
    .push_payload_1_0_1_3    (streamDemux_2_io_outputs_0_payload_1_0_1_3[7:0]  ), //i
    .push_payload_1_0_2_0    (streamDemux_2_io_outputs_0_payload_1_0_2_0[7:0]  ), //i
    .push_payload_1_0_2_1    (streamDemux_2_io_outputs_0_payload_1_0_2_1[7:0]  ), //i
    .push_payload_1_0_2_2    (streamDemux_2_io_outputs_0_payload_1_0_2_2[7:0]  ), //i
    .push_payload_1_0_2_3    (streamDemux_2_io_outputs_0_payload_1_0_2_3[7:0]  ), //i
    .push_payload_1_1_0_0    (streamDemux_2_io_outputs_0_payload_1_1_0_0[7:0]  ), //i
    .push_payload_1_1_0_1    (streamDemux_2_io_outputs_0_payload_1_1_0_1[7:0]  ), //i
    .push_payload_1_1_0_2    (streamDemux_2_io_outputs_0_payload_1_1_0_2[7:0]  ), //i
    .push_payload_1_1_0_3    (streamDemux_2_io_outputs_0_payload_1_1_0_3[7:0]  ), //i
    .push_payload_1_1_1_0    (streamDemux_2_io_outputs_0_payload_1_1_1_0[7:0]  ), //i
    .push_payload_1_1_1_1    (streamDemux_2_io_outputs_0_payload_1_1_1_1[7:0]  ), //i
    .push_payload_1_1_1_2    (streamDemux_2_io_outputs_0_payload_1_1_1_2[7:0]  ), //i
    .push_payload_1_1_1_3    (streamDemux_2_io_outputs_0_payload_1_1_1_3[7:0]  ), //i
    .push_payload_1_1_2_0    (streamDemux_2_io_outputs_0_payload_1_1_2_0[7:0]  ), //i
    .push_payload_1_1_2_1    (streamDemux_2_io_outputs_0_payload_1_1_2_1[7:0]  ), //i
    .push_payload_1_1_2_2    (streamDemux_2_io_outputs_0_payload_1_1_2_2[7:0]  ), //i
    .push_payload_1_1_2_3    (streamDemux_2_io_outputs_0_payload_1_1_2_3[7:0]  ), //i
    .push_payload_1_2_0_0    (streamDemux_2_io_outputs_0_payload_1_2_0_0[7:0]  ), //i
    .push_payload_1_2_0_1    (streamDemux_2_io_outputs_0_payload_1_2_0_1[7:0]  ), //i
    .push_payload_1_2_0_2    (streamDemux_2_io_outputs_0_payload_1_2_0_2[7:0]  ), //i
    .push_payload_1_2_0_3    (streamDemux_2_io_outputs_0_payload_1_2_0_3[7:0]  ), //i
    .push_payload_1_2_1_0    (streamDemux_2_io_outputs_0_payload_1_2_1_0[7:0]  ), //i
    .push_payload_1_2_1_1    (streamDemux_2_io_outputs_0_payload_1_2_1_1[7:0]  ), //i
    .push_payload_1_2_1_2    (streamDemux_2_io_outputs_0_payload_1_2_1_2[7:0]  ), //i
    .push_payload_1_2_1_3    (streamDemux_2_io_outputs_0_payload_1_2_1_3[7:0]  ), //i
    .push_payload_1_2_2_0    (streamDemux_2_io_outputs_0_payload_1_2_2_0[7:0]  ), //i
    .push_payload_1_2_2_1    (streamDemux_2_io_outputs_0_payload_1_2_2_1[7:0]  ), //i
    .push_payload_1_2_2_2    (streamDemux_2_io_outputs_0_payload_1_2_2_2[7:0]  ), //i
    .push_payload_1_2_2_3    (streamDemux_2_io_outputs_0_payload_1_2_2_3[7:0]  ), //i
    .pop_valid               (weightFifo_0_pop_valid                           ), //o
    .pop_ready               (unit_0_weights_ready                             ), //i
    .pop_payload_0_0_0_0     (weightFifo_0_pop_payload_0_0_0_0[7:0]            ), //o
    .pop_payload_0_0_0_1     (weightFifo_0_pop_payload_0_0_0_1[7:0]            ), //o
    .pop_payload_0_0_0_2     (weightFifo_0_pop_payload_0_0_0_2[7:0]            ), //o
    .pop_payload_0_0_0_3     (weightFifo_0_pop_payload_0_0_0_3[7:0]            ), //o
    .pop_payload_0_0_1_0     (weightFifo_0_pop_payload_0_0_1_0[7:0]            ), //o
    .pop_payload_0_0_1_1     (weightFifo_0_pop_payload_0_0_1_1[7:0]            ), //o
    .pop_payload_0_0_1_2     (weightFifo_0_pop_payload_0_0_1_2[7:0]            ), //o
    .pop_payload_0_0_1_3     (weightFifo_0_pop_payload_0_0_1_3[7:0]            ), //o
    .pop_payload_0_0_2_0     (weightFifo_0_pop_payload_0_0_2_0[7:0]            ), //o
    .pop_payload_0_0_2_1     (weightFifo_0_pop_payload_0_0_2_1[7:0]            ), //o
    .pop_payload_0_0_2_2     (weightFifo_0_pop_payload_0_0_2_2[7:0]            ), //o
    .pop_payload_0_0_2_3     (weightFifo_0_pop_payload_0_0_2_3[7:0]            ), //o
    .pop_payload_0_1_0_0     (weightFifo_0_pop_payload_0_1_0_0[7:0]            ), //o
    .pop_payload_0_1_0_1     (weightFifo_0_pop_payload_0_1_0_1[7:0]            ), //o
    .pop_payload_0_1_0_2     (weightFifo_0_pop_payload_0_1_0_2[7:0]            ), //o
    .pop_payload_0_1_0_3     (weightFifo_0_pop_payload_0_1_0_3[7:0]            ), //o
    .pop_payload_0_1_1_0     (weightFifo_0_pop_payload_0_1_1_0[7:0]            ), //o
    .pop_payload_0_1_1_1     (weightFifo_0_pop_payload_0_1_1_1[7:0]            ), //o
    .pop_payload_0_1_1_2     (weightFifo_0_pop_payload_0_1_1_2[7:0]            ), //o
    .pop_payload_0_1_1_3     (weightFifo_0_pop_payload_0_1_1_3[7:0]            ), //o
    .pop_payload_0_1_2_0     (weightFifo_0_pop_payload_0_1_2_0[7:0]            ), //o
    .pop_payload_0_1_2_1     (weightFifo_0_pop_payload_0_1_2_1[7:0]            ), //o
    .pop_payload_0_1_2_2     (weightFifo_0_pop_payload_0_1_2_2[7:0]            ), //o
    .pop_payload_0_1_2_3     (weightFifo_0_pop_payload_0_1_2_3[7:0]            ), //o
    .pop_payload_0_2_0_0     (weightFifo_0_pop_payload_0_2_0_0[7:0]            ), //o
    .pop_payload_0_2_0_1     (weightFifo_0_pop_payload_0_2_0_1[7:0]            ), //o
    .pop_payload_0_2_0_2     (weightFifo_0_pop_payload_0_2_0_2[7:0]            ), //o
    .pop_payload_0_2_0_3     (weightFifo_0_pop_payload_0_2_0_3[7:0]            ), //o
    .pop_payload_0_2_1_0     (weightFifo_0_pop_payload_0_2_1_0[7:0]            ), //o
    .pop_payload_0_2_1_1     (weightFifo_0_pop_payload_0_2_1_1[7:0]            ), //o
    .pop_payload_0_2_1_2     (weightFifo_0_pop_payload_0_2_1_2[7:0]            ), //o
    .pop_payload_0_2_1_3     (weightFifo_0_pop_payload_0_2_1_3[7:0]            ), //o
    .pop_payload_0_2_2_0     (weightFifo_0_pop_payload_0_2_2_0[7:0]            ), //o
    .pop_payload_0_2_2_1     (weightFifo_0_pop_payload_0_2_2_1[7:0]            ), //o
    .pop_payload_0_2_2_2     (weightFifo_0_pop_payload_0_2_2_2[7:0]            ), //o
    .pop_payload_0_2_2_3     (weightFifo_0_pop_payload_0_2_2_3[7:0]            ), //o
    .pop_payload_1_0_0_0     (weightFifo_0_pop_payload_1_0_0_0[7:0]            ), //o
    .pop_payload_1_0_0_1     (weightFifo_0_pop_payload_1_0_0_1[7:0]            ), //o
    .pop_payload_1_0_0_2     (weightFifo_0_pop_payload_1_0_0_2[7:0]            ), //o
    .pop_payload_1_0_0_3     (weightFifo_0_pop_payload_1_0_0_3[7:0]            ), //o
    .pop_payload_1_0_1_0     (weightFifo_0_pop_payload_1_0_1_0[7:0]            ), //o
    .pop_payload_1_0_1_1     (weightFifo_0_pop_payload_1_0_1_1[7:0]            ), //o
    .pop_payload_1_0_1_2     (weightFifo_0_pop_payload_1_0_1_2[7:0]            ), //o
    .pop_payload_1_0_1_3     (weightFifo_0_pop_payload_1_0_1_3[7:0]            ), //o
    .pop_payload_1_0_2_0     (weightFifo_0_pop_payload_1_0_2_0[7:0]            ), //o
    .pop_payload_1_0_2_1     (weightFifo_0_pop_payload_1_0_2_1[7:0]            ), //o
    .pop_payload_1_0_2_2     (weightFifo_0_pop_payload_1_0_2_2[7:0]            ), //o
    .pop_payload_1_0_2_3     (weightFifo_0_pop_payload_1_0_2_3[7:0]            ), //o
    .pop_payload_1_1_0_0     (weightFifo_0_pop_payload_1_1_0_0[7:0]            ), //o
    .pop_payload_1_1_0_1     (weightFifo_0_pop_payload_1_1_0_1[7:0]            ), //o
    .pop_payload_1_1_0_2     (weightFifo_0_pop_payload_1_1_0_2[7:0]            ), //o
    .pop_payload_1_1_0_3     (weightFifo_0_pop_payload_1_1_0_3[7:0]            ), //o
    .pop_payload_1_1_1_0     (weightFifo_0_pop_payload_1_1_1_0[7:0]            ), //o
    .pop_payload_1_1_1_1     (weightFifo_0_pop_payload_1_1_1_1[7:0]            ), //o
    .pop_payload_1_1_1_2     (weightFifo_0_pop_payload_1_1_1_2[7:0]            ), //o
    .pop_payload_1_1_1_3     (weightFifo_0_pop_payload_1_1_1_3[7:0]            ), //o
    .pop_payload_1_1_2_0     (weightFifo_0_pop_payload_1_1_2_0[7:0]            ), //o
    .pop_payload_1_1_2_1     (weightFifo_0_pop_payload_1_1_2_1[7:0]            ), //o
    .pop_payload_1_1_2_2     (weightFifo_0_pop_payload_1_1_2_2[7:0]            ), //o
    .pop_payload_1_1_2_3     (weightFifo_0_pop_payload_1_1_2_3[7:0]            ), //o
    .pop_payload_1_2_0_0     (weightFifo_0_pop_payload_1_2_0_0[7:0]            ), //o
    .pop_payload_1_2_0_1     (weightFifo_0_pop_payload_1_2_0_1[7:0]            ), //o
    .pop_payload_1_2_0_2     (weightFifo_0_pop_payload_1_2_0_2[7:0]            ), //o
    .pop_payload_1_2_0_3     (weightFifo_0_pop_payload_1_2_0_3[7:0]            ), //o
    .pop_payload_1_2_1_0     (weightFifo_0_pop_payload_1_2_1_0[7:0]            ), //o
    .pop_payload_1_2_1_1     (weightFifo_0_pop_payload_1_2_1_1[7:0]            ), //o
    .pop_payload_1_2_1_2     (weightFifo_0_pop_payload_1_2_1_2[7:0]            ), //o
    .pop_payload_1_2_1_3     (weightFifo_0_pop_payload_1_2_1_3[7:0]            ), //o
    .pop_payload_1_2_2_0     (weightFifo_0_pop_payload_1_2_2_0[7:0]            ), //o
    .pop_payload_1_2_2_1     (weightFifo_0_pop_payload_1_2_2_1[7:0]            ), //o
    .pop_payload_1_2_2_2     (weightFifo_0_pop_payload_1_2_2_2[7:0]            ), //o
    .pop_payload_1_2_2_3     (weightFifo_0_pop_payload_1_2_2_3[7:0]            ), //o
    .flush                   (1'b0                                             ), //i
    .clk                     (clk                                              ), //i
    .reset                   (reset                                            )  //i
  );
  StreamFifoHighPerf_2 weightFifo_1 (
    .push_valid              (streamDemux_2_io_outputs_1_valid                 ), //i
    .push_ready              (weightFifo_1_push_ready                          ), //o
    .push_payload_0_0_0_0    (streamDemux_2_io_outputs_1_payload_0_0_0_0[7:0]  ), //i
    .push_payload_0_0_0_1    (streamDemux_2_io_outputs_1_payload_0_0_0_1[7:0]  ), //i
    .push_payload_0_0_0_2    (streamDemux_2_io_outputs_1_payload_0_0_0_2[7:0]  ), //i
    .push_payload_0_0_0_3    (streamDemux_2_io_outputs_1_payload_0_0_0_3[7:0]  ), //i
    .push_payload_0_0_1_0    (streamDemux_2_io_outputs_1_payload_0_0_1_0[7:0]  ), //i
    .push_payload_0_0_1_1    (streamDemux_2_io_outputs_1_payload_0_0_1_1[7:0]  ), //i
    .push_payload_0_0_1_2    (streamDemux_2_io_outputs_1_payload_0_0_1_2[7:0]  ), //i
    .push_payload_0_0_1_3    (streamDemux_2_io_outputs_1_payload_0_0_1_3[7:0]  ), //i
    .push_payload_0_0_2_0    (streamDemux_2_io_outputs_1_payload_0_0_2_0[7:0]  ), //i
    .push_payload_0_0_2_1    (streamDemux_2_io_outputs_1_payload_0_0_2_1[7:0]  ), //i
    .push_payload_0_0_2_2    (streamDemux_2_io_outputs_1_payload_0_0_2_2[7:0]  ), //i
    .push_payload_0_0_2_3    (streamDemux_2_io_outputs_1_payload_0_0_2_3[7:0]  ), //i
    .push_payload_0_1_0_0    (streamDemux_2_io_outputs_1_payload_0_1_0_0[7:0]  ), //i
    .push_payload_0_1_0_1    (streamDemux_2_io_outputs_1_payload_0_1_0_1[7:0]  ), //i
    .push_payload_0_1_0_2    (streamDemux_2_io_outputs_1_payload_0_1_0_2[7:0]  ), //i
    .push_payload_0_1_0_3    (streamDemux_2_io_outputs_1_payload_0_1_0_3[7:0]  ), //i
    .push_payload_0_1_1_0    (streamDemux_2_io_outputs_1_payload_0_1_1_0[7:0]  ), //i
    .push_payload_0_1_1_1    (streamDemux_2_io_outputs_1_payload_0_1_1_1[7:0]  ), //i
    .push_payload_0_1_1_2    (streamDemux_2_io_outputs_1_payload_0_1_1_2[7:0]  ), //i
    .push_payload_0_1_1_3    (streamDemux_2_io_outputs_1_payload_0_1_1_3[7:0]  ), //i
    .push_payload_0_1_2_0    (streamDemux_2_io_outputs_1_payload_0_1_2_0[7:0]  ), //i
    .push_payload_0_1_2_1    (streamDemux_2_io_outputs_1_payload_0_1_2_1[7:0]  ), //i
    .push_payload_0_1_2_2    (streamDemux_2_io_outputs_1_payload_0_1_2_2[7:0]  ), //i
    .push_payload_0_1_2_3    (streamDemux_2_io_outputs_1_payload_0_1_2_3[7:0]  ), //i
    .push_payload_0_2_0_0    (streamDemux_2_io_outputs_1_payload_0_2_0_0[7:0]  ), //i
    .push_payload_0_2_0_1    (streamDemux_2_io_outputs_1_payload_0_2_0_1[7:0]  ), //i
    .push_payload_0_2_0_2    (streamDemux_2_io_outputs_1_payload_0_2_0_2[7:0]  ), //i
    .push_payload_0_2_0_3    (streamDemux_2_io_outputs_1_payload_0_2_0_3[7:0]  ), //i
    .push_payload_0_2_1_0    (streamDemux_2_io_outputs_1_payload_0_2_1_0[7:0]  ), //i
    .push_payload_0_2_1_1    (streamDemux_2_io_outputs_1_payload_0_2_1_1[7:0]  ), //i
    .push_payload_0_2_1_2    (streamDemux_2_io_outputs_1_payload_0_2_1_2[7:0]  ), //i
    .push_payload_0_2_1_3    (streamDemux_2_io_outputs_1_payload_0_2_1_3[7:0]  ), //i
    .push_payload_0_2_2_0    (streamDemux_2_io_outputs_1_payload_0_2_2_0[7:0]  ), //i
    .push_payload_0_2_2_1    (streamDemux_2_io_outputs_1_payload_0_2_2_1[7:0]  ), //i
    .push_payload_0_2_2_2    (streamDemux_2_io_outputs_1_payload_0_2_2_2[7:0]  ), //i
    .push_payload_0_2_2_3    (streamDemux_2_io_outputs_1_payload_0_2_2_3[7:0]  ), //i
    .push_payload_1_0_0_0    (streamDemux_2_io_outputs_1_payload_1_0_0_0[7:0]  ), //i
    .push_payload_1_0_0_1    (streamDemux_2_io_outputs_1_payload_1_0_0_1[7:0]  ), //i
    .push_payload_1_0_0_2    (streamDemux_2_io_outputs_1_payload_1_0_0_2[7:0]  ), //i
    .push_payload_1_0_0_3    (streamDemux_2_io_outputs_1_payload_1_0_0_3[7:0]  ), //i
    .push_payload_1_0_1_0    (streamDemux_2_io_outputs_1_payload_1_0_1_0[7:0]  ), //i
    .push_payload_1_0_1_1    (streamDemux_2_io_outputs_1_payload_1_0_1_1[7:0]  ), //i
    .push_payload_1_0_1_2    (streamDemux_2_io_outputs_1_payload_1_0_1_2[7:0]  ), //i
    .push_payload_1_0_1_3    (streamDemux_2_io_outputs_1_payload_1_0_1_3[7:0]  ), //i
    .push_payload_1_0_2_0    (streamDemux_2_io_outputs_1_payload_1_0_2_0[7:0]  ), //i
    .push_payload_1_0_2_1    (streamDemux_2_io_outputs_1_payload_1_0_2_1[7:0]  ), //i
    .push_payload_1_0_2_2    (streamDemux_2_io_outputs_1_payload_1_0_2_2[7:0]  ), //i
    .push_payload_1_0_2_3    (streamDemux_2_io_outputs_1_payload_1_0_2_3[7:0]  ), //i
    .push_payload_1_1_0_0    (streamDemux_2_io_outputs_1_payload_1_1_0_0[7:0]  ), //i
    .push_payload_1_1_0_1    (streamDemux_2_io_outputs_1_payload_1_1_0_1[7:0]  ), //i
    .push_payload_1_1_0_2    (streamDemux_2_io_outputs_1_payload_1_1_0_2[7:0]  ), //i
    .push_payload_1_1_0_3    (streamDemux_2_io_outputs_1_payload_1_1_0_3[7:0]  ), //i
    .push_payload_1_1_1_0    (streamDemux_2_io_outputs_1_payload_1_1_1_0[7:0]  ), //i
    .push_payload_1_1_1_1    (streamDemux_2_io_outputs_1_payload_1_1_1_1[7:0]  ), //i
    .push_payload_1_1_1_2    (streamDemux_2_io_outputs_1_payload_1_1_1_2[7:0]  ), //i
    .push_payload_1_1_1_3    (streamDemux_2_io_outputs_1_payload_1_1_1_3[7:0]  ), //i
    .push_payload_1_1_2_0    (streamDemux_2_io_outputs_1_payload_1_1_2_0[7:0]  ), //i
    .push_payload_1_1_2_1    (streamDemux_2_io_outputs_1_payload_1_1_2_1[7:0]  ), //i
    .push_payload_1_1_2_2    (streamDemux_2_io_outputs_1_payload_1_1_2_2[7:0]  ), //i
    .push_payload_1_1_2_3    (streamDemux_2_io_outputs_1_payload_1_1_2_3[7:0]  ), //i
    .push_payload_1_2_0_0    (streamDemux_2_io_outputs_1_payload_1_2_0_0[7:0]  ), //i
    .push_payload_1_2_0_1    (streamDemux_2_io_outputs_1_payload_1_2_0_1[7:0]  ), //i
    .push_payload_1_2_0_2    (streamDemux_2_io_outputs_1_payload_1_2_0_2[7:0]  ), //i
    .push_payload_1_2_0_3    (streamDemux_2_io_outputs_1_payload_1_2_0_3[7:0]  ), //i
    .push_payload_1_2_1_0    (streamDemux_2_io_outputs_1_payload_1_2_1_0[7:0]  ), //i
    .push_payload_1_2_1_1    (streamDemux_2_io_outputs_1_payload_1_2_1_1[7:0]  ), //i
    .push_payload_1_2_1_2    (streamDemux_2_io_outputs_1_payload_1_2_1_2[7:0]  ), //i
    .push_payload_1_2_1_3    (streamDemux_2_io_outputs_1_payload_1_2_1_3[7:0]  ), //i
    .push_payload_1_2_2_0    (streamDemux_2_io_outputs_1_payload_1_2_2_0[7:0]  ), //i
    .push_payload_1_2_2_1    (streamDemux_2_io_outputs_1_payload_1_2_2_1[7:0]  ), //i
    .push_payload_1_2_2_2    (streamDemux_2_io_outputs_1_payload_1_2_2_2[7:0]  ), //i
    .push_payload_1_2_2_3    (streamDemux_2_io_outputs_1_payload_1_2_2_3[7:0]  ), //i
    .pop_valid               (weightFifo_1_pop_valid                           ), //o
    .pop_ready               (unit_1_weights_ready                             ), //i
    .pop_payload_0_0_0_0     (weightFifo_1_pop_payload_0_0_0_0[7:0]            ), //o
    .pop_payload_0_0_0_1     (weightFifo_1_pop_payload_0_0_0_1[7:0]            ), //o
    .pop_payload_0_0_0_2     (weightFifo_1_pop_payload_0_0_0_2[7:0]            ), //o
    .pop_payload_0_0_0_3     (weightFifo_1_pop_payload_0_0_0_3[7:0]            ), //o
    .pop_payload_0_0_1_0     (weightFifo_1_pop_payload_0_0_1_0[7:0]            ), //o
    .pop_payload_0_0_1_1     (weightFifo_1_pop_payload_0_0_1_1[7:0]            ), //o
    .pop_payload_0_0_1_2     (weightFifo_1_pop_payload_0_0_1_2[7:0]            ), //o
    .pop_payload_0_0_1_3     (weightFifo_1_pop_payload_0_0_1_3[7:0]            ), //o
    .pop_payload_0_0_2_0     (weightFifo_1_pop_payload_0_0_2_0[7:0]            ), //o
    .pop_payload_0_0_2_1     (weightFifo_1_pop_payload_0_0_2_1[7:0]            ), //o
    .pop_payload_0_0_2_2     (weightFifo_1_pop_payload_0_0_2_2[7:0]            ), //o
    .pop_payload_0_0_2_3     (weightFifo_1_pop_payload_0_0_2_3[7:0]            ), //o
    .pop_payload_0_1_0_0     (weightFifo_1_pop_payload_0_1_0_0[7:0]            ), //o
    .pop_payload_0_1_0_1     (weightFifo_1_pop_payload_0_1_0_1[7:0]            ), //o
    .pop_payload_0_1_0_2     (weightFifo_1_pop_payload_0_1_0_2[7:0]            ), //o
    .pop_payload_0_1_0_3     (weightFifo_1_pop_payload_0_1_0_3[7:0]            ), //o
    .pop_payload_0_1_1_0     (weightFifo_1_pop_payload_0_1_1_0[7:0]            ), //o
    .pop_payload_0_1_1_1     (weightFifo_1_pop_payload_0_1_1_1[7:0]            ), //o
    .pop_payload_0_1_1_2     (weightFifo_1_pop_payload_0_1_1_2[7:0]            ), //o
    .pop_payload_0_1_1_3     (weightFifo_1_pop_payload_0_1_1_3[7:0]            ), //o
    .pop_payload_0_1_2_0     (weightFifo_1_pop_payload_0_1_2_0[7:0]            ), //o
    .pop_payload_0_1_2_1     (weightFifo_1_pop_payload_0_1_2_1[7:0]            ), //o
    .pop_payload_0_1_2_2     (weightFifo_1_pop_payload_0_1_2_2[7:0]            ), //o
    .pop_payload_0_1_2_3     (weightFifo_1_pop_payload_0_1_2_3[7:0]            ), //o
    .pop_payload_0_2_0_0     (weightFifo_1_pop_payload_0_2_0_0[7:0]            ), //o
    .pop_payload_0_2_0_1     (weightFifo_1_pop_payload_0_2_0_1[7:0]            ), //o
    .pop_payload_0_2_0_2     (weightFifo_1_pop_payload_0_2_0_2[7:0]            ), //o
    .pop_payload_0_2_0_3     (weightFifo_1_pop_payload_0_2_0_3[7:0]            ), //o
    .pop_payload_0_2_1_0     (weightFifo_1_pop_payload_0_2_1_0[7:0]            ), //o
    .pop_payload_0_2_1_1     (weightFifo_1_pop_payload_0_2_1_1[7:0]            ), //o
    .pop_payload_0_2_1_2     (weightFifo_1_pop_payload_0_2_1_2[7:0]            ), //o
    .pop_payload_0_2_1_3     (weightFifo_1_pop_payload_0_2_1_3[7:0]            ), //o
    .pop_payload_0_2_2_0     (weightFifo_1_pop_payload_0_2_2_0[7:0]            ), //o
    .pop_payload_0_2_2_1     (weightFifo_1_pop_payload_0_2_2_1[7:0]            ), //o
    .pop_payload_0_2_2_2     (weightFifo_1_pop_payload_0_2_2_2[7:0]            ), //o
    .pop_payload_0_2_2_3     (weightFifo_1_pop_payload_0_2_2_3[7:0]            ), //o
    .pop_payload_1_0_0_0     (weightFifo_1_pop_payload_1_0_0_0[7:0]            ), //o
    .pop_payload_1_0_0_1     (weightFifo_1_pop_payload_1_0_0_1[7:0]            ), //o
    .pop_payload_1_0_0_2     (weightFifo_1_pop_payload_1_0_0_2[7:0]            ), //o
    .pop_payload_1_0_0_3     (weightFifo_1_pop_payload_1_0_0_3[7:0]            ), //o
    .pop_payload_1_0_1_0     (weightFifo_1_pop_payload_1_0_1_0[7:0]            ), //o
    .pop_payload_1_0_1_1     (weightFifo_1_pop_payload_1_0_1_1[7:0]            ), //o
    .pop_payload_1_0_1_2     (weightFifo_1_pop_payload_1_0_1_2[7:0]            ), //o
    .pop_payload_1_0_1_3     (weightFifo_1_pop_payload_1_0_1_3[7:0]            ), //o
    .pop_payload_1_0_2_0     (weightFifo_1_pop_payload_1_0_2_0[7:0]            ), //o
    .pop_payload_1_0_2_1     (weightFifo_1_pop_payload_1_0_2_1[7:0]            ), //o
    .pop_payload_1_0_2_2     (weightFifo_1_pop_payload_1_0_2_2[7:0]            ), //o
    .pop_payload_1_0_2_3     (weightFifo_1_pop_payload_1_0_2_3[7:0]            ), //o
    .pop_payload_1_1_0_0     (weightFifo_1_pop_payload_1_1_0_0[7:0]            ), //o
    .pop_payload_1_1_0_1     (weightFifo_1_pop_payload_1_1_0_1[7:0]            ), //o
    .pop_payload_1_1_0_2     (weightFifo_1_pop_payload_1_1_0_2[7:0]            ), //o
    .pop_payload_1_1_0_3     (weightFifo_1_pop_payload_1_1_0_3[7:0]            ), //o
    .pop_payload_1_1_1_0     (weightFifo_1_pop_payload_1_1_1_0[7:0]            ), //o
    .pop_payload_1_1_1_1     (weightFifo_1_pop_payload_1_1_1_1[7:0]            ), //o
    .pop_payload_1_1_1_2     (weightFifo_1_pop_payload_1_1_1_2[7:0]            ), //o
    .pop_payload_1_1_1_3     (weightFifo_1_pop_payload_1_1_1_3[7:0]            ), //o
    .pop_payload_1_1_2_0     (weightFifo_1_pop_payload_1_1_2_0[7:0]            ), //o
    .pop_payload_1_1_2_1     (weightFifo_1_pop_payload_1_1_2_1[7:0]            ), //o
    .pop_payload_1_1_2_2     (weightFifo_1_pop_payload_1_1_2_2[7:0]            ), //o
    .pop_payload_1_1_2_3     (weightFifo_1_pop_payload_1_1_2_3[7:0]            ), //o
    .pop_payload_1_2_0_0     (weightFifo_1_pop_payload_1_2_0_0[7:0]            ), //o
    .pop_payload_1_2_0_1     (weightFifo_1_pop_payload_1_2_0_1[7:0]            ), //o
    .pop_payload_1_2_0_2     (weightFifo_1_pop_payload_1_2_0_2[7:0]            ), //o
    .pop_payload_1_2_0_3     (weightFifo_1_pop_payload_1_2_0_3[7:0]            ), //o
    .pop_payload_1_2_1_0     (weightFifo_1_pop_payload_1_2_1_0[7:0]            ), //o
    .pop_payload_1_2_1_1     (weightFifo_1_pop_payload_1_2_1_1[7:0]            ), //o
    .pop_payload_1_2_1_2     (weightFifo_1_pop_payload_1_2_1_2[7:0]            ), //o
    .pop_payload_1_2_1_3     (weightFifo_1_pop_payload_1_2_1_3[7:0]            ), //o
    .pop_payload_1_2_2_0     (weightFifo_1_pop_payload_1_2_2_0[7:0]            ), //o
    .pop_payload_1_2_2_1     (weightFifo_1_pop_payload_1_2_2_1[7:0]            ), //o
    .pop_payload_1_2_2_2     (weightFifo_1_pop_payload_1_2_2_2[7:0]            ), //o
    .pop_payload_1_2_2_3     (weightFifo_1_pop_payload_1_2_2_3[7:0]            ), //o
    .flush                   (1'b0                                             ), //i
    .clk                     (clk                                              ), //i
    .reset                   (reset                                            )  //i
  );
  SlidingWindowSame window (
    .videoIn_valid                              (inputVideo_valid                                     ), //i
    .videoIn_ready                              (window_videoIn_ready                                 ), //o
    .videoIn_payload_frame_line_pixel_0         (inputVideo_payload_frame_line_pixel_0[7:0]           ), //i
    .videoIn_payload_frame_line_pixel_1         (inputVideo_payload_frame_line_pixel_1[7:0]           ), //i
    .videoIn_payload_frame_line_pixel_2         (inputVideo_payload_frame_line_pixel_2[7:0]           ), //i
    .videoIn_payload_frame_line_pixel_3         (inputVideo_payload_frame_line_pixel_3[7:0]           ), //i
    .videoIn_payload_frame_line_endOfLine       (inputVideo_payload_frame_line_endOfLine              ), //i
    .videoIn_payload_frame_endOfFrame           (inputVideo_payload_frame_endOfFrame                  ), //i
    .videoIn_payload_endOfPack                  (inputVideo_payload_endOfPack                         ), //i
    .videoOut_valid                             (window_videoOut_valid                                ), //o
    .videoOut_ready                             (window_videoOut_fork_io_input_ready                  ), //i
    .videoOut_payload_frame_line_pixel_0_0_0    (window_videoOut_payload_frame_line_pixel_0_0_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_0_1    (window_videoOut_payload_frame_line_pixel_0_0_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_0_2    (window_videoOut_payload_frame_line_pixel_0_0_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_0_3    (window_videoOut_payload_frame_line_pixel_0_0_3[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_1_0    (window_videoOut_payload_frame_line_pixel_0_1_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_1_1    (window_videoOut_payload_frame_line_pixel_0_1_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_1_2    (window_videoOut_payload_frame_line_pixel_0_1_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_1_3    (window_videoOut_payload_frame_line_pixel_0_1_3[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_2_0    (window_videoOut_payload_frame_line_pixel_0_2_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_2_1    (window_videoOut_payload_frame_line_pixel_0_2_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_2_2    (window_videoOut_payload_frame_line_pixel_0_2_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_2_3    (window_videoOut_payload_frame_line_pixel_0_2_3[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_0_0    (window_videoOut_payload_frame_line_pixel_1_0_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_0_1    (window_videoOut_payload_frame_line_pixel_1_0_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_0_2    (window_videoOut_payload_frame_line_pixel_1_0_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_0_3    (window_videoOut_payload_frame_line_pixel_1_0_3[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_1_0    (window_videoOut_payload_frame_line_pixel_1_1_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_1_1    (window_videoOut_payload_frame_line_pixel_1_1_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_1_2    (window_videoOut_payload_frame_line_pixel_1_1_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_1_3    (window_videoOut_payload_frame_line_pixel_1_1_3[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_2_0    (window_videoOut_payload_frame_line_pixel_1_2_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_2_1    (window_videoOut_payload_frame_line_pixel_1_2_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_2_2    (window_videoOut_payload_frame_line_pixel_1_2_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_2_3    (window_videoOut_payload_frame_line_pixel_1_2_3[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_0_0    (window_videoOut_payload_frame_line_pixel_2_0_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_0_1    (window_videoOut_payload_frame_line_pixel_2_0_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_0_2    (window_videoOut_payload_frame_line_pixel_2_0_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_0_3    (window_videoOut_payload_frame_line_pixel_2_0_3[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_1_0    (window_videoOut_payload_frame_line_pixel_2_1_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_1_1    (window_videoOut_payload_frame_line_pixel_2_1_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_1_2    (window_videoOut_payload_frame_line_pixel_2_1_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_1_3    (window_videoOut_payload_frame_line_pixel_2_1_3[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_2_0    (window_videoOut_payload_frame_line_pixel_2_2_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_2_1    (window_videoOut_payload_frame_line_pixel_2_2_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_2_2    (window_videoOut_payload_frame_line_pixel_2_2_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_2_3    (window_videoOut_payload_frame_line_pixel_2_2_3[7:0]  ), //o
    .videoOut_payload_frame_line_endOfLine      (window_videoOut_payload_frame_line_endOfLine         ), //o
    .videoOut_payload_frame_endOfFrame          (window_videoOut_payload_frame_endOfFrame             ), //o
    .videoOut_payload_endOfPack                 (window_videoOut_payload_endOfPack                    ), //o
    .clk                                        (clk                                                  ), //i
    .reset                                      (reset                                                )  //i
  );
  StreamFork_4 window_videoOut_fork (
    .io_input_valid                                 (window_videoOut_valid                                                  ), //i
    .io_input_ready                                 (window_videoOut_fork_io_input_ready                                    ), //o
    .io_input_payload_frame_line_pixel_0_0_0        (window_videoOut_payload_frame_line_pixel_0_0_0[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_0_0_1        (window_videoOut_payload_frame_line_pixel_0_0_1[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_0_0_2        (window_videoOut_payload_frame_line_pixel_0_0_2[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_0_0_3        (window_videoOut_payload_frame_line_pixel_0_0_3[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_0_1_0        (window_videoOut_payload_frame_line_pixel_0_1_0[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_0_1_1        (window_videoOut_payload_frame_line_pixel_0_1_1[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_0_1_2        (window_videoOut_payload_frame_line_pixel_0_1_2[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_0_1_3        (window_videoOut_payload_frame_line_pixel_0_1_3[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_0_2_0        (window_videoOut_payload_frame_line_pixel_0_2_0[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_0_2_1        (window_videoOut_payload_frame_line_pixel_0_2_1[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_0_2_2        (window_videoOut_payload_frame_line_pixel_0_2_2[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_0_2_3        (window_videoOut_payload_frame_line_pixel_0_2_3[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_1_0_0        (window_videoOut_payload_frame_line_pixel_1_0_0[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_1_0_1        (window_videoOut_payload_frame_line_pixel_1_0_1[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_1_0_2        (window_videoOut_payload_frame_line_pixel_1_0_2[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_1_0_3        (window_videoOut_payload_frame_line_pixel_1_0_3[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_1_1_0        (window_videoOut_payload_frame_line_pixel_1_1_0[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_1_1_1        (window_videoOut_payload_frame_line_pixel_1_1_1[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_1_1_2        (window_videoOut_payload_frame_line_pixel_1_1_2[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_1_1_3        (window_videoOut_payload_frame_line_pixel_1_1_3[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_1_2_0        (window_videoOut_payload_frame_line_pixel_1_2_0[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_1_2_1        (window_videoOut_payload_frame_line_pixel_1_2_1[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_1_2_2        (window_videoOut_payload_frame_line_pixel_1_2_2[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_1_2_3        (window_videoOut_payload_frame_line_pixel_1_2_3[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_2_0_0        (window_videoOut_payload_frame_line_pixel_2_0_0[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_2_0_1        (window_videoOut_payload_frame_line_pixel_2_0_1[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_2_0_2        (window_videoOut_payload_frame_line_pixel_2_0_2[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_2_0_3        (window_videoOut_payload_frame_line_pixel_2_0_3[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_2_1_0        (window_videoOut_payload_frame_line_pixel_2_1_0[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_2_1_1        (window_videoOut_payload_frame_line_pixel_2_1_1[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_2_1_2        (window_videoOut_payload_frame_line_pixel_2_1_2[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_2_1_3        (window_videoOut_payload_frame_line_pixel_2_1_3[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_2_2_0        (window_videoOut_payload_frame_line_pixel_2_2_0[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_2_2_1        (window_videoOut_payload_frame_line_pixel_2_2_1[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_2_2_2        (window_videoOut_payload_frame_line_pixel_2_2_2[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_2_2_3        (window_videoOut_payload_frame_line_pixel_2_2_3[7:0]                    ), //i
    .io_input_payload_frame_line_endOfLine          (window_videoOut_payload_frame_line_endOfLine                           ), //i
    .io_input_payload_frame_endOfFrame              (window_videoOut_payload_frame_endOfFrame                               ), //i
    .io_input_payload_endOfPack                     (window_videoOut_payload_endOfPack                                      ), //i
    .io_outputs_0_valid                             (window_videoOut_fork_io_outputs_0_valid                                ), //o
    .io_outputs_0_ready                             (unit_0_inputs_ready                                                    ), //i
    .io_outputs_0_payload_frame_line_pixel_0_0_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_0_0[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_0_0_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_0_1[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_0_0_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_0_2[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_0_0_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_0_3[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_0_1_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_1_0[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_0_1_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_1_1[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_0_1_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_1_2[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_0_1_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_1_3[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_0_2_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_2_0[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_0_2_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_2_1[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_0_2_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_2_2[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_0_2_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_2_3[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_1_0_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_0_0[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_1_0_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_0_1[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_1_0_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_0_2[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_1_0_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_0_3[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_1_1_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_1_0[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_1_1_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_1_1[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_1_1_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_1_2[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_1_1_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_1_3[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_1_2_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_2_0[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_1_2_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_2_1[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_1_2_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_2_2[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_1_2_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_2_3[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_2_0_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_0_0[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_2_0_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_0_1[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_2_0_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_0_2[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_2_0_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_0_3[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_2_1_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_1_0[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_2_1_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_1_1[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_2_1_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_1_2[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_2_1_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_1_3[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_2_2_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_2_0[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_2_2_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_2_1[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_2_2_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_2_2[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_2_2_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_2_3[7:0]  ), //o
    .io_outputs_0_payload_frame_line_endOfLine      (window_videoOut_fork_io_outputs_0_payload_frame_line_endOfLine         ), //o
    .io_outputs_0_payload_frame_endOfFrame          (window_videoOut_fork_io_outputs_0_payload_frame_endOfFrame             ), //o
    .io_outputs_0_payload_endOfPack                 (window_videoOut_fork_io_outputs_0_payload_endOfPack                    ), //o
    .io_outputs_1_valid                             (window_videoOut_fork_io_outputs_1_valid                                ), //o
    .io_outputs_1_ready                             (unit_1_inputs_ready                                                    ), //i
    .io_outputs_1_payload_frame_line_pixel_0_0_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_0_0[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_0_0_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_0_1[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_0_0_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_0_2[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_0_0_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_0_3[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_0_1_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_1_0[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_0_1_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_1_1[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_0_1_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_1_2[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_0_1_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_1_3[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_0_2_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_2_0[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_0_2_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_2_1[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_0_2_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_2_2[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_0_2_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_2_3[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_1_0_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_0_0[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_1_0_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_0_1[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_1_0_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_0_2[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_1_0_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_0_3[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_1_1_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_1_0[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_1_1_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_1_1[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_1_1_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_1_2[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_1_1_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_1_3[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_1_2_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_2_0[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_1_2_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_2_1[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_1_2_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_2_2[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_1_2_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_2_3[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_2_0_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_0_0[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_2_0_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_0_1[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_2_0_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_0_2[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_2_0_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_0_3[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_2_1_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_1_0[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_2_1_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_1_1[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_2_1_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_1_2[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_2_1_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_1_3[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_2_2_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_2_0[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_2_2_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_2_1[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_2_2_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_2_2[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_2_2_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_2_3[7:0]  ), //o
    .io_outputs_1_payload_frame_line_endOfLine      (window_videoOut_fork_io_outputs_1_payload_frame_line_endOfLine         ), //o
    .io_outputs_1_payload_frame_endOfFrame          (window_videoOut_fork_io_outputs_1_payload_frame_endOfFrame             ), //o
    .io_outputs_1_payload_endOfPack                 (window_videoOut_fork_io_outputs_1_payload_endOfPack                    ), //o
    .clk                                            (clk                                                                    ), //i
    .reset                                          (reset                                                                  )  //i
  );
  PecaUnit unit_0 (
    .numberOfInputFrames                      (numberOfInputFrames[7:0]                                               ), //i
    .numberOfOutputFrames                     (numberOfOutputFrames[7:0]                                              ), //i
    .inputs_valid                             (window_videoOut_fork_io_outputs_0_valid                                ), //i
    .inputs_ready                             (unit_0_inputs_ready                                                    ), //o
    .inputs_payload_frame_line_pixel_0_0_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_0_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_0_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_0_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_0_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_0_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_0_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_0_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_1_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_1_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_1_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_1_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_1_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_1_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_1_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_1_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_2_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_2_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_2_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_2_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_2_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_2_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_2_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_0_2_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_0_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_0_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_0_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_0_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_0_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_0_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_0_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_0_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_1_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_1_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_1_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_1_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_1_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_1_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_1_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_1_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_2_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_2_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_2_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_2_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_2_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_2_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_2_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_1_2_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_0_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_0_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_0_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_0_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_0_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_0_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_0_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_0_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_1_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_1_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_1_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_1_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_1_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_1_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_1_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_1_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_2_0    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_2_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_2_1    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_2_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_2_2    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_2_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_2_3    (window_videoOut_fork_io_outputs_0_payload_frame_line_pixel_2_2_3[7:0]  ), //i
    .inputs_payload_frame_line_endOfLine      (window_videoOut_fork_io_outputs_0_payload_frame_line_endOfLine         ), //i
    .inputs_payload_frame_endOfFrame          (window_videoOut_fork_io_outputs_0_payload_frame_endOfFrame             ), //i
    .inputs_payload_endOfPack                 (window_videoOut_fork_io_outputs_0_payload_endOfPack                    ), //i
    .weights_valid                            (weightFifo_0_pop_valid                                                 ), //i
    .weights_ready                            (unit_0_weights_ready                                                   ), //o
    .weights_payload_0_0_0_0                  (weightFifo_0_pop_payload_0_0_0_0[7:0]                                  ), //i
    .weights_payload_0_0_0_1                  (weightFifo_0_pop_payload_0_0_0_1[7:0]                                  ), //i
    .weights_payload_0_0_0_2                  (weightFifo_0_pop_payload_0_0_0_2[7:0]                                  ), //i
    .weights_payload_0_0_0_3                  (weightFifo_0_pop_payload_0_0_0_3[7:0]                                  ), //i
    .weights_payload_0_0_1_0                  (weightFifo_0_pop_payload_0_0_1_0[7:0]                                  ), //i
    .weights_payload_0_0_1_1                  (weightFifo_0_pop_payload_0_0_1_1[7:0]                                  ), //i
    .weights_payload_0_0_1_2                  (weightFifo_0_pop_payload_0_0_1_2[7:0]                                  ), //i
    .weights_payload_0_0_1_3                  (weightFifo_0_pop_payload_0_0_1_3[7:0]                                  ), //i
    .weights_payload_0_0_2_0                  (weightFifo_0_pop_payload_0_0_2_0[7:0]                                  ), //i
    .weights_payload_0_0_2_1                  (weightFifo_0_pop_payload_0_0_2_1[7:0]                                  ), //i
    .weights_payload_0_0_2_2                  (weightFifo_0_pop_payload_0_0_2_2[7:0]                                  ), //i
    .weights_payload_0_0_2_3                  (weightFifo_0_pop_payload_0_0_2_3[7:0]                                  ), //i
    .weights_payload_0_1_0_0                  (weightFifo_0_pop_payload_0_1_0_0[7:0]                                  ), //i
    .weights_payload_0_1_0_1                  (weightFifo_0_pop_payload_0_1_0_1[7:0]                                  ), //i
    .weights_payload_0_1_0_2                  (weightFifo_0_pop_payload_0_1_0_2[7:0]                                  ), //i
    .weights_payload_0_1_0_3                  (weightFifo_0_pop_payload_0_1_0_3[7:0]                                  ), //i
    .weights_payload_0_1_1_0                  (weightFifo_0_pop_payload_0_1_1_0[7:0]                                  ), //i
    .weights_payload_0_1_1_1                  (weightFifo_0_pop_payload_0_1_1_1[7:0]                                  ), //i
    .weights_payload_0_1_1_2                  (weightFifo_0_pop_payload_0_1_1_2[7:0]                                  ), //i
    .weights_payload_0_1_1_3                  (weightFifo_0_pop_payload_0_1_1_3[7:0]                                  ), //i
    .weights_payload_0_1_2_0                  (weightFifo_0_pop_payload_0_1_2_0[7:0]                                  ), //i
    .weights_payload_0_1_2_1                  (weightFifo_0_pop_payload_0_1_2_1[7:0]                                  ), //i
    .weights_payload_0_1_2_2                  (weightFifo_0_pop_payload_0_1_2_2[7:0]                                  ), //i
    .weights_payload_0_1_2_3                  (weightFifo_0_pop_payload_0_1_2_3[7:0]                                  ), //i
    .weights_payload_0_2_0_0                  (weightFifo_0_pop_payload_0_2_0_0[7:0]                                  ), //i
    .weights_payload_0_2_0_1                  (weightFifo_0_pop_payload_0_2_0_1[7:0]                                  ), //i
    .weights_payload_0_2_0_2                  (weightFifo_0_pop_payload_0_2_0_2[7:0]                                  ), //i
    .weights_payload_0_2_0_3                  (weightFifo_0_pop_payload_0_2_0_3[7:0]                                  ), //i
    .weights_payload_0_2_1_0                  (weightFifo_0_pop_payload_0_2_1_0[7:0]                                  ), //i
    .weights_payload_0_2_1_1                  (weightFifo_0_pop_payload_0_2_1_1[7:0]                                  ), //i
    .weights_payload_0_2_1_2                  (weightFifo_0_pop_payload_0_2_1_2[7:0]                                  ), //i
    .weights_payload_0_2_1_3                  (weightFifo_0_pop_payload_0_2_1_3[7:0]                                  ), //i
    .weights_payload_0_2_2_0                  (weightFifo_0_pop_payload_0_2_2_0[7:0]                                  ), //i
    .weights_payload_0_2_2_1                  (weightFifo_0_pop_payload_0_2_2_1[7:0]                                  ), //i
    .weights_payload_0_2_2_2                  (weightFifo_0_pop_payload_0_2_2_2[7:0]                                  ), //i
    .weights_payload_0_2_2_3                  (weightFifo_0_pop_payload_0_2_2_3[7:0]                                  ), //i
    .weights_payload_1_0_0_0                  (weightFifo_0_pop_payload_1_0_0_0[7:0]                                  ), //i
    .weights_payload_1_0_0_1                  (weightFifo_0_pop_payload_1_0_0_1[7:0]                                  ), //i
    .weights_payload_1_0_0_2                  (weightFifo_0_pop_payload_1_0_0_2[7:0]                                  ), //i
    .weights_payload_1_0_0_3                  (weightFifo_0_pop_payload_1_0_0_3[7:0]                                  ), //i
    .weights_payload_1_0_1_0                  (weightFifo_0_pop_payload_1_0_1_0[7:0]                                  ), //i
    .weights_payload_1_0_1_1                  (weightFifo_0_pop_payload_1_0_1_1[7:0]                                  ), //i
    .weights_payload_1_0_1_2                  (weightFifo_0_pop_payload_1_0_1_2[7:0]                                  ), //i
    .weights_payload_1_0_1_3                  (weightFifo_0_pop_payload_1_0_1_3[7:0]                                  ), //i
    .weights_payload_1_0_2_0                  (weightFifo_0_pop_payload_1_0_2_0[7:0]                                  ), //i
    .weights_payload_1_0_2_1                  (weightFifo_0_pop_payload_1_0_2_1[7:0]                                  ), //i
    .weights_payload_1_0_2_2                  (weightFifo_0_pop_payload_1_0_2_2[7:0]                                  ), //i
    .weights_payload_1_0_2_3                  (weightFifo_0_pop_payload_1_0_2_3[7:0]                                  ), //i
    .weights_payload_1_1_0_0                  (weightFifo_0_pop_payload_1_1_0_0[7:0]                                  ), //i
    .weights_payload_1_1_0_1                  (weightFifo_0_pop_payload_1_1_0_1[7:0]                                  ), //i
    .weights_payload_1_1_0_2                  (weightFifo_0_pop_payload_1_1_0_2[7:0]                                  ), //i
    .weights_payload_1_1_0_3                  (weightFifo_0_pop_payload_1_1_0_3[7:0]                                  ), //i
    .weights_payload_1_1_1_0                  (weightFifo_0_pop_payload_1_1_1_0[7:0]                                  ), //i
    .weights_payload_1_1_1_1                  (weightFifo_0_pop_payload_1_1_1_1[7:0]                                  ), //i
    .weights_payload_1_1_1_2                  (weightFifo_0_pop_payload_1_1_1_2[7:0]                                  ), //i
    .weights_payload_1_1_1_3                  (weightFifo_0_pop_payload_1_1_1_3[7:0]                                  ), //i
    .weights_payload_1_1_2_0                  (weightFifo_0_pop_payload_1_1_2_0[7:0]                                  ), //i
    .weights_payload_1_1_2_1                  (weightFifo_0_pop_payload_1_1_2_1[7:0]                                  ), //i
    .weights_payload_1_1_2_2                  (weightFifo_0_pop_payload_1_1_2_2[7:0]                                  ), //i
    .weights_payload_1_1_2_3                  (weightFifo_0_pop_payload_1_1_2_3[7:0]                                  ), //i
    .weights_payload_1_2_0_0                  (weightFifo_0_pop_payload_1_2_0_0[7:0]                                  ), //i
    .weights_payload_1_2_0_1                  (weightFifo_0_pop_payload_1_2_0_1[7:0]                                  ), //i
    .weights_payload_1_2_0_2                  (weightFifo_0_pop_payload_1_2_0_2[7:0]                                  ), //i
    .weights_payload_1_2_0_3                  (weightFifo_0_pop_payload_1_2_0_3[7:0]                                  ), //i
    .weights_payload_1_2_1_0                  (weightFifo_0_pop_payload_1_2_1_0[7:0]                                  ), //i
    .weights_payload_1_2_1_1                  (weightFifo_0_pop_payload_1_2_1_1[7:0]                                  ), //i
    .weights_payload_1_2_1_2                  (weightFifo_0_pop_payload_1_2_1_2[7:0]                                  ), //i
    .weights_payload_1_2_1_3                  (weightFifo_0_pop_payload_1_2_1_3[7:0]                                  ), //i
    .weights_payload_1_2_2_0                  (weightFifo_0_pop_payload_1_2_2_0[7:0]                                  ), //i
    .weights_payload_1_2_2_1                  (weightFifo_0_pop_payload_1_2_2_1[7:0]                                  ), //i
    .weights_payload_1_2_2_2                  (weightFifo_0_pop_payload_1_2_2_2[7:0]                                  ), //i
    .weights_payload_1_2_2_3                  (weightFifo_0_pop_payload_1_2_2_3[7:0]                                  ), //i
    .outputs_valid                            (unit_0_outputs_valid                                                   ), //o
    .outputs_ready                            (accOutputs_0_ready                                                     ), //i
    .outputs_payload_frame_line_pixel_0       (unit_0_outputs_payload_frame_line_pixel_0[23:0]                        ), //o
    .outputs_payload_frame_line_pixel_1       (unit_0_outputs_payload_frame_line_pixel_1[23:0]                        ), //o
    .outputs_payload_frame_line_endOfLine     (unit_0_outputs_payload_frame_line_endOfLine                            ), //o
    .outputs_payload_frame_endOfFrame         (unit_0_outputs_payload_frame_endOfFrame                                ), //o
    .outputs_payload_endOfPack                (unit_0_outputs_payload_endOfPack                                       ), //o
    .clk                                      (clk                                                                    ), //i
    .reset                                    (reset                                                                  )  //i
  );
  PecaUnit unit_1 (
    .numberOfInputFrames                      (numberOfInputFrames[7:0]                                               ), //i
    .numberOfOutputFrames                     (numberOfOutputFrames[7:0]                                              ), //i
    .inputs_valid                             (window_videoOut_fork_io_outputs_1_valid                                ), //i
    .inputs_ready                             (unit_1_inputs_ready                                                    ), //o
    .inputs_payload_frame_line_pixel_0_0_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_0_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_0_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_0_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_0_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_0_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_0_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_0_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_1_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_1_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_1_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_1_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_1_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_1_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_1_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_1_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_2_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_2_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_2_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_2_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_2_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_2_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_0_2_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_0_2_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_0_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_0_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_0_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_0_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_0_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_0_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_0_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_0_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_1_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_1_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_1_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_1_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_1_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_1_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_1_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_1_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_2_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_2_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_2_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_2_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_2_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_2_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_1_2_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_1_2_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_0_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_0_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_0_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_0_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_0_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_0_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_0_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_0_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_1_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_1_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_1_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_1_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_1_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_1_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_1_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_1_3[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_2_0    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_2_0[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_2_1    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_2_1[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_2_2    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_2_2[7:0]  ), //i
    .inputs_payload_frame_line_pixel_2_2_3    (window_videoOut_fork_io_outputs_1_payload_frame_line_pixel_2_2_3[7:0]  ), //i
    .inputs_payload_frame_line_endOfLine      (window_videoOut_fork_io_outputs_1_payload_frame_line_endOfLine         ), //i
    .inputs_payload_frame_endOfFrame          (window_videoOut_fork_io_outputs_1_payload_frame_endOfFrame             ), //i
    .inputs_payload_endOfPack                 (window_videoOut_fork_io_outputs_1_payload_endOfPack                    ), //i
    .weights_valid                            (weightFifo_1_pop_valid                                                 ), //i
    .weights_ready                            (unit_1_weights_ready                                                   ), //o
    .weights_payload_0_0_0_0                  (weightFifo_1_pop_payload_0_0_0_0[7:0]                                  ), //i
    .weights_payload_0_0_0_1                  (weightFifo_1_pop_payload_0_0_0_1[7:0]                                  ), //i
    .weights_payload_0_0_0_2                  (weightFifo_1_pop_payload_0_0_0_2[7:0]                                  ), //i
    .weights_payload_0_0_0_3                  (weightFifo_1_pop_payload_0_0_0_3[7:0]                                  ), //i
    .weights_payload_0_0_1_0                  (weightFifo_1_pop_payload_0_0_1_0[7:0]                                  ), //i
    .weights_payload_0_0_1_1                  (weightFifo_1_pop_payload_0_0_1_1[7:0]                                  ), //i
    .weights_payload_0_0_1_2                  (weightFifo_1_pop_payload_0_0_1_2[7:0]                                  ), //i
    .weights_payload_0_0_1_3                  (weightFifo_1_pop_payload_0_0_1_3[7:0]                                  ), //i
    .weights_payload_0_0_2_0                  (weightFifo_1_pop_payload_0_0_2_0[7:0]                                  ), //i
    .weights_payload_0_0_2_1                  (weightFifo_1_pop_payload_0_0_2_1[7:0]                                  ), //i
    .weights_payload_0_0_2_2                  (weightFifo_1_pop_payload_0_0_2_2[7:0]                                  ), //i
    .weights_payload_0_0_2_3                  (weightFifo_1_pop_payload_0_0_2_3[7:0]                                  ), //i
    .weights_payload_0_1_0_0                  (weightFifo_1_pop_payload_0_1_0_0[7:0]                                  ), //i
    .weights_payload_0_1_0_1                  (weightFifo_1_pop_payload_0_1_0_1[7:0]                                  ), //i
    .weights_payload_0_1_0_2                  (weightFifo_1_pop_payload_0_1_0_2[7:0]                                  ), //i
    .weights_payload_0_1_0_3                  (weightFifo_1_pop_payload_0_1_0_3[7:0]                                  ), //i
    .weights_payload_0_1_1_0                  (weightFifo_1_pop_payload_0_1_1_0[7:0]                                  ), //i
    .weights_payload_0_1_1_1                  (weightFifo_1_pop_payload_0_1_1_1[7:0]                                  ), //i
    .weights_payload_0_1_1_2                  (weightFifo_1_pop_payload_0_1_1_2[7:0]                                  ), //i
    .weights_payload_0_1_1_3                  (weightFifo_1_pop_payload_0_1_1_3[7:0]                                  ), //i
    .weights_payload_0_1_2_0                  (weightFifo_1_pop_payload_0_1_2_0[7:0]                                  ), //i
    .weights_payload_0_1_2_1                  (weightFifo_1_pop_payload_0_1_2_1[7:0]                                  ), //i
    .weights_payload_0_1_2_2                  (weightFifo_1_pop_payload_0_1_2_2[7:0]                                  ), //i
    .weights_payload_0_1_2_3                  (weightFifo_1_pop_payload_0_1_2_3[7:0]                                  ), //i
    .weights_payload_0_2_0_0                  (weightFifo_1_pop_payload_0_2_0_0[7:0]                                  ), //i
    .weights_payload_0_2_0_1                  (weightFifo_1_pop_payload_0_2_0_1[7:0]                                  ), //i
    .weights_payload_0_2_0_2                  (weightFifo_1_pop_payload_0_2_0_2[7:0]                                  ), //i
    .weights_payload_0_2_0_3                  (weightFifo_1_pop_payload_0_2_0_3[7:0]                                  ), //i
    .weights_payload_0_2_1_0                  (weightFifo_1_pop_payload_0_2_1_0[7:0]                                  ), //i
    .weights_payload_0_2_1_1                  (weightFifo_1_pop_payload_0_2_1_1[7:0]                                  ), //i
    .weights_payload_0_2_1_2                  (weightFifo_1_pop_payload_0_2_1_2[7:0]                                  ), //i
    .weights_payload_0_2_1_3                  (weightFifo_1_pop_payload_0_2_1_3[7:0]                                  ), //i
    .weights_payload_0_2_2_0                  (weightFifo_1_pop_payload_0_2_2_0[7:0]                                  ), //i
    .weights_payload_0_2_2_1                  (weightFifo_1_pop_payload_0_2_2_1[7:0]                                  ), //i
    .weights_payload_0_2_2_2                  (weightFifo_1_pop_payload_0_2_2_2[7:0]                                  ), //i
    .weights_payload_0_2_2_3                  (weightFifo_1_pop_payload_0_2_2_3[7:0]                                  ), //i
    .weights_payload_1_0_0_0                  (weightFifo_1_pop_payload_1_0_0_0[7:0]                                  ), //i
    .weights_payload_1_0_0_1                  (weightFifo_1_pop_payload_1_0_0_1[7:0]                                  ), //i
    .weights_payload_1_0_0_2                  (weightFifo_1_pop_payload_1_0_0_2[7:0]                                  ), //i
    .weights_payload_1_0_0_3                  (weightFifo_1_pop_payload_1_0_0_3[7:0]                                  ), //i
    .weights_payload_1_0_1_0                  (weightFifo_1_pop_payload_1_0_1_0[7:0]                                  ), //i
    .weights_payload_1_0_1_1                  (weightFifo_1_pop_payload_1_0_1_1[7:0]                                  ), //i
    .weights_payload_1_0_1_2                  (weightFifo_1_pop_payload_1_0_1_2[7:0]                                  ), //i
    .weights_payload_1_0_1_3                  (weightFifo_1_pop_payload_1_0_1_3[7:0]                                  ), //i
    .weights_payload_1_0_2_0                  (weightFifo_1_pop_payload_1_0_2_0[7:0]                                  ), //i
    .weights_payload_1_0_2_1                  (weightFifo_1_pop_payload_1_0_2_1[7:0]                                  ), //i
    .weights_payload_1_0_2_2                  (weightFifo_1_pop_payload_1_0_2_2[7:0]                                  ), //i
    .weights_payload_1_0_2_3                  (weightFifo_1_pop_payload_1_0_2_3[7:0]                                  ), //i
    .weights_payload_1_1_0_0                  (weightFifo_1_pop_payload_1_1_0_0[7:0]                                  ), //i
    .weights_payload_1_1_0_1                  (weightFifo_1_pop_payload_1_1_0_1[7:0]                                  ), //i
    .weights_payload_1_1_0_2                  (weightFifo_1_pop_payload_1_1_0_2[7:0]                                  ), //i
    .weights_payload_1_1_0_3                  (weightFifo_1_pop_payload_1_1_0_3[7:0]                                  ), //i
    .weights_payload_1_1_1_0                  (weightFifo_1_pop_payload_1_1_1_0[7:0]                                  ), //i
    .weights_payload_1_1_1_1                  (weightFifo_1_pop_payload_1_1_1_1[7:0]                                  ), //i
    .weights_payload_1_1_1_2                  (weightFifo_1_pop_payload_1_1_1_2[7:0]                                  ), //i
    .weights_payload_1_1_1_3                  (weightFifo_1_pop_payload_1_1_1_3[7:0]                                  ), //i
    .weights_payload_1_1_2_0                  (weightFifo_1_pop_payload_1_1_2_0[7:0]                                  ), //i
    .weights_payload_1_1_2_1                  (weightFifo_1_pop_payload_1_1_2_1[7:0]                                  ), //i
    .weights_payload_1_1_2_2                  (weightFifo_1_pop_payload_1_1_2_2[7:0]                                  ), //i
    .weights_payload_1_1_2_3                  (weightFifo_1_pop_payload_1_1_2_3[7:0]                                  ), //i
    .weights_payload_1_2_0_0                  (weightFifo_1_pop_payload_1_2_0_0[7:0]                                  ), //i
    .weights_payload_1_2_0_1                  (weightFifo_1_pop_payload_1_2_0_1[7:0]                                  ), //i
    .weights_payload_1_2_0_2                  (weightFifo_1_pop_payload_1_2_0_2[7:0]                                  ), //i
    .weights_payload_1_2_0_3                  (weightFifo_1_pop_payload_1_2_0_3[7:0]                                  ), //i
    .weights_payload_1_2_1_0                  (weightFifo_1_pop_payload_1_2_1_0[7:0]                                  ), //i
    .weights_payload_1_2_1_1                  (weightFifo_1_pop_payload_1_2_1_1[7:0]                                  ), //i
    .weights_payload_1_2_1_2                  (weightFifo_1_pop_payload_1_2_1_2[7:0]                                  ), //i
    .weights_payload_1_2_1_3                  (weightFifo_1_pop_payload_1_2_1_3[7:0]                                  ), //i
    .weights_payload_1_2_2_0                  (weightFifo_1_pop_payload_1_2_2_0[7:0]                                  ), //i
    .weights_payload_1_2_2_1                  (weightFifo_1_pop_payload_1_2_2_1[7:0]                                  ), //i
    .weights_payload_1_2_2_2                  (weightFifo_1_pop_payload_1_2_2_2[7:0]                                  ), //i
    .weights_payload_1_2_2_3                  (weightFifo_1_pop_payload_1_2_2_3[7:0]                                  ), //i
    .outputs_valid                            (unit_1_outputs_valid                                                   ), //o
    .outputs_ready                            (accOutputs_1_ready                                                     ), //i
    .outputs_payload_frame_line_pixel_0       (unit_1_outputs_payload_frame_line_pixel_0[23:0]                        ), //o
    .outputs_payload_frame_line_pixel_1       (unit_1_outputs_payload_frame_line_pixel_1[23:0]                        ), //o
    .outputs_payload_frame_line_endOfLine     (unit_1_outputs_payload_frame_line_endOfLine                            ), //o
    .outputs_payload_frame_endOfFrame         (unit_1_outputs_payload_frame_endOfFrame                                ), //o
    .outputs_payload_endOfPack                (unit_1_outputs_payload_endOfPack                                       ), //o
    .clk                                      (clk                                                                    ), //i
    .reset                                    (reset                                                                  )  //i
  );
  VideoPooling pool (
    .videoIn_valid                            (streamDemux_3_io_outputs_1_valid                            ), //i
    .videoIn_ready                            (pool_videoIn_ready                                          ), //o
    .videoIn_payload_frame_line_pixel_0       (streamDemux_3_io_outputs_1_payload_frame_line_pixel_0[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_1       (streamDemux_3_io_outputs_1_payload_frame_line_pixel_1[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_2       (streamDemux_3_io_outputs_1_payload_frame_line_pixel_2[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_3       (streamDemux_3_io_outputs_1_payload_frame_line_pixel_3[7:0]  ), //i
    .videoIn_payload_frame_line_endOfLine     (streamDemux_3_io_outputs_1_payload_frame_line_endOfLine     ), //i
    .videoIn_payload_frame_endOfFrame         (streamDemux_3_io_outputs_1_payload_frame_endOfFrame         ), //i
    .videoIn_payload_endOfPack                (streamDemux_3_io_outputs_1_payload_endOfPack                ), //i
    .videoOut_valid                           (pool_videoOut_valid                                         ), //o
    .videoOut_ready                           (streamMux_1_io_inputs_1_ready                               ), //i
    .videoOut_payload_frame_line_pixel_0      (pool_videoOut_payload_frame_line_pixel_0[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_1      (pool_videoOut_payload_frame_line_pixel_1[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_2      (pool_videoOut_payload_frame_line_pixel_2[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_3      (pool_videoOut_payload_frame_line_pixel_3[7:0]               ), //o
    .videoOut_payload_frame_line_endOfLine    (pool_videoOut_payload_frame_line_endOfLine                  ), //o
    .videoOut_payload_frame_endOfFrame        (pool_videoOut_payload_frame_endOfFrame                      ), //o
    .videoOut_payload_endOfPack               (pool_videoOut_payload_endOfPack                             ), //o
    .clk                                      (clk                                                         ), //i
    .reset                                    (reset                                                       )  //i
  );
  LookUpTable table_1 (
    .newTable_valid      (tableAdapted_valid              ), //i
    .newTable_ready      (table_1_newTable_ready          ), //o
    .newTable_payload    (tableAdapted_payload[7:0]       ), //i
    .index_valid         (signalTrim_valid                ), //i
    .index_ready         (table_1_index_ready             ), //o
    .index_payload_0     (signalTrim_payload_0[7:0]       ), //i
    .index_payload_1     (signalTrim_payload_1[7:0]       ), //i
    .index_payload_2     (signalTrim_payload_2[7:0]       ), //i
    .index_payload_3     (signalTrim_payload_3[7:0]       ), //i
    .value_valid         (table_1_value_valid             ), //o
    .value_ready         (table_1_value_transmuted_ready  ), //i
    .value_payload_0     (table_1_value_payload_0[7:0]    ), //o
    .value_payload_1     (table_1_value_payload_1[7:0]    ), //o
    .value_payload_2     (table_1_value_payload_2[7:0]    ), //o
    .value_payload_3     (table_1_value_payload_3[7:0]    ), //o
    .clk                 (clk                             ), //i
    .reset               (reset                           )  //i
  );
  StreamDemux streamDemux_2 (
    .io_select                       (tmp_io_select_2                                  ), //i
    .io_input_valid                  (weightsAdapted_valid                             ), //i
    .io_input_ready                  (streamDemux_2_io_input_ready                     ), //o
    .io_input_payload_0_0_0_0        (weightsAdapted_payload_0_0_0_0[7:0]              ), //i
    .io_input_payload_0_0_0_1        (weightsAdapted_payload_0_0_0_1[7:0]              ), //i
    .io_input_payload_0_0_0_2        (weightsAdapted_payload_0_0_0_2[7:0]              ), //i
    .io_input_payload_0_0_0_3        (weightsAdapted_payload_0_0_0_3[7:0]              ), //i
    .io_input_payload_0_0_1_0        (weightsAdapted_payload_0_0_1_0[7:0]              ), //i
    .io_input_payload_0_0_1_1        (weightsAdapted_payload_0_0_1_1[7:0]              ), //i
    .io_input_payload_0_0_1_2        (weightsAdapted_payload_0_0_1_2[7:0]              ), //i
    .io_input_payload_0_0_1_3        (weightsAdapted_payload_0_0_1_3[7:0]              ), //i
    .io_input_payload_0_0_2_0        (weightsAdapted_payload_0_0_2_0[7:0]              ), //i
    .io_input_payload_0_0_2_1        (weightsAdapted_payload_0_0_2_1[7:0]              ), //i
    .io_input_payload_0_0_2_2        (weightsAdapted_payload_0_0_2_2[7:0]              ), //i
    .io_input_payload_0_0_2_3        (weightsAdapted_payload_0_0_2_3[7:0]              ), //i
    .io_input_payload_0_1_0_0        (weightsAdapted_payload_0_1_0_0[7:0]              ), //i
    .io_input_payload_0_1_0_1        (weightsAdapted_payload_0_1_0_1[7:0]              ), //i
    .io_input_payload_0_1_0_2        (weightsAdapted_payload_0_1_0_2[7:0]              ), //i
    .io_input_payload_0_1_0_3        (weightsAdapted_payload_0_1_0_3[7:0]              ), //i
    .io_input_payload_0_1_1_0        (weightsAdapted_payload_0_1_1_0[7:0]              ), //i
    .io_input_payload_0_1_1_1        (weightsAdapted_payload_0_1_1_1[7:0]              ), //i
    .io_input_payload_0_1_1_2        (weightsAdapted_payload_0_1_1_2[7:0]              ), //i
    .io_input_payload_0_1_1_3        (weightsAdapted_payload_0_1_1_3[7:0]              ), //i
    .io_input_payload_0_1_2_0        (weightsAdapted_payload_0_1_2_0[7:0]              ), //i
    .io_input_payload_0_1_2_1        (weightsAdapted_payload_0_1_2_1[7:0]              ), //i
    .io_input_payload_0_1_2_2        (weightsAdapted_payload_0_1_2_2[7:0]              ), //i
    .io_input_payload_0_1_2_3        (weightsAdapted_payload_0_1_2_3[7:0]              ), //i
    .io_input_payload_0_2_0_0        (weightsAdapted_payload_0_2_0_0[7:0]              ), //i
    .io_input_payload_0_2_0_1        (weightsAdapted_payload_0_2_0_1[7:0]              ), //i
    .io_input_payload_0_2_0_2        (weightsAdapted_payload_0_2_0_2[7:0]              ), //i
    .io_input_payload_0_2_0_3        (weightsAdapted_payload_0_2_0_3[7:0]              ), //i
    .io_input_payload_0_2_1_0        (weightsAdapted_payload_0_2_1_0[7:0]              ), //i
    .io_input_payload_0_2_1_1        (weightsAdapted_payload_0_2_1_1[7:0]              ), //i
    .io_input_payload_0_2_1_2        (weightsAdapted_payload_0_2_1_2[7:0]              ), //i
    .io_input_payload_0_2_1_3        (weightsAdapted_payload_0_2_1_3[7:0]              ), //i
    .io_input_payload_0_2_2_0        (weightsAdapted_payload_0_2_2_0[7:0]              ), //i
    .io_input_payload_0_2_2_1        (weightsAdapted_payload_0_2_2_1[7:0]              ), //i
    .io_input_payload_0_2_2_2        (weightsAdapted_payload_0_2_2_2[7:0]              ), //i
    .io_input_payload_0_2_2_3        (weightsAdapted_payload_0_2_2_3[7:0]              ), //i
    .io_input_payload_1_0_0_0        (weightsAdapted_payload_1_0_0_0[7:0]              ), //i
    .io_input_payload_1_0_0_1        (weightsAdapted_payload_1_0_0_1[7:0]              ), //i
    .io_input_payload_1_0_0_2        (weightsAdapted_payload_1_0_0_2[7:0]              ), //i
    .io_input_payload_1_0_0_3        (weightsAdapted_payload_1_0_0_3[7:0]              ), //i
    .io_input_payload_1_0_1_0        (weightsAdapted_payload_1_0_1_0[7:0]              ), //i
    .io_input_payload_1_0_1_1        (weightsAdapted_payload_1_0_1_1[7:0]              ), //i
    .io_input_payload_1_0_1_2        (weightsAdapted_payload_1_0_1_2[7:0]              ), //i
    .io_input_payload_1_0_1_3        (weightsAdapted_payload_1_0_1_3[7:0]              ), //i
    .io_input_payload_1_0_2_0        (weightsAdapted_payload_1_0_2_0[7:0]              ), //i
    .io_input_payload_1_0_2_1        (weightsAdapted_payload_1_0_2_1[7:0]              ), //i
    .io_input_payload_1_0_2_2        (weightsAdapted_payload_1_0_2_2[7:0]              ), //i
    .io_input_payload_1_0_2_3        (weightsAdapted_payload_1_0_2_3[7:0]              ), //i
    .io_input_payload_1_1_0_0        (weightsAdapted_payload_1_1_0_0[7:0]              ), //i
    .io_input_payload_1_1_0_1        (weightsAdapted_payload_1_1_0_1[7:0]              ), //i
    .io_input_payload_1_1_0_2        (weightsAdapted_payload_1_1_0_2[7:0]              ), //i
    .io_input_payload_1_1_0_3        (weightsAdapted_payload_1_1_0_3[7:0]              ), //i
    .io_input_payload_1_1_1_0        (weightsAdapted_payload_1_1_1_0[7:0]              ), //i
    .io_input_payload_1_1_1_1        (weightsAdapted_payload_1_1_1_1[7:0]              ), //i
    .io_input_payload_1_1_1_2        (weightsAdapted_payload_1_1_1_2[7:0]              ), //i
    .io_input_payload_1_1_1_3        (weightsAdapted_payload_1_1_1_3[7:0]              ), //i
    .io_input_payload_1_1_2_0        (weightsAdapted_payload_1_1_2_0[7:0]              ), //i
    .io_input_payload_1_1_2_1        (weightsAdapted_payload_1_1_2_1[7:0]              ), //i
    .io_input_payload_1_1_2_2        (weightsAdapted_payload_1_1_2_2[7:0]              ), //i
    .io_input_payload_1_1_2_3        (weightsAdapted_payload_1_1_2_3[7:0]              ), //i
    .io_input_payload_1_2_0_0        (weightsAdapted_payload_1_2_0_0[7:0]              ), //i
    .io_input_payload_1_2_0_1        (weightsAdapted_payload_1_2_0_1[7:0]              ), //i
    .io_input_payload_1_2_0_2        (weightsAdapted_payload_1_2_0_2[7:0]              ), //i
    .io_input_payload_1_2_0_3        (weightsAdapted_payload_1_2_0_3[7:0]              ), //i
    .io_input_payload_1_2_1_0        (weightsAdapted_payload_1_2_1_0[7:0]              ), //i
    .io_input_payload_1_2_1_1        (weightsAdapted_payload_1_2_1_1[7:0]              ), //i
    .io_input_payload_1_2_1_2        (weightsAdapted_payload_1_2_1_2[7:0]              ), //i
    .io_input_payload_1_2_1_3        (weightsAdapted_payload_1_2_1_3[7:0]              ), //i
    .io_input_payload_1_2_2_0        (weightsAdapted_payload_1_2_2_0[7:0]              ), //i
    .io_input_payload_1_2_2_1        (weightsAdapted_payload_1_2_2_1[7:0]              ), //i
    .io_input_payload_1_2_2_2        (weightsAdapted_payload_1_2_2_2[7:0]              ), //i
    .io_input_payload_1_2_2_3        (weightsAdapted_payload_1_2_2_3[7:0]              ), //i
    .io_outputs_0_valid              (streamDemux_2_io_outputs_0_valid                 ), //o
    .io_outputs_0_ready              (weightFifo_0_push_ready                          ), //i
    .io_outputs_0_payload_0_0_0_0    (streamDemux_2_io_outputs_0_payload_0_0_0_0[7:0]  ), //o
    .io_outputs_0_payload_0_0_0_1    (streamDemux_2_io_outputs_0_payload_0_0_0_1[7:0]  ), //o
    .io_outputs_0_payload_0_0_0_2    (streamDemux_2_io_outputs_0_payload_0_0_0_2[7:0]  ), //o
    .io_outputs_0_payload_0_0_0_3    (streamDemux_2_io_outputs_0_payload_0_0_0_3[7:0]  ), //o
    .io_outputs_0_payload_0_0_1_0    (streamDemux_2_io_outputs_0_payload_0_0_1_0[7:0]  ), //o
    .io_outputs_0_payload_0_0_1_1    (streamDemux_2_io_outputs_0_payload_0_0_1_1[7:0]  ), //o
    .io_outputs_0_payload_0_0_1_2    (streamDemux_2_io_outputs_0_payload_0_0_1_2[7:0]  ), //o
    .io_outputs_0_payload_0_0_1_3    (streamDemux_2_io_outputs_0_payload_0_0_1_3[7:0]  ), //o
    .io_outputs_0_payload_0_0_2_0    (streamDemux_2_io_outputs_0_payload_0_0_2_0[7:0]  ), //o
    .io_outputs_0_payload_0_0_2_1    (streamDemux_2_io_outputs_0_payload_0_0_2_1[7:0]  ), //o
    .io_outputs_0_payload_0_0_2_2    (streamDemux_2_io_outputs_0_payload_0_0_2_2[7:0]  ), //o
    .io_outputs_0_payload_0_0_2_3    (streamDemux_2_io_outputs_0_payload_0_0_2_3[7:0]  ), //o
    .io_outputs_0_payload_0_1_0_0    (streamDemux_2_io_outputs_0_payload_0_1_0_0[7:0]  ), //o
    .io_outputs_0_payload_0_1_0_1    (streamDemux_2_io_outputs_0_payload_0_1_0_1[7:0]  ), //o
    .io_outputs_0_payload_0_1_0_2    (streamDemux_2_io_outputs_0_payload_0_1_0_2[7:0]  ), //o
    .io_outputs_0_payload_0_1_0_3    (streamDemux_2_io_outputs_0_payload_0_1_0_3[7:0]  ), //o
    .io_outputs_0_payload_0_1_1_0    (streamDemux_2_io_outputs_0_payload_0_1_1_0[7:0]  ), //o
    .io_outputs_0_payload_0_1_1_1    (streamDemux_2_io_outputs_0_payload_0_1_1_1[7:0]  ), //o
    .io_outputs_0_payload_0_1_1_2    (streamDemux_2_io_outputs_0_payload_0_1_1_2[7:0]  ), //o
    .io_outputs_0_payload_0_1_1_3    (streamDemux_2_io_outputs_0_payload_0_1_1_3[7:0]  ), //o
    .io_outputs_0_payload_0_1_2_0    (streamDemux_2_io_outputs_0_payload_0_1_2_0[7:0]  ), //o
    .io_outputs_0_payload_0_1_2_1    (streamDemux_2_io_outputs_0_payload_0_1_2_1[7:0]  ), //o
    .io_outputs_0_payload_0_1_2_2    (streamDemux_2_io_outputs_0_payload_0_1_2_2[7:0]  ), //o
    .io_outputs_0_payload_0_1_2_3    (streamDemux_2_io_outputs_0_payload_0_1_2_3[7:0]  ), //o
    .io_outputs_0_payload_0_2_0_0    (streamDemux_2_io_outputs_0_payload_0_2_0_0[7:0]  ), //o
    .io_outputs_0_payload_0_2_0_1    (streamDemux_2_io_outputs_0_payload_0_2_0_1[7:0]  ), //o
    .io_outputs_0_payload_0_2_0_2    (streamDemux_2_io_outputs_0_payload_0_2_0_2[7:0]  ), //o
    .io_outputs_0_payload_0_2_0_3    (streamDemux_2_io_outputs_0_payload_0_2_0_3[7:0]  ), //o
    .io_outputs_0_payload_0_2_1_0    (streamDemux_2_io_outputs_0_payload_0_2_1_0[7:0]  ), //o
    .io_outputs_0_payload_0_2_1_1    (streamDemux_2_io_outputs_0_payload_0_2_1_1[7:0]  ), //o
    .io_outputs_0_payload_0_2_1_2    (streamDemux_2_io_outputs_0_payload_0_2_1_2[7:0]  ), //o
    .io_outputs_0_payload_0_2_1_3    (streamDemux_2_io_outputs_0_payload_0_2_1_3[7:0]  ), //o
    .io_outputs_0_payload_0_2_2_0    (streamDemux_2_io_outputs_0_payload_0_2_2_0[7:0]  ), //o
    .io_outputs_0_payload_0_2_2_1    (streamDemux_2_io_outputs_0_payload_0_2_2_1[7:0]  ), //o
    .io_outputs_0_payload_0_2_2_2    (streamDemux_2_io_outputs_0_payload_0_2_2_2[7:0]  ), //o
    .io_outputs_0_payload_0_2_2_3    (streamDemux_2_io_outputs_0_payload_0_2_2_3[7:0]  ), //o
    .io_outputs_0_payload_1_0_0_0    (streamDemux_2_io_outputs_0_payload_1_0_0_0[7:0]  ), //o
    .io_outputs_0_payload_1_0_0_1    (streamDemux_2_io_outputs_0_payload_1_0_0_1[7:0]  ), //o
    .io_outputs_0_payload_1_0_0_2    (streamDemux_2_io_outputs_0_payload_1_0_0_2[7:0]  ), //o
    .io_outputs_0_payload_1_0_0_3    (streamDemux_2_io_outputs_0_payload_1_0_0_3[7:0]  ), //o
    .io_outputs_0_payload_1_0_1_0    (streamDemux_2_io_outputs_0_payload_1_0_1_0[7:0]  ), //o
    .io_outputs_0_payload_1_0_1_1    (streamDemux_2_io_outputs_0_payload_1_0_1_1[7:0]  ), //o
    .io_outputs_0_payload_1_0_1_2    (streamDemux_2_io_outputs_0_payload_1_0_1_2[7:0]  ), //o
    .io_outputs_0_payload_1_0_1_3    (streamDemux_2_io_outputs_0_payload_1_0_1_3[7:0]  ), //o
    .io_outputs_0_payload_1_0_2_0    (streamDemux_2_io_outputs_0_payload_1_0_2_0[7:0]  ), //o
    .io_outputs_0_payload_1_0_2_1    (streamDemux_2_io_outputs_0_payload_1_0_2_1[7:0]  ), //o
    .io_outputs_0_payload_1_0_2_2    (streamDemux_2_io_outputs_0_payload_1_0_2_2[7:0]  ), //o
    .io_outputs_0_payload_1_0_2_3    (streamDemux_2_io_outputs_0_payload_1_0_2_3[7:0]  ), //o
    .io_outputs_0_payload_1_1_0_0    (streamDemux_2_io_outputs_0_payload_1_1_0_0[7:0]  ), //o
    .io_outputs_0_payload_1_1_0_1    (streamDemux_2_io_outputs_0_payload_1_1_0_1[7:0]  ), //o
    .io_outputs_0_payload_1_1_0_2    (streamDemux_2_io_outputs_0_payload_1_1_0_2[7:0]  ), //o
    .io_outputs_0_payload_1_1_0_3    (streamDemux_2_io_outputs_0_payload_1_1_0_3[7:0]  ), //o
    .io_outputs_0_payload_1_1_1_0    (streamDemux_2_io_outputs_0_payload_1_1_1_0[7:0]  ), //o
    .io_outputs_0_payload_1_1_1_1    (streamDemux_2_io_outputs_0_payload_1_1_1_1[7:0]  ), //o
    .io_outputs_0_payload_1_1_1_2    (streamDemux_2_io_outputs_0_payload_1_1_1_2[7:0]  ), //o
    .io_outputs_0_payload_1_1_1_3    (streamDemux_2_io_outputs_0_payload_1_1_1_3[7:0]  ), //o
    .io_outputs_0_payload_1_1_2_0    (streamDemux_2_io_outputs_0_payload_1_1_2_0[7:0]  ), //o
    .io_outputs_0_payload_1_1_2_1    (streamDemux_2_io_outputs_0_payload_1_1_2_1[7:0]  ), //o
    .io_outputs_0_payload_1_1_2_2    (streamDemux_2_io_outputs_0_payload_1_1_2_2[7:0]  ), //o
    .io_outputs_0_payload_1_1_2_3    (streamDemux_2_io_outputs_0_payload_1_1_2_3[7:0]  ), //o
    .io_outputs_0_payload_1_2_0_0    (streamDemux_2_io_outputs_0_payload_1_2_0_0[7:0]  ), //o
    .io_outputs_0_payload_1_2_0_1    (streamDemux_2_io_outputs_0_payload_1_2_0_1[7:0]  ), //o
    .io_outputs_0_payload_1_2_0_2    (streamDemux_2_io_outputs_0_payload_1_2_0_2[7:0]  ), //o
    .io_outputs_0_payload_1_2_0_3    (streamDemux_2_io_outputs_0_payload_1_2_0_3[7:0]  ), //o
    .io_outputs_0_payload_1_2_1_0    (streamDemux_2_io_outputs_0_payload_1_2_1_0[7:0]  ), //o
    .io_outputs_0_payload_1_2_1_1    (streamDemux_2_io_outputs_0_payload_1_2_1_1[7:0]  ), //o
    .io_outputs_0_payload_1_2_1_2    (streamDemux_2_io_outputs_0_payload_1_2_1_2[7:0]  ), //o
    .io_outputs_0_payload_1_2_1_3    (streamDemux_2_io_outputs_0_payload_1_2_1_3[7:0]  ), //o
    .io_outputs_0_payload_1_2_2_0    (streamDemux_2_io_outputs_0_payload_1_2_2_0[7:0]  ), //o
    .io_outputs_0_payload_1_2_2_1    (streamDemux_2_io_outputs_0_payload_1_2_2_1[7:0]  ), //o
    .io_outputs_0_payload_1_2_2_2    (streamDemux_2_io_outputs_0_payload_1_2_2_2[7:0]  ), //o
    .io_outputs_0_payload_1_2_2_3    (streamDemux_2_io_outputs_0_payload_1_2_2_3[7:0]  ), //o
    .io_outputs_1_valid              (streamDemux_2_io_outputs_1_valid                 ), //o
    .io_outputs_1_ready              (weightFifo_1_push_ready                          ), //i
    .io_outputs_1_payload_0_0_0_0    (streamDemux_2_io_outputs_1_payload_0_0_0_0[7:0]  ), //o
    .io_outputs_1_payload_0_0_0_1    (streamDemux_2_io_outputs_1_payload_0_0_0_1[7:0]  ), //o
    .io_outputs_1_payload_0_0_0_2    (streamDemux_2_io_outputs_1_payload_0_0_0_2[7:0]  ), //o
    .io_outputs_1_payload_0_0_0_3    (streamDemux_2_io_outputs_1_payload_0_0_0_3[7:0]  ), //o
    .io_outputs_1_payload_0_0_1_0    (streamDemux_2_io_outputs_1_payload_0_0_1_0[7:0]  ), //o
    .io_outputs_1_payload_0_0_1_1    (streamDemux_2_io_outputs_1_payload_0_0_1_1[7:0]  ), //o
    .io_outputs_1_payload_0_0_1_2    (streamDemux_2_io_outputs_1_payload_0_0_1_2[7:0]  ), //o
    .io_outputs_1_payload_0_0_1_3    (streamDemux_2_io_outputs_1_payload_0_0_1_3[7:0]  ), //o
    .io_outputs_1_payload_0_0_2_0    (streamDemux_2_io_outputs_1_payload_0_0_2_0[7:0]  ), //o
    .io_outputs_1_payload_0_0_2_1    (streamDemux_2_io_outputs_1_payload_0_0_2_1[7:0]  ), //o
    .io_outputs_1_payload_0_0_2_2    (streamDemux_2_io_outputs_1_payload_0_0_2_2[7:0]  ), //o
    .io_outputs_1_payload_0_0_2_3    (streamDemux_2_io_outputs_1_payload_0_0_2_3[7:0]  ), //o
    .io_outputs_1_payload_0_1_0_0    (streamDemux_2_io_outputs_1_payload_0_1_0_0[7:0]  ), //o
    .io_outputs_1_payload_0_1_0_1    (streamDemux_2_io_outputs_1_payload_0_1_0_1[7:0]  ), //o
    .io_outputs_1_payload_0_1_0_2    (streamDemux_2_io_outputs_1_payload_0_1_0_2[7:0]  ), //o
    .io_outputs_1_payload_0_1_0_3    (streamDemux_2_io_outputs_1_payload_0_1_0_3[7:0]  ), //o
    .io_outputs_1_payload_0_1_1_0    (streamDemux_2_io_outputs_1_payload_0_1_1_0[7:0]  ), //o
    .io_outputs_1_payload_0_1_1_1    (streamDemux_2_io_outputs_1_payload_0_1_1_1[7:0]  ), //o
    .io_outputs_1_payload_0_1_1_2    (streamDemux_2_io_outputs_1_payload_0_1_1_2[7:0]  ), //o
    .io_outputs_1_payload_0_1_1_3    (streamDemux_2_io_outputs_1_payload_0_1_1_3[7:0]  ), //o
    .io_outputs_1_payload_0_1_2_0    (streamDemux_2_io_outputs_1_payload_0_1_2_0[7:0]  ), //o
    .io_outputs_1_payload_0_1_2_1    (streamDemux_2_io_outputs_1_payload_0_1_2_1[7:0]  ), //o
    .io_outputs_1_payload_0_1_2_2    (streamDemux_2_io_outputs_1_payload_0_1_2_2[7:0]  ), //o
    .io_outputs_1_payload_0_1_2_3    (streamDemux_2_io_outputs_1_payload_0_1_2_3[7:0]  ), //o
    .io_outputs_1_payload_0_2_0_0    (streamDemux_2_io_outputs_1_payload_0_2_0_0[7:0]  ), //o
    .io_outputs_1_payload_0_2_0_1    (streamDemux_2_io_outputs_1_payload_0_2_0_1[7:0]  ), //o
    .io_outputs_1_payload_0_2_0_2    (streamDemux_2_io_outputs_1_payload_0_2_0_2[7:0]  ), //o
    .io_outputs_1_payload_0_2_0_3    (streamDemux_2_io_outputs_1_payload_0_2_0_3[7:0]  ), //o
    .io_outputs_1_payload_0_2_1_0    (streamDemux_2_io_outputs_1_payload_0_2_1_0[7:0]  ), //o
    .io_outputs_1_payload_0_2_1_1    (streamDemux_2_io_outputs_1_payload_0_2_1_1[7:0]  ), //o
    .io_outputs_1_payload_0_2_1_2    (streamDemux_2_io_outputs_1_payload_0_2_1_2[7:0]  ), //o
    .io_outputs_1_payload_0_2_1_3    (streamDemux_2_io_outputs_1_payload_0_2_1_3[7:0]  ), //o
    .io_outputs_1_payload_0_2_2_0    (streamDemux_2_io_outputs_1_payload_0_2_2_0[7:0]  ), //o
    .io_outputs_1_payload_0_2_2_1    (streamDemux_2_io_outputs_1_payload_0_2_2_1[7:0]  ), //o
    .io_outputs_1_payload_0_2_2_2    (streamDemux_2_io_outputs_1_payload_0_2_2_2[7:0]  ), //o
    .io_outputs_1_payload_0_2_2_3    (streamDemux_2_io_outputs_1_payload_0_2_2_3[7:0]  ), //o
    .io_outputs_1_payload_1_0_0_0    (streamDemux_2_io_outputs_1_payload_1_0_0_0[7:0]  ), //o
    .io_outputs_1_payload_1_0_0_1    (streamDemux_2_io_outputs_1_payload_1_0_0_1[7:0]  ), //o
    .io_outputs_1_payload_1_0_0_2    (streamDemux_2_io_outputs_1_payload_1_0_0_2[7:0]  ), //o
    .io_outputs_1_payload_1_0_0_3    (streamDemux_2_io_outputs_1_payload_1_0_0_3[7:0]  ), //o
    .io_outputs_1_payload_1_0_1_0    (streamDemux_2_io_outputs_1_payload_1_0_1_0[7:0]  ), //o
    .io_outputs_1_payload_1_0_1_1    (streamDemux_2_io_outputs_1_payload_1_0_1_1[7:0]  ), //o
    .io_outputs_1_payload_1_0_1_2    (streamDemux_2_io_outputs_1_payload_1_0_1_2[7:0]  ), //o
    .io_outputs_1_payload_1_0_1_3    (streamDemux_2_io_outputs_1_payload_1_0_1_3[7:0]  ), //o
    .io_outputs_1_payload_1_0_2_0    (streamDemux_2_io_outputs_1_payload_1_0_2_0[7:0]  ), //o
    .io_outputs_1_payload_1_0_2_1    (streamDemux_2_io_outputs_1_payload_1_0_2_1[7:0]  ), //o
    .io_outputs_1_payload_1_0_2_2    (streamDemux_2_io_outputs_1_payload_1_0_2_2[7:0]  ), //o
    .io_outputs_1_payload_1_0_2_3    (streamDemux_2_io_outputs_1_payload_1_0_2_3[7:0]  ), //o
    .io_outputs_1_payload_1_1_0_0    (streamDemux_2_io_outputs_1_payload_1_1_0_0[7:0]  ), //o
    .io_outputs_1_payload_1_1_0_1    (streamDemux_2_io_outputs_1_payload_1_1_0_1[7:0]  ), //o
    .io_outputs_1_payload_1_1_0_2    (streamDemux_2_io_outputs_1_payload_1_1_0_2[7:0]  ), //o
    .io_outputs_1_payload_1_1_0_3    (streamDemux_2_io_outputs_1_payload_1_1_0_3[7:0]  ), //o
    .io_outputs_1_payload_1_1_1_0    (streamDemux_2_io_outputs_1_payload_1_1_1_0[7:0]  ), //o
    .io_outputs_1_payload_1_1_1_1    (streamDemux_2_io_outputs_1_payload_1_1_1_1[7:0]  ), //o
    .io_outputs_1_payload_1_1_1_2    (streamDemux_2_io_outputs_1_payload_1_1_1_2[7:0]  ), //o
    .io_outputs_1_payload_1_1_1_3    (streamDemux_2_io_outputs_1_payload_1_1_1_3[7:0]  ), //o
    .io_outputs_1_payload_1_1_2_0    (streamDemux_2_io_outputs_1_payload_1_1_2_0[7:0]  ), //o
    .io_outputs_1_payload_1_1_2_1    (streamDemux_2_io_outputs_1_payload_1_1_2_1[7:0]  ), //o
    .io_outputs_1_payload_1_1_2_2    (streamDemux_2_io_outputs_1_payload_1_1_2_2[7:0]  ), //o
    .io_outputs_1_payload_1_1_2_3    (streamDemux_2_io_outputs_1_payload_1_1_2_3[7:0]  ), //o
    .io_outputs_1_payload_1_2_0_0    (streamDemux_2_io_outputs_1_payload_1_2_0_0[7:0]  ), //o
    .io_outputs_1_payload_1_2_0_1    (streamDemux_2_io_outputs_1_payload_1_2_0_1[7:0]  ), //o
    .io_outputs_1_payload_1_2_0_2    (streamDemux_2_io_outputs_1_payload_1_2_0_2[7:0]  ), //o
    .io_outputs_1_payload_1_2_0_3    (streamDemux_2_io_outputs_1_payload_1_2_0_3[7:0]  ), //o
    .io_outputs_1_payload_1_2_1_0    (streamDemux_2_io_outputs_1_payload_1_2_1_0[7:0]  ), //o
    .io_outputs_1_payload_1_2_1_1    (streamDemux_2_io_outputs_1_payload_1_2_1_1[7:0]  ), //o
    .io_outputs_1_payload_1_2_1_2    (streamDemux_2_io_outputs_1_payload_1_2_1_2[7:0]  ), //o
    .io_outputs_1_payload_1_2_1_3    (streamDemux_2_io_outputs_1_payload_1_2_1_3[7:0]  ), //o
    .io_outputs_1_payload_1_2_2_0    (streamDemux_2_io_outputs_1_payload_1_2_2_0[7:0]  ), //o
    .io_outputs_1_payload_1_2_2_1    (streamDemux_2_io_outputs_1_payload_1_2_2_1[7:0]  ), //o
    .io_outputs_1_payload_1_2_2_2    (streamDemux_2_io_outputs_1_payload_1_2_2_2[7:0]  ), //o
    .io_outputs_1_payload_1_2_2_3    (streamDemux_2_io_outputs_1_payload_1_2_2_3[7:0]  )  //o
  );
  EventM2sPipes_2 eventM2sPipes_3 (
    .eventIn_valid     (accOutputsJoin_valid            ), //i
    .eventIn_ready     (eventM2sPipes_3_eventIn_ready   ), //o
    .eventOut_valid    (eventM2sPipes_3_eventOut_valid  ), //o
    .eventOut_ready    (postProcessOutputs_ready        ), //i
    .CEs_0             (eventM2sPipes_3_CEs_0           ), //o
    .CEs_1             (eventM2sPipes_3_CEs_1           ), //o
    .CEs_2             (eventM2sPipes_3_CEs_2           ), //o
    .CEs_3             (eventM2sPipes_3_CEs_3           ), //o
    .CEs_4             (eventM2sPipes_3_CEs_4           ), //o
    .CEs_5             (eventM2sPipes_3_CEs_5           ), //o
    .clk               (clk                             ), //i
    .reset             (reset                           )  //i
  );
  ScalerINT16 scalerINT16_4 (
    .scalerBase    (scaleBase[15:0]                                  ), //i
    .scalerExpr    (scaleExpr[5:0]                                   ), //i
    .CEs_0         (eventM2sPipes_3_CEs_0                            ), //i
    .CEs_1         (eventM2sPipes_3_CEs_1                            ), //i
    .CEs_2         (eventM2sPipes_3_CEs_2                            ), //i
    .CEs_3         (eventM2sPipes_3_CEs_3                            ), //i
    .CEs_4         (eventM2sPipes_3_CEs_4                            ), //i
    .CEs_5         (eventM2sPipes_3_CEs_5                            ), //i
    .din           (accOutputsJoin_payload_frame_line_pixel_0[23:0]  ), //i
    .dout          (scalerINT16_4_dout[7:0]                          ), //o
    .clk           (clk                                              ), //i
    .reset         (reset                                            )  //i
  );
  ScalerINT16 scalerINT16_5 (
    .scalerBase    (scaleBase[15:0]                                  ), //i
    .scalerExpr    (scaleExpr[5:0]                                   ), //i
    .CEs_0         (eventM2sPipes_3_CEs_0                            ), //i
    .CEs_1         (eventM2sPipes_3_CEs_1                            ), //i
    .CEs_2         (eventM2sPipes_3_CEs_2                            ), //i
    .CEs_3         (eventM2sPipes_3_CEs_3                            ), //i
    .CEs_4         (eventM2sPipes_3_CEs_4                            ), //i
    .CEs_5         (eventM2sPipes_3_CEs_5                            ), //i
    .din           (accOutputsJoin_payload_frame_line_pixel_1[23:0]  ), //i
    .dout          (scalerINT16_5_dout[7:0]                          ), //o
    .clk           (clk                                              ), //i
    .reset         (reset                                            )  //i
  );
  ScalerINT16 scalerINT16_6 (
    .scalerBase    (scaleBase[15:0]                                  ), //i
    .scalerExpr    (scaleExpr[5:0]                                   ), //i
    .CEs_0         (eventM2sPipes_3_CEs_0                            ), //i
    .CEs_1         (eventM2sPipes_3_CEs_1                            ), //i
    .CEs_2         (eventM2sPipes_3_CEs_2                            ), //i
    .CEs_3         (eventM2sPipes_3_CEs_3                            ), //i
    .CEs_4         (eventM2sPipes_3_CEs_4                            ), //i
    .CEs_5         (eventM2sPipes_3_CEs_5                            ), //i
    .din           (accOutputsJoin_payload_frame_line_pixel_2[23:0]  ), //i
    .dout          (scalerINT16_6_dout[7:0]                          ), //o
    .clk           (clk                                              ), //i
    .reset         (reset                                            )  //i
  );
  ScalerINT16 scalerINT16_7 (
    .scalerBase    (scaleBase[15:0]                                  ), //i
    .scalerExpr    (scaleExpr[5:0]                                   ), //i
    .CEs_0         (eventM2sPipes_3_CEs_0                            ), //i
    .CEs_1         (eventM2sPipes_3_CEs_1                            ), //i
    .CEs_2         (eventM2sPipes_3_CEs_2                            ), //i
    .CEs_3         (eventM2sPipes_3_CEs_3                            ), //i
    .CEs_4         (eventM2sPipes_3_CEs_4                            ), //i
    .CEs_5         (eventM2sPipes_3_CEs_5                            ), //i
    .din           (accOutputsJoin_payload_frame_line_pixel_3[23:0]  ), //i
    .dout          (scalerINT16_7_dout[7:0]                          ), //o
    .clk           (clk                                              ), //i
    .reset         (reset                                            )  //i
  );
  StreamDemux_1 streamDemux_3 (
    .io_select                                    (streamDemux_3_io_select                                     ), //i
    .io_input_valid                               (postProcessOutputs_valid                                    ), //i
    .io_input_ready                               (streamDemux_3_io_input_ready                                ), //o
    .io_input_payload_frame_line_pixel_0          (postProcessOutputs_payload_frame_line_pixel_0[7:0]          ), //i
    .io_input_payload_frame_line_pixel_1          (postProcessOutputs_payload_frame_line_pixel_1[7:0]          ), //i
    .io_input_payload_frame_line_pixel_2          (postProcessOutputs_payload_frame_line_pixel_2[7:0]          ), //i
    .io_input_payload_frame_line_pixel_3          (postProcessOutputs_payload_frame_line_pixel_3[7:0]          ), //i
    .io_input_payload_frame_line_endOfLine        (postProcessOutputs_payload_frame_line_endOfLine             ), //i
    .io_input_payload_frame_endOfFrame            (postProcessOutputs_payload_frame_endOfFrame                 ), //i
    .io_input_payload_endOfPack                   (postProcessOutputs_payload_endOfPack                        ), //i
    .io_outputs_0_valid                           (streamDemux_3_io_outputs_0_valid                            ), //o
    .io_outputs_0_ready                           (streamMux_1_io_inputs_0_ready                               ), //i
    .io_outputs_0_payload_frame_line_pixel_0      (streamDemux_3_io_outputs_0_payload_frame_line_pixel_0[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_1      (streamDemux_3_io_outputs_0_payload_frame_line_pixel_1[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_2      (streamDemux_3_io_outputs_0_payload_frame_line_pixel_2[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_3      (streamDemux_3_io_outputs_0_payload_frame_line_pixel_3[7:0]  ), //o
    .io_outputs_0_payload_frame_line_endOfLine    (streamDemux_3_io_outputs_0_payload_frame_line_endOfLine     ), //o
    .io_outputs_0_payload_frame_endOfFrame        (streamDemux_3_io_outputs_0_payload_frame_endOfFrame         ), //o
    .io_outputs_0_payload_endOfPack               (streamDemux_3_io_outputs_0_payload_endOfPack                ), //o
    .io_outputs_1_valid                           (streamDemux_3_io_outputs_1_valid                            ), //o
    .io_outputs_1_ready                           (pool_videoIn_ready                                          ), //i
    .io_outputs_1_payload_frame_line_pixel_0      (streamDemux_3_io_outputs_1_payload_frame_line_pixel_0[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_1      (streamDemux_3_io_outputs_1_payload_frame_line_pixel_1[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_2      (streamDemux_3_io_outputs_1_payload_frame_line_pixel_2[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_3      (streamDemux_3_io_outputs_1_payload_frame_line_pixel_3[7:0]  ), //o
    .io_outputs_1_payload_frame_line_endOfLine    (streamDemux_3_io_outputs_1_payload_frame_line_endOfLine     ), //o
    .io_outputs_1_payload_frame_endOfFrame        (streamDemux_3_io_outputs_1_payload_frame_endOfFrame         ), //o
    .io_outputs_1_payload_endOfPack               (streamDemux_3_io_outputs_1_payload_endOfPack                )  //o
  );
  StreamMux streamMux_1 (
    .io_select                                   (streamMux_1_io_select                                       ), //i
    .io_inputs_0_valid                           (streamDemux_3_io_outputs_0_valid                            ), //i
    .io_inputs_0_ready                           (streamMux_1_io_inputs_0_ready                               ), //o
    .io_inputs_0_payload_frame_line_pixel_0      (streamDemux_3_io_outputs_0_payload_frame_line_pixel_0[7:0]  ), //i
    .io_inputs_0_payload_frame_line_pixel_1      (streamDemux_3_io_outputs_0_payload_frame_line_pixel_1[7:0]  ), //i
    .io_inputs_0_payload_frame_line_pixel_2      (streamDemux_3_io_outputs_0_payload_frame_line_pixel_2[7:0]  ), //i
    .io_inputs_0_payload_frame_line_pixel_3      (streamDemux_3_io_outputs_0_payload_frame_line_pixel_3[7:0]  ), //i
    .io_inputs_0_payload_frame_line_endOfLine    (streamDemux_3_io_outputs_0_payload_frame_line_endOfLine     ), //i
    .io_inputs_0_payload_frame_endOfFrame        (streamDemux_3_io_outputs_0_payload_frame_endOfFrame         ), //i
    .io_inputs_0_payload_endOfPack               (streamDemux_3_io_outputs_0_payload_endOfPack                ), //i
    .io_inputs_1_valid                           (pool_videoOut_valid                                         ), //i
    .io_inputs_1_ready                           (streamMux_1_io_inputs_1_ready                               ), //o
    .io_inputs_1_payload_frame_line_pixel_0      (pool_videoOut_payload_frame_line_pixel_0[7:0]               ), //i
    .io_inputs_1_payload_frame_line_pixel_1      (pool_videoOut_payload_frame_line_pixel_1[7:0]               ), //i
    .io_inputs_1_payload_frame_line_pixel_2      (pool_videoOut_payload_frame_line_pixel_2[7:0]               ), //i
    .io_inputs_1_payload_frame_line_pixel_3      (pool_videoOut_payload_frame_line_pixel_3[7:0]               ), //i
    .io_inputs_1_payload_frame_line_endOfLine    (pool_videoOut_payload_frame_line_endOfLine                  ), //i
    .io_inputs_1_payload_frame_endOfFrame        (pool_videoOut_payload_frame_endOfFrame                      ), //i
    .io_inputs_1_payload_endOfPack               (pool_videoOut_payload_endOfPack                             ), //i
    .io_output_valid                             (streamMux_1_io_output_valid                                 ), //o
    .io_output_ready                             (streamMux_1_io_output_translated_ready                      ), //i
    .io_output_payload_frame_line_pixel_0        (streamMux_1_io_output_payload_frame_line_pixel_0[7:0]       ), //o
    .io_output_payload_frame_line_pixel_1        (streamMux_1_io_output_payload_frame_line_pixel_1[7:0]       ), //o
    .io_output_payload_frame_line_pixel_2        (streamMux_1_io_output_payload_frame_line_pixel_2[7:0]       ), //o
    .io_output_payload_frame_line_pixel_3        (streamMux_1_io_output_payload_frame_line_pixel_3[7:0]       ), //o
    .io_output_payload_frame_line_endOfLine      (streamMux_1_io_output_payload_frame_line_endOfLine          ), //o
    .io_output_payload_frame_endOfFrame          (streamMux_1_io_output_payload_frame_endOfFrame              ), //o
    .io_output_payload_endOfPack                 (streamMux_1_io_output_payload_endOfPack                     )  //o
  );
  always @(*) begin
    case(tmp_funcTable_ready_2)
      2'b00 : tmp_tableAdapted_payload_1 = tmp_tableAdapted_payload[7 : 0];
      2'b01 : tmp_tableAdapted_payload_1 = tmp_tableAdapted_payload[15 : 8];
      2'b10 : tmp_tableAdapted_payload_1 = tmp_tableAdapted_payload[23 : 16];
      default : tmp_tableAdapted_payload_1 = tmp_tableAdapted_payload[31 : 24];
    endcase
  end

  assign inputChannelSpilt_valid = inputs_valid;
  assign inputs_ready = inputChannelSpilt_ready;
  assign tmp_inputChannelSpilt_payload_0 = inputs_payload;
  assign inputChannelSpilt_payload_0 = tmp_inputChannelSpilt_payload_0[7 : 0];
  assign inputChannelSpilt_payload_1 = tmp_inputChannelSpilt_payload_0[15 : 8];
  assign inputChannelSpilt_payload_2 = tmp_inputChannelSpilt_payload_0[23 : 16];
  assign inputChannelSpilt_payload_3 = tmp_inputChannelSpilt_payload_0[31 : 24];
  assign inputChannelSpilt_translated_valid = inputChannelSpilt_valid;
  assign inputChannelSpilt_ready = inputChannelSpilt_translated_ready;
  assign inputChannelSpilt_translated_payload_0 = ($signed(inputChannelSpilt_payload_0) - $signed(inputZeroPoint));
  assign inputChannelSpilt_translated_payload_1 = ($signed(inputChannelSpilt_payload_1) - $signed(inputZeroPoint));
  assign inputChannelSpilt_translated_payload_2 = ($signed(inputChannelSpilt_payload_2) - $signed(inputZeroPoint));
  assign inputChannelSpilt_translated_payload_3 = ($signed(inputChannelSpilt_payload_3) - $signed(inputZeroPoint));
  always @(*) begin
    inputChannelSpilt_translated_ready = inputChannelSpilt_translated_m2sPipe_ready;
    if(when_Stream_l342) begin
      inputChannelSpilt_translated_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! inputChannelSpilt_translated_m2sPipe_valid);
  assign inputChannelSpilt_translated_m2sPipe_valid = inputChannelSpilt_translated_rValid;
  assign inputChannelSpilt_translated_m2sPipe_payload_0 = inputChannelSpilt_translated_rData_0;
  assign inputChannelSpilt_translated_m2sPipe_payload_1 = inputChannelSpilt_translated_rData_1;
  assign inputChannelSpilt_translated_m2sPipe_payload_2 = inputChannelSpilt_translated_rData_2;
  assign inputChannelSpilt_translated_m2sPipe_payload_3 = inputChannelSpilt_translated_rData_3;
  assign inputChannelSpilt_translated_m2sPipe_fire = (inputChannelSpilt_translated_m2sPipe_valid && inputChannelSpilt_translated_m2sPipe_ready);
  always @(*) begin
    tmp_when_Utils_l503_2 = 1'b0;
    if(inputChannelSpilt_translated_m2sPipe_fire) begin
      tmp_when_Utils_l503_2 = 1'b1;
    end
  end

  always @(*) begin
    tmp_when_Utils_l503_3 = (tmp_when_Utils_l503_4 + tmp_tmp_when_Utils_l503_3);
    if(1'b0) begin
      tmp_when_Utils_l503_3 = 9'h0;
    end
  end

  assign when_Utils_l503 = (inputChannelSpilt_translated_m2sPipe_fire && tmp_when_Utils_l503);
  always @(*) begin
    tmp_when_Utils_l503_5 = 1'b0;
    if(when_Utils_l503) begin
      tmp_when_Utils_l503_5 = 1'b1;
    end
  end

  always @(*) begin
    tmp_when_Utils_l503_6 = (tmp_when_Utils_l503_7 + tmp_tmp_when_Utils_l503_6);
    if(1'b0) begin
      tmp_when_Utils_l503_6 = 9'h0;
    end
  end

  assign when_Utils_l503_1 = (inputChannelSpilt_translated_m2sPipe_fire && tmp_when_Utils_l503_1);
  always @(*) begin
    tmp_inputVideo_payload_endOfPack = 1'b0;
    if(when_Utils_l503_1) begin
      tmp_inputVideo_payload_endOfPack = 1'b1;
    end
  end

  always @(*) begin
    tmp_inputVideo_payload_endOfPack_1 = (tmp_inputVideo_payload_endOfPack_2 + tmp_tmp_inputVideo_payload_endOfPack_1);
    if(1'b0) begin
      tmp_inputVideo_payload_endOfPack_1 = 8'h0;
    end
  end

  assign tmp_when_Utils_l503 = (tmp_when_Utils_l503_4 == width);
  assign tmp_when_Utils_l503_1 = (tmp_when_Utils_l503_7 == height);
  assign inputVideo_valid = inputChannelSpilt_translated_m2sPipe_valid;
  assign inputChannelSpilt_translated_m2sPipe_ready = inputVideo_ready;
  assign inputVideo_payload_frame_line_pixel_0 = inputChannelSpilt_translated_m2sPipe_payload_0;
  assign inputVideo_payload_frame_line_pixel_1 = inputChannelSpilt_translated_m2sPipe_payload_1;
  assign inputVideo_payload_frame_line_pixel_2 = inputChannelSpilt_translated_m2sPipe_payload_2;
  assign inputVideo_payload_frame_line_pixel_3 = inputChannelSpilt_translated_m2sPipe_payload_3;
  assign inputVideo_payload_frame_line_endOfLine = tmp_when_Utils_l503;
  assign inputVideo_payload_frame_endOfFrame = tmp_when_Utils_l503_1;
  assign inputVideo_payload_endOfPack = (tmp_inputVideo_payload_endOfPack_2 == numberOfInputFrames);
  always @(*) begin
    tmp_io_select = 1'b0;
    if(weightsAdapted_fire) begin
      tmp_io_select = 1'b1;
    end
  end

  always @(*) begin
    tmp_io_select_1 = (tmp_io_select_2 + tmp_io_select);
    if(1'b0) begin
      tmp_io_select_1 = 1'b0;
    end
  end

  assign weightsAdapted_fire = (weightsAdapted_valid && weightsAdapted_ready);
  assign weightsAdapted_ready = streamDemux_2_io_input_ready;
  assign weights_fire = (weights_valid && weights_ready);
  always @(*) begin
    tmp_weights_ready = 1'b0;
    if(weights_fire) begin
      tmp_weights_ready = 1'b1;
    end
  end

  assign tmp_weights_ready_3 = (tmp_weights_ready_2 == 5'h11);
  assign tmp_1 = (tmp_weights_ready_3 && tmp_weights_ready);
  always @(*) begin
    if(tmp_1) begin
      tmp_weights_ready_1 = 5'h0;
    end else begin
      tmp_weights_ready_1 = (tmp_weights_ready_2 + tmp_tmp_weights_ready_1);
    end
    if(1'b0) begin
      tmp_weights_ready_1 = 5'h0;
    end
  end

  assign weights_fire_1 = (weights_valid && weights_ready);
  assign weightsAdapted_valid = (weights_valid && tmp_weights_ready_3);
  assign tmp_weightsAdapted_payload_0_0_0_0_1 = {weights_payload,tmp_weightsAdapted_payload_0_0_0_0};
  assign tmp_weightsAdapted_payload_0_0_0_0_2 = tmp_weightsAdapted_payload_0_0_0_0_1[287 : 0];
  assign tmp_weightsAdapted_payload_0_0_0_0_3 = tmp_weightsAdapted_payload_0_0_0_0_2[95 : 0];
  assign tmp_weightsAdapted_payload_0_0_0_0_4 = tmp_weightsAdapted_payload_0_0_0_0_3[31 : 0];
  assign weightsAdapted_payload_0_0_0_0 = tmp_weightsAdapted_payload_0_0_0_0_4[7 : 0];
  assign weightsAdapted_payload_0_0_0_1 = tmp_weightsAdapted_payload_0_0_0_0_4[15 : 8];
  assign weightsAdapted_payload_0_0_0_2 = tmp_weightsAdapted_payload_0_0_0_0_4[23 : 16];
  assign weightsAdapted_payload_0_0_0_3 = tmp_weightsAdapted_payload_0_0_0_0_4[31 : 24];
  assign tmp_weightsAdapted_payload_0_0_1_0 = tmp_weightsAdapted_payload_0_0_0_0_3[63 : 32];
  assign weightsAdapted_payload_0_0_1_0 = tmp_weightsAdapted_payload_0_0_1_0[7 : 0];
  assign weightsAdapted_payload_0_0_1_1 = tmp_weightsAdapted_payload_0_0_1_0[15 : 8];
  assign weightsAdapted_payload_0_0_1_2 = tmp_weightsAdapted_payload_0_0_1_0[23 : 16];
  assign weightsAdapted_payload_0_0_1_3 = tmp_weightsAdapted_payload_0_0_1_0[31 : 24];
  assign tmp_weightsAdapted_payload_0_0_2_0 = tmp_weightsAdapted_payload_0_0_0_0_3[95 : 64];
  assign weightsAdapted_payload_0_0_2_0 = tmp_weightsAdapted_payload_0_0_2_0[7 : 0];
  assign weightsAdapted_payload_0_0_2_1 = tmp_weightsAdapted_payload_0_0_2_0[15 : 8];
  assign weightsAdapted_payload_0_0_2_2 = tmp_weightsAdapted_payload_0_0_2_0[23 : 16];
  assign weightsAdapted_payload_0_0_2_3 = tmp_weightsAdapted_payload_0_0_2_0[31 : 24];
  assign tmp_weightsAdapted_payload_0_1_0_0 = tmp_weightsAdapted_payload_0_0_0_0_2[191 : 96];
  assign tmp_weightsAdapted_payload_0_1_0_0_1 = tmp_weightsAdapted_payload_0_1_0_0[31 : 0];
  assign weightsAdapted_payload_0_1_0_0 = tmp_weightsAdapted_payload_0_1_0_0_1[7 : 0];
  assign weightsAdapted_payload_0_1_0_1 = tmp_weightsAdapted_payload_0_1_0_0_1[15 : 8];
  assign weightsAdapted_payload_0_1_0_2 = tmp_weightsAdapted_payload_0_1_0_0_1[23 : 16];
  assign weightsAdapted_payload_0_1_0_3 = tmp_weightsAdapted_payload_0_1_0_0_1[31 : 24];
  assign tmp_weightsAdapted_payload_0_1_1_0 = tmp_weightsAdapted_payload_0_1_0_0[63 : 32];
  assign weightsAdapted_payload_0_1_1_0 = tmp_weightsAdapted_payload_0_1_1_0[7 : 0];
  assign weightsAdapted_payload_0_1_1_1 = tmp_weightsAdapted_payload_0_1_1_0[15 : 8];
  assign weightsAdapted_payload_0_1_1_2 = tmp_weightsAdapted_payload_0_1_1_0[23 : 16];
  assign weightsAdapted_payload_0_1_1_3 = tmp_weightsAdapted_payload_0_1_1_0[31 : 24];
  assign tmp_weightsAdapted_payload_0_1_2_0 = tmp_weightsAdapted_payload_0_1_0_0[95 : 64];
  assign weightsAdapted_payload_0_1_2_0 = tmp_weightsAdapted_payload_0_1_2_0[7 : 0];
  assign weightsAdapted_payload_0_1_2_1 = tmp_weightsAdapted_payload_0_1_2_0[15 : 8];
  assign weightsAdapted_payload_0_1_2_2 = tmp_weightsAdapted_payload_0_1_2_0[23 : 16];
  assign weightsAdapted_payload_0_1_2_3 = tmp_weightsAdapted_payload_0_1_2_0[31 : 24];
  assign tmp_weightsAdapted_payload_0_2_0_0 = tmp_weightsAdapted_payload_0_0_0_0_2[287 : 192];
  assign tmp_weightsAdapted_payload_0_2_0_0_1 = tmp_weightsAdapted_payload_0_2_0_0[31 : 0];
  assign weightsAdapted_payload_0_2_0_0 = tmp_weightsAdapted_payload_0_2_0_0_1[7 : 0];
  assign weightsAdapted_payload_0_2_0_1 = tmp_weightsAdapted_payload_0_2_0_0_1[15 : 8];
  assign weightsAdapted_payload_0_2_0_2 = tmp_weightsAdapted_payload_0_2_0_0_1[23 : 16];
  assign weightsAdapted_payload_0_2_0_3 = tmp_weightsAdapted_payload_0_2_0_0_1[31 : 24];
  assign tmp_weightsAdapted_payload_0_2_1_0 = tmp_weightsAdapted_payload_0_2_0_0[63 : 32];
  assign weightsAdapted_payload_0_2_1_0 = tmp_weightsAdapted_payload_0_2_1_0[7 : 0];
  assign weightsAdapted_payload_0_2_1_1 = tmp_weightsAdapted_payload_0_2_1_0[15 : 8];
  assign weightsAdapted_payload_0_2_1_2 = tmp_weightsAdapted_payload_0_2_1_0[23 : 16];
  assign weightsAdapted_payload_0_2_1_3 = tmp_weightsAdapted_payload_0_2_1_0[31 : 24];
  assign tmp_weightsAdapted_payload_0_2_2_0 = tmp_weightsAdapted_payload_0_2_0_0[95 : 64];
  assign weightsAdapted_payload_0_2_2_0 = tmp_weightsAdapted_payload_0_2_2_0[7 : 0];
  assign weightsAdapted_payload_0_2_2_1 = tmp_weightsAdapted_payload_0_2_2_0[15 : 8];
  assign weightsAdapted_payload_0_2_2_2 = tmp_weightsAdapted_payload_0_2_2_0[23 : 16];
  assign weightsAdapted_payload_0_2_2_3 = tmp_weightsAdapted_payload_0_2_2_0[31 : 24];
  assign tmp_weightsAdapted_payload_1_0_0_0 = tmp_weightsAdapted_payload_0_0_0_0_1[575 : 288];
  assign tmp_weightsAdapted_payload_1_0_0_0_1 = tmp_weightsAdapted_payload_1_0_0_0[95 : 0];
  assign tmp_weightsAdapted_payload_1_0_0_0_2 = tmp_weightsAdapted_payload_1_0_0_0_1[31 : 0];
  assign weightsAdapted_payload_1_0_0_0 = tmp_weightsAdapted_payload_1_0_0_0_2[7 : 0];
  assign weightsAdapted_payload_1_0_0_1 = tmp_weightsAdapted_payload_1_0_0_0_2[15 : 8];
  assign weightsAdapted_payload_1_0_0_2 = tmp_weightsAdapted_payload_1_0_0_0_2[23 : 16];
  assign weightsAdapted_payload_1_0_0_3 = tmp_weightsAdapted_payload_1_0_0_0_2[31 : 24];
  assign tmp_weightsAdapted_payload_1_0_1_0 = tmp_weightsAdapted_payload_1_0_0_0_1[63 : 32];
  assign weightsAdapted_payload_1_0_1_0 = tmp_weightsAdapted_payload_1_0_1_0[7 : 0];
  assign weightsAdapted_payload_1_0_1_1 = tmp_weightsAdapted_payload_1_0_1_0[15 : 8];
  assign weightsAdapted_payload_1_0_1_2 = tmp_weightsAdapted_payload_1_0_1_0[23 : 16];
  assign weightsAdapted_payload_1_0_1_3 = tmp_weightsAdapted_payload_1_0_1_0[31 : 24];
  assign tmp_weightsAdapted_payload_1_0_2_0 = tmp_weightsAdapted_payload_1_0_0_0_1[95 : 64];
  assign weightsAdapted_payload_1_0_2_0 = tmp_weightsAdapted_payload_1_0_2_0[7 : 0];
  assign weightsAdapted_payload_1_0_2_1 = tmp_weightsAdapted_payload_1_0_2_0[15 : 8];
  assign weightsAdapted_payload_1_0_2_2 = tmp_weightsAdapted_payload_1_0_2_0[23 : 16];
  assign weightsAdapted_payload_1_0_2_3 = tmp_weightsAdapted_payload_1_0_2_0[31 : 24];
  assign tmp_weightsAdapted_payload_1_1_0_0 = tmp_weightsAdapted_payload_1_0_0_0[191 : 96];
  assign tmp_weightsAdapted_payload_1_1_0_0_1 = tmp_weightsAdapted_payload_1_1_0_0[31 : 0];
  assign weightsAdapted_payload_1_1_0_0 = tmp_weightsAdapted_payload_1_1_0_0_1[7 : 0];
  assign weightsAdapted_payload_1_1_0_1 = tmp_weightsAdapted_payload_1_1_0_0_1[15 : 8];
  assign weightsAdapted_payload_1_1_0_2 = tmp_weightsAdapted_payload_1_1_0_0_1[23 : 16];
  assign weightsAdapted_payload_1_1_0_3 = tmp_weightsAdapted_payload_1_1_0_0_1[31 : 24];
  assign tmp_weightsAdapted_payload_1_1_1_0 = tmp_weightsAdapted_payload_1_1_0_0[63 : 32];
  assign weightsAdapted_payload_1_1_1_0 = tmp_weightsAdapted_payload_1_1_1_0[7 : 0];
  assign weightsAdapted_payload_1_1_1_1 = tmp_weightsAdapted_payload_1_1_1_0[15 : 8];
  assign weightsAdapted_payload_1_1_1_2 = tmp_weightsAdapted_payload_1_1_1_0[23 : 16];
  assign weightsAdapted_payload_1_1_1_3 = tmp_weightsAdapted_payload_1_1_1_0[31 : 24];
  assign tmp_weightsAdapted_payload_1_1_2_0 = tmp_weightsAdapted_payload_1_1_0_0[95 : 64];
  assign weightsAdapted_payload_1_1_2_0 = tmp_weightsAdapted_payload_1_1_2_0[7 : 0];
  assign weightsAdapted_payload_1_1_2_1 = tmp_weightsAdapted_payload_1_1_2_0[15 : 8];
  assign weightsAdapted_payload_1_1_2_2 = tmp_weightsAdapted_payload_1_1_2_0[23 : 16];
  assign weightsAdapted_payload_1_1_2_3 = tmp_weightsAdapted_payload_1_1_2_0[31 : 24];
  assign tmp_weightsAdapted_payload_1_2_0_0 = tmp_weightsAdapted_payload_1_0_0_0[287 : 192];
  assign tmp_weightsAdapted_payload_1_2_0_0_1 = tmp_weightsAdapted_payload_1_2_0_0[31 : 0];
  assign weightsAdapted_payload_1_2_0_0 = tmp_weightsAdapted_payload_1_2_0_0_1[7 : 0];
  assign weightsAdapted_payload_1_2_0_1 = tmp_weightsAdapted_payload_1_2_0_0_1[15 : 8];
  assign weightsAdapted_payload_1_2_0_2 = tmp_weightsAdapted_payload_1_2_0_0_1[23 : 16];
  assign weightsAdapted_payload_1_2_0_3 = tmp_weightsAdapted_payload_1_2_0_0_1[31 : 24];
  assign tmp_weightsAdapted_payload_1_2_1_0 = tmp_weightsAdapted_payload_1_2_0_0[63 : 32];
  assign weightsAdapted_payload_1_2_1_0 = tmp_weightsAdapted_payload_1_2_1_0[7 : 0];
  assign weightsAdapted_payload_1_2_1_1 = tmp_weightsAdapted_payload_1_2_1_0[15 : 8];
  assign weightsAdapted_payload_1_2_1_2 = tmp_weightsAdapted_payload_1_2_1_0[23 : 16];
  assign weightsAdapted_payload_1_2_1_3 = tmp_weightsAdapted_payload_1_2_1_0[31 : 24];
  assign tmp_weightsAdapted_payload_1_2_2_0 = tmp_weightsAdapted_payload_1_2_0_0[95 : 64];
  assign weightsAdapted_payload_1_2_2_0 = tmp_weightsAdapted_payload_1_2_2_0[7 : 0];
  assign weightsAdapted_payload_1_2_2_1 = tmp_weightsAdapted_payload_1_2_2_0[15 : 8];
  assign weightsAdapted_payload_1_2_2_2 = tmp_weightsAdapted_payload_1_2_2_0[23 : 16];
  assign weightsAdapted_payload_1_2_2_3 = tmp_weightsAdapted_payload_1_2_2_0[31 : 24];
  assign weights_ready = (! ((! weightsAdapted_ready) && tmp_weights_ready_3));
  assign tmp_accOutputs_0_ready_1 = (tmp_accOutputs_0_ready && accOutputsJoin_ready);
  assign tmp_accOutputs_0_ready = (accOutputs_0_valid && accOutputs_1_valid);
  assign accOutputs_0_ready = tmp_accOutputs_0_ready_1;
  assign accOutputs_1_ready = tmp_accOutputs_0_ready_1;
  assign accOutputsJoin_valid = tmp_accOutputs_0_ready;
  assign accOutputsJoin_payload_endOfPack = accOutputs_0_payload_endOfPack;
  assign accOutputsJoin_payload_frame_endOfFrame = accOutputs_0_payload_frame_endOfFrame;
  assign accOutputsJoin_payload_frame_line_endOfLine = accOutputs_0_payload_frame_line_endOfLine;
  assign tmp_accOutputsJoin_payload_frame_line_pixel_0 = {{accOutputs_1_payload_frame_line_pixel_1,accOutputs_1_payload_frame_line_pixel_0},{accOutputs_0_payload_frame_line_pixel_1,accOutputs_0_payload_frame_line_pixel_0}};
  assign accOutputsJoin_payload_frame_line_pixel_0 = tmp_accOutputsJoin_payload_frame_line_pixel_0[23 : 0];
  assign accOutputsJoin_payload_frame_line_pixel_1 = tmp_accOutputsJoin_payload_frame_line_pixel_0[47 : 24];
  assign accOutputsJoin_payload_frame_line_pixel_2 = tmp_accOutputsJoin_payload_frame_line_pixel_0[71 : 48];
  assign accOutputsJoin_payload_frame_line_pixel_3 = tmp_accOutputsJoin_payload_frame_line_pixel_0[95 : 72];
  assign accOutputsJoin_ready = eventM2sPipes_3_eventIn_ready;
  assign postProcessOutputs_payload_frame_line_pixel_0 = ($signed(scalerINT16_4_dout) + $signed(outputZeroPoint));
  assign postProcessOutputs_payload_frame_line_pixel_1 = ($signed(scalerINT16_5_dout) + $signed(outputZeroPoint));
  assign postProcessOutputs_payload_frame_line_pixel_2 = ($signed(scalerINT16_6_dout) + $signed(outputZeroPoint));
  assign postProcessOutputs_payload_frame_line_pixel_3 = ($signed(scalerINT16_7_dout) + $signed(outputZeroPoint));
  assign postProcessOutputs_valid = eventM2sPipes_3_eventOut_valid;
  assign postProcessOutputs_payload_endOfPack = tmp_postProcessOutputs_payload_endOfPack_5;
  assign postProcessOutputs_payload_frame_endOfFrame = tmp_postProcessOutputs_payload_frame_endOfFrame_5;
  assign postProcessOutputs_payload_frame_line_endOfLine = tmp_postProcessOutputs_payload_frame_line_endOfLine_5;
  assign postProcessOutputs_ready = streamDemux_3_io_input_ready;
  assign streamDemux_3_io_select = enablePooling;
  assign streamMux_1_io_select = enablePooling;
  assign streamMux_1_io_output_translated_valid = streamMux_1_io_output_valid;
  assign streamMux_1_io_output_translated_payload_0 = streamMux_1_io_output_payload_frame_line_pixel_0;
  assign streamMux_1_io_output_translated_payload_1 = streamMux_1_io_output_payload_frame_line_pixel_1;
  assign streamMux_1_io_output_translated_payload_2 = streamMux_1_io_output_payload_frame_line_pixel_2;
  assign streamMux_1_io_output_translated_payload_3 = streamMux_1_io_output_payload_frame_line_pixel_3;
  assign signalTrim_valid = streamMux_1_io_output_translated_valid;
  assign streamMux_1_io_output_translated_ready = signalTrim_ready;
  assign tmp_signalTrim_payload_0 = {streamMux_1_io_output_translated_payload_3,{streamMux_1_io_output_translated_payload_2,{streamMux_1_io_output_translated_payload_1,streamMux_1_io_output_translated_payload_0}}};
  assign signalTrim_payload_0 = tmp_signalTrim_payload_0[7 : 0];
  assign signalTrim_payload_1 = tmp_signalTrim_payload_0[15 : 8];
  assign signalTrim_payload_2 = tmp_signalTrim_payload_0[23 : 16];
  assign signalTrim_payload_3 = tmp_signalTrim_payload_0[31 : 24];
  assign tableAdapted_fire = (tableAdapted_valid && tableAdapted_ready);
  always @(*) begin
    tmp_funcTable_ready = 1'b0;
    if(tableAdapted_fire) begin
      tmp_funcTable_ready = 1'b1;
    end
  end

  assign tmp_funcTable_ready_3 = (tmp_funcTable_ready_2 == 2'b11);
  always @(*) begin
    tmp_funcTable_ready_1 = (tmp_funcTable_ready_2 + tmp_tmp_funcTable_ready_1);
    if(1'b0) begin
      tmp_funcTable_ready_1 = 2'b00;
    end
  end

  assign tableAdapted_valid = funcTable_valid;
  assign tmp_tableAdapted_payload = funcTable_payload;
  assign tableAdapted_payload = tmp_tableAdapted_payload_1;
  assign funcTable_ready = (tableAdapted_ready && tmp_funcTable_ready_3);
  assign tableAdapted_ready = table_1_newTable_ready;
  assign signalTrim_ready = table_1_index_ready;
  assign table_1_value_transmuted_valid = table_1_value_valid;
  assign table_1_value_transmuted_payload = {table_1_value_payload_3,{table_1_value_payload_2,{table_1_value_payload_1,table_1_value_payload_0}}};
  assign outputs_valid = table_1_value_transmuted_valid;
  assign table_1_value_transmuted_ready = outputs_ready;
  assign outputs_payload = table_1_value_transmuted_payload;
  assign inputVideo_ready = window_videoIn_ready;
  assign accOutputs_0_valid = unit_0_outputs_valid;
  assign accOutputs_0_payload_frame_line_pixel_0 = unit_0_outputs_payload_frame_line_pixel_0;
  assign accOutputs_0_payload_frame_line_pixel_1 = unit_0_outputs_payload_frame_line_pixel_1;
  assign accOutputs_0_payload_frame_line_endOfLine = unit_0_outputs_payload_frame_line_endOfLine;
  assign accOutputs_0_payload_frame_endOfFrame = unit_0_outputs_payload_frame_endOfFrame;
  assign accOutputs_0_payload_endOfPack = unit_0_outputs_payload_endOfPack;
  assign accOutputs_1_valid = unit_1_outputs_valid;
  assign accOutputs_1_payload_frame_line_pixel_0 = unit_1_outputs_payload_frame_line_pixel_0;
  assign accOutputs_1_payload_frame_line_pixel_1 = unit_1_outputs_payload_frame_line_pixel_1;
  assign accOutputs_1_payload_frame_line_endOfLine = unit_1_outputs_payload_frame_line_endOfLine;
  assign accOutputs_1_payload_frame_endOfFrame = unit_1_outputs_payload_frame_endOfFrame;
  assign accOutputs_1_payload_endOfPack = unit_1_outputs_payload_endOfPack;
  always @(posedge clk) begin
    if(reset) begin
      inputChannelSpilt_translated_rValid <= 1'b0;
      tmp_when_Utils_l503_4 <= 9'h0;
      tmp_when_Utils_l503_7 <= 9'h0;
      tmp_inputVideo_payload_endOfPack_2 <= 8'h0;
      tmp_io_select_2 <= 1'b0;
      tmp_weights_ready_2 <= 5'h0;
      tmp_funcTable_ready_2 <= 2'b00;
    end else begin
      if(inputChannelSpilt_translated_ready) begin
        inputChannelSpilt_translated_rValid <= inputChannelSpilt_translated_valid;
      end
      tmp_when_Utils_l503_4 <= tmp_when_Utils_l503_3;
      tmp_when_Utils_l503_7 <= tmp_when_Utils_l503_6;
      tmp_inputVideo_payload_endOfPack_2 <= tmp_inputVideo_payload_endOfPack_1;
      tmp_io_select_2 <= tmp_io_select_1;
      tmp_weights_ready_2 <= tmp_weights_ready_1;
      tmp_funcTable_ready_2 <= tmp_funcTable_ready_1;
    end
  end

  always @(posedge clk) begin
    if(inputChannelSpilt_translated_ready) begin
      inputChannelSpilt_translated_rData_0 <= inputChannelSpilt_translated_payload_0;
      inputChannelSpilt_translated_rData_1 <= inputChannelSpilt_translated_payload_1;
      inputChannelSpilt_translated_rData_2 <= inputChannelSpilt_translated_payload_2;
      inputChannelSpilt_translated_rData_3 <= inputChannelSpilt_translated_payload_3;
    end
    if(weights_fire_1) begin
      tmp_weightsAdapted_payload_0_0_0_0 <= {weights_payload,tmp_tmp_weightsAdapted_payload_0_0_0_0};
    end
    if(eventM2sPipes_3_CEs_0) begin
      tmp_postProcessOutputs_payload_frame_line_endOfLine <= accOutputsJoin_payload_frame_line_endOfLine;
      tmp_postProcessOutputs_payload_frame_endOfFrame <= accOutputsJoin_payload_frame_endOfFrame;
      tmp_postProcessOutputs_payload_endOfPack <= accOutputsJoin_payload_endOfPack;
    end
    if(eventM2sPipes_3_CEs_1) begin
      tmp_postProcessOutputs_payload_frame_line_endOfLine_1 <= tmp_postProcessOutputs_payload_frame_line_endOfLine;
      tmp_postProcessOutputs_payload_frame_endOfFrame_1 <= tmp_postProcessOutputs_payload_frame_endOfFrame;
      tmp_postProcessOutputs_payload_endOfPack_1 <= tmp_postProcessOutputs_payload_endOfPack;
    end
    if(eventM2sPipes_3_CEs_2) begin
      tmp_postProcessOutputs_payload_frame_line_endOfLine_2 <= tmp_postProcessOutputs_payload_frame_line_endOfLine_1;
      tmp_postProcessOutputs_payload_frame_endOfFrame_2 <= tmp_postProcessOutputs_payload_frame_endOfFrame_1;
      tmp_postProcessOutputs_payload_endOfPack_2 <= tmp_postProcessOutputs_payload_endOfPack_1;
    end
    if(eventM2sPipes_3_CEs_3) begin
      tmp_postProcessOutputs_payload_frame_line_endOfLine_3 <= tmp_postProcessOutputs_payload_frame_line_endOfLine_2;
      tmp_postProcessOutputs_payload_frame_endOfFrame_3 <= tmp_postProcessOutputs_payload_frame_endOfFrame_2;
      tmp_postProcessOutputs_payload_endOfPack_3 <= tmp_postProcessOutputs_payload_endOfPack_2;
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postProcessOutputs_payload_frame_line_endOfLine_4 <= tmp_postProcessOutputs_payload_frame_line_endOfLine_3;
      tmp_postProcessOutputs_payload_frame_endOfFrame_4 <= tmp_postProcessOutputs_payload_frame_endOfFrame_3;
      tmp_postProcessOutputs_payload_endOfPack_4 <= tmp_postProcessOutputs_payload_endOfPack_3;
    end
    if(eventM2sPipes_3_CEs_5) begin
      tmp_postProcessOutputs_payload_frame_line_endOfLine_5 <= tmp_postProcessOutputs_payload_frame_line_endOfLine_4;
      tmp_postProcessOutputs_payload_frame_endOfFrame_5 <= tmp_postProcessOutputs_payload_frame_endOfFrame_4;
      tmp_postProcessOutputs_payload_endOfPack_5 <= tmp_postProcessOutputs_payload_endOfPack_4;
    end
  end


endmodule

module StreamMux (
  input      [0:0]    io_select,
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input      [7:0]    io_inputs_0_payload_frame_line_pixel_0,
  input      [7:0]    io_inputs_0_payload_frame_line_pixel_1,
  input      [7:0]    io_inputs_0_payload_frame_line_pixel_2,
  input      [7:0]    io_inputs_0_payload_frame_line_pixel_3,
  input               io_inputs_0_payload_frame_line_endOfLine,
  input               io_inputs_0_payload_frame_endOfFrame,
  input               io_inputs_0_payload_endOfPack,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input      [7:0]    io_inputs_1_payload_frame_line_pixel_0,
  input      [7:0]    io_inputs_1_payload_frame_line_pixel_1,
  input      [7:0]    io_inputs_1_payload_frame_line_pixel_2,
  input      [7:0]    io_inputs_1_payload_frame_line_pixel_3,
  input               io_inputs_1_payload_frame_line_endOfLine,
  input               io_inputs_1_payload_frame_endOfFrame,
  input               io_inputs_1_payload_endOfPack,
  output              io_output_valid,
  input               io_output_ready,
  output     [7:0]    io_output_payload_frame_line_pixel_0,
  output     [7:0]    io_output_payload_frame_line_pixel_1,
  output     [7:0]    io_output_payload_frame_line_pixel_2,
  output     [7:0]    io_output_payload_frame_line_pixel_3,
  output              io_output_payload_frame_line_endOfLine,
  output              io_output_payload_frame_endOfFrame,
  output              io_output_payload_endOfPack
);

  reg                 tmp_io_output_valid;
  reg        [7:0]    tmp_io_output_payload_frame_line_pixel_0;
  reg        [7:0]    tmp_io_output_payload_frame_line_pixel_1;
  reg        [7:0]    tmp_io_output_payload_frame_line_pixel_2;
  reg        [7:0]    tmp_io_output_payload_frame_line_pixel_3;
  reg                 tmp_io_output_payload_frame_line_endOfLine;
  reg                 tmp_io_output_payload_frame_endOfFrame;
  reg                 tmp_io_output_payload_endOfPack;

  always @(*) begin
    case(io_select)
      1'b0 : begin
        tmp_io_output_valid = io_inputs_0_valid;
        tmp_io_output_payload_frame_line_pixel_0 = io_inputs_0_payload_frame_line_pixel_0;
        tmp_io_output_payload_frame_line_pixel_1 = io_inputs_0_payload_frame_line_pixel_1;
        tmp_io_output_payload_frame_line_pixel_2 = io_inputs_0_payload_frame_line_pixel_2;
        tmp_io_output_payload_frame_line_pixel_3 = io_inputs_0_payload_frame_line_pixel_3;
        tmp_io_output_payload_frame_line_endOfLine = io_inputs_0_payload_frame_line_endOfLine;
        tmp_io_output_payload_frame_endOfFrame = io_inputs_0_payload_frame_endOfFrame;
        tmp_io_output_payload_endOfPack = io_inputs_0_payload_endOfPack;
      end
      default : begin
        tmp_io_output_valid = io_inputs_1_valid;
        tmp_io_output_payload_frame_line_pixel_0 = io_inputs_1_payload_frame_line_pixel_0;
        tmp_io_output_payload_frame_line_pixel_1 = io_inputs_1_payload_frame_line_pixel_1;
        tmp_io_output_payload_frame_line_pixel_2 = io_inputs_1_payload_frame_line_pixel_2;
        tmp_io_output_payload_frame_line_pixel_3 = io_inputs_1_payload_frame_line_pixel_3;
        tmp_io_output_payload_frame_line_endOfLine = io_inputs_1_payload_frame_line_endOfLine;
        tmp_io_output_payload_frame_endOfFrame = io_inputs_1_payload_frame_endOfFrame;
        tmp_io_output_payload_endOfPack = io_inputs_1_payload_endOfPack;
      end
    endcase
  end

  assign io_inputs_0_ready = ((io_select == 1'b0) && io_output_ready);
  assign io_inputs_1_ready = ((io_select == 1'b1) && io_output_ready);
  assign io_output_valid = tmp_io_output_valid;
  assign io_output_payload_frame_line_pixel_0 = tmp_io_output_payload_frame_line_pixel_0;
  assign io_output_payload_frame_line_pixel_1 = tmp_io_output_payload_frame_line_pixel_1;
  assign io_output_payload_frame_line_pixel_2 = tmp_io_output_payload_frame_line_pixel_2;
  assign io_output_payload_frame_line_pixel_3 = tmp_io_output_payload_frame_line_pixel_3;
  assign io_output_payload_frame_line_endOfLine = tmp_io_output_payload_frame_line_endOfLine;
  assign io_output_payload_frame_endOfFrame = tmp_io_output_payload_frame_endOfFrame;
  assign io_output_payload_endOfPack = tmp_io_output_payload_endOfPack;

endmodule

module StreamDemux_1 (
  input      [0:0]    io_select,
  input               io_input_valid,
  output reg          io_input_ready,
  input      [7:0]    io_input_payload_frame_line_pixel_0,
  input      [7:0]    io_input_payload_frame_line_pixel_1,
  input      [7:0]    io_input_payload_frame_line_pixel_2,
  input      [7:0]    io_input_payload_frame_line_pixel_3,
  input               io_input_payload_frame_line_endOfLine,
  input               io_input_payload_frame_endOfFrame,
  input               io_input_payload_endOfPack,
  output reg          io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_0,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_1,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_2,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_3,
  output              io_outputs_0_payload_frame_line_endOfLine,
  output              io_outputs_0_payload_frame_endOfFrame,
  output              io_outputs_0_payload_endOfPack,
  output reg          io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_0,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_1,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_2,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_3,
  output              io_outputs_1_payload_frame_line_endOfLine,
  output              io_outputs_1_payload_frame_endOfFrame,
  output              io_outputs_1_payload_endOfPack
);

  wire                when_Stream_l764;
  wire                when_Stream_l764_1;

  always @(*) begin
    io_input_ready = 1'b0;
    if(!when_Stream_l764) begin
      io_input_ready = io_outputs_0_ready;
    end
    if(!when_Stream_l764_1) begin
      io_input_ready = io_outputs_1_ready;
    end
  end

  assign io_outputs_0_payload_frame_line_pixel_0 = io_input_payload_frame_line_pixel_0;
  assign io_outputs_0_payload_frame_line_pixel_1 = io_input_payload_frame_line_pixel_1;
  assign io_outputs_0_payload_frame_line_pixel_2 = io_input_payload_frame_line_pixel_2;
  assign io_outputs_0_payload_frame_line_pixel_3 = io_input_payload_frame_line_pixel_3;
  assign io_outputs_0_payload_frame_line_endOfLine = io_input_payload_frame_line_endOfLine;
  assign io_outputs_0_payload_frame_endOfFrame = io_input_payload_frame_endOfFrame;
  assign io_outputs_0_payload_endOfPack = io_input_payload_endOfPack;
  assign when_Stream_l764 = (1'b0 != io_select);
  always @(*) begin
    if(when_Stream_l764) begin
      io_outputs_0_valid = 1'b0;
    end else begin
      io_outputs_0_valid = io_input_valid;
    end
  end

  assign io_outputs_1_payload_frame_line_pixel_0 = io_input_payload_frame_line_pixel_0;
  assign io_outputs_1_payload_frame_line_pixel_1 = io_input_payload_frame_line_pixel_1;
  assign io_outputs_1_payload_frame_line_pixel_2 = io_input_payload_frame_line_pixel_2;
  assign io_outputs_1_payload_frame_line_pixel_3 = io_input_payload_frame_line_pixel_3;
  assign io_outputs_1_payload_frame_line_endOfLine = io_input_payload_frame_line_endOfLine;
  assign io_outputs_1_payload_frame_endOfFrame = io_input_payload_frame_endOfFrame;
  assign io_outputs_1_payload_endOfPack = io_input_payload_endOfPack;
  assign when_Stream_l764_1 = (1'b1 != io_select);
  always @(*) begin
    if(when_Stream_l764_1) begin
      io_outputs_1_valid = 1'b0;
    end else begin
      io_outputs_1_valid = io_input_valid;
    end
  end


endmodule

//ScalerINT16 replaced by ScalerINT16

//ScalerINT16 replaced by ScalerINT16

//ScalerINT16 replaced by ScalerINT16

module ScalerINT16 (
  input      [15:0]   scalerBase,
  input      [5:0]    scalerExpr,
  input               CEs_0,
  input               CEs_1,
  input               CEs_2,
  input               CEs_3,
  input               CEs_4,
  input               CEs_5,
  input      [23:0]   din,
  output     [7:0]    dout,
  input               clk,
  input               reset
);

  wire       [29:0]   mult_A;
  wire       [17:0]   mult_B;
  wire       [47:0]   mult_P;
  wire       [7:0]    fixTo_dout;
  wire       [29:0]   tmp_A;
  wire       [17:0]   tmp_B;
  wire       [16:0]   tmp_B_1;
  wire       [5:0]    tmp_shiftRes_1;
  wire       [47:0]   tmp_shiftRes_2;
  wire       [47:0]   tmp_shiftRes_3;
  wire       [47:0]   multRes;
  wire       [47:0]   tmp_shiftRes;
  reg        [47:0]   shiftRes;
  reg        [7:0]    fixTo_dout_regNextWhen;

  assign tmp_A = {{6{din[23]}}, din};
  assign tmp_B_1 = {1'b0,scalerBase};
  assign tmp_B = {{1{tmp_B_1[16]}}, tmp_B_1};
  assign tmp_shiftRes_1 = (scalerExpr - 6'h01);
  assign tmp_shiftRes_2 = ($signed(tmp_shiftRes) + $signed(tmp_shiftRes_3));
  assign tmp_shiftRes_3 = 48'h000000000001;
  AMultB mult (
    .A        (mult_A[29:0]  ), //i
    .B        (mult_B[17:0]  ), //i
    .P        (mult_P[47:0]  ), //o
    .CEs_0    (CEs_0         ), //i
    .CEs_1    (CEs_1         ), //i
    .CEs_2    (CEs_2         ), //i
    .CEs_3    (CEs_3         ), //i
    .clk      (clk           )  //i
  );
  SInt48fixTo7_0_ROUNDTOINF fixTo (
    .din     (shiftRes[47:0]   ), //i
    .dout    (fixTo_dout[7:0]  )  //o
  );
  assign mult_A = tmp_A;
  assign mult_B = tmp_B;
  assign multRes = mult_P;
  assign tmp_shiftRes = ($signed(multRes) >>> scalerExpr);
  assign dout = fixTo_dout_regNextWhen;
  always @(posedge clk) begin
    if(CEs_4) begin
      shiftRes <= (multRes[tmp_shiftRes_1] ? tmp_shiftRes_2 : tmp_shiftRes);
    end
    if(CEs_5) begin
      fixTo_dout_regNextWhen <= fixTo_dout;
    end
  end


endmodule

module EventM2sPipes_2 (
  input               eventIn_valid,
  output              eventIn_ready,
  output              eventOut_valid,
  input               eventOut_ready,
  output              CEs_0,
  output              CEs_1,
  output              CEs_2,
  output              CEs_3,
  output              CEs_4,
  output              CEs_5,
  input               clk,
  input               reset
);

  wire                events_0_valid;
  reg                 events_0_ready;
  wire                events_1_valid;
  reg                 events_1_ready;
  wire                events_2_valid;
  reg                 events_2_ready;
  wire                events_3_valid;
  reg                 events_3_ready;
  wire                events_4_valid;
  reg                 events_4_ready;
  wire                events_5_valid;
  reg                 events_5_ready;
  wire                events_0_m2sPipe_valid;
  wire                events_0_m2sPipe_ready;
  reg                 events_0_rValid;
  wire                when_Stream_l342;
  wire                events_1_m2sPipe_valid;
  wire                events_1_m2sPipe_ready;
  reg                 events_1_rValid;
  wire                when_Stream_l342_1;
  wire                events_2_m2sPipe_valid;
  wire                events_2_m2sPipe_ready;
  reg                 events_2_rValid;
  wire                when_Stream_l342_2;
  wire                events_3_m2sPipe_valid;
  wire                events_3_m2sPipe_ready;
  reg                 events_3_rValid;
  wire                when_Stream_l342_3;
  wire                events_4_m2sPipe_valid;
  wire                events_4_m2sPipe_ready;
  reg                 events_4_rValid;
  wire                when_Stream_l342_4;
  wire                events_5_m2sPipe_valid;
  wire                events_5_m2sPipe_ready;
  reg                 events_5_rValid;
  wire                when_Stream_l342_5;

  assign CEs_0 = events_0_ready;
  assign CEs_1 = events_1_ready;
  assign CEs_2 = events_2_ready;
  assign CEs_3 = events_3_ready;
  assign CEs_4 = events_4_ready;
  assign CEs_5 = events_5_ready;
  assign events_0_valid = eventIn_valid;
  assign eventIn_ready = events_0_ready;
  always @(*) begin
    events_0_ready = events_0_m2sPipe_ready;
    if(when_Stream_l342) begin
      events_0_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! events_0_m2sPipe_valid);
  assign events_0_m2sPipe_valid = events_0_rValid;
  assign events_1_valid = events_0_m2sPipe_valid;
  assign events_0_m2sPipe_ready = events_1_ready;
  always @(*) begin
    events_1_ready = events_1_m2sPipe_ready;
    if(when_Stream_l342_1) begin
      events_1_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! events_1_m2sPipe_valid);
  assign events_1_m2sPipe_valid = events_1_rValid;
  assign events_2_valid = events_1_m2sPipe_valid;
  assign events_1_m2sPipe_ready = events_2_ready;
  always @(*) begin
    events_2_ready = events_2_m2sPipe_ready;
    if(when_Stream_l342_2) begin
      events_2_ready = 1'b1;
    end
  end

  assign when_Stream_l342_2 = (! events_2_m2sPipe_valid);
  assign events_2_m2sPipe_valid = events_2_rValid;
  assign events_3_valid = events_2_m2sPipe_valid;
  assign events_2_m2sPipe_ready = events_3_ready;
  always @(*) begin
    events_3_ready = events_3_m2sPipe_ready;
    if(when_Stream_l342_3) begin
      events_3_ready = 1'b1;
    end
  end

  assign when_Stream_l342_3 = (! events_3_m2sPipe_valid);
  assign events_3_m2sPipe_valid = events_3_rValid;
  assign events_4_valid = events_3_m2sPipe_valid;
  assign events_3_m2sPipe_ready = events_4_ready;
  always @(*) begin
    events_4_ready = events_4_m2sPipe_ready;
    if(when_Stream_l342_4) begin
      events_4_ready = 1'b1;
    end
  end

  assign when_Stream_l342_4 = (! events_4_m2sPipe_valid);
  assign events_4_m2sPipe_valid = events_4_rValid;
  assign events_5_valid = events_4_m2sPipe_valid;
  assign events_4_m2sPipe_ready = events_5_ready;
  always @(*) begin
    events_5_ready = events_5_m2sPipe_ready;
    if(when_Stream_l342_5) begin
      events_5_ready = 1'b1;
    end
  end

  assign when_Stream_l342_5 = (! events_5_m2sPipe_valid);
  assign events_5_m2sPipe_valid = events_5_rValid;
  assign eventOut_valid = events_5_m2sPipe_valid;
  assign events_5_m2sPipe_ready = eventOut_ready;
  always @(posedge clk) begin
    if(reset) begin
      events_0_rValid <= 1'b0;
      events_1_rValid <= 1'b0;
      events_2_rValid <= 1'b0;
      events_3_rValid <= 1'b0;
      events_4_rValid <= 1'b0;
      events_5_rValid <= 1'b0;
    end else begin
      if(events_0_ready) begin
        events_0_rValid <= events_0_valid;
      end
      if(events_1_ready) begin
        events_1_rValid <= events_1_valid;
      end
      if(events_2_ready) begin
        events_2_rValid <= events_2_valid;
      end
      if(events_3_ready) begin
        events_3_rValid <= events_3_valid;
      end
      if(events_4_ready) begin
        events_4_rValid <= events_4_valid;
      end
      if(events_5_ready) begin
        events_5_rValid <= events_5_valid;
      end
    end
  end


endmodule

module StreamDemux (
  input      [0:0]    io_select,
  input               io_input_valid,
  output reg          io_input_ready,
  input      [7:0]    io_input_payload_0_0_0_0,
  input      [7:0]    io_input_payload_0_0_0_1,
  input      [7:0]    io_input_payload_0_0_0_2,
  input      [7:0]    io_input_payload_0_0_0_3,
  input      [7:0]    io_input_payload_0_0_1_0,
  input      [7:0]    io_input_payload_0_0_1_1,
  input      [7:0]    io_input_payload_0_0_1_2,
  input      [7:0]    io_input_payload_0_0_1_3,
  input      [7:0]    io_input_payload_0_0_2_0,
  input      [7:0]    io_input_payload_0_0_2_1,
  input      [7:0]    io_input_payload_0_0_2_2,
  input      [7:0]    io_input_payload_0_0_2_3,
  input      [7:0]    io_input_payload_0_1_0_0,
  input      [7:0]    io_input_payload_0_1_0_1,
  input      [7:0]    io_input_payload_0_1_0_2,
  input      [7:0]    io_input_payload_0_1_0_3,
  input      [7:0]    io_input_payload_0_1_1_0,
  input      [7:0]    io_input_payload_0_1_1_1,
  input      [7:0]    io_input_payload_0_1_1_2,
  input      [7:0]    io_input_payload_0_1_1_3,
  input      [7:0]    io_input_payload_0_1_2_0,
  input      [7:0]    io_input_payload_0_1_2_1,
  input      [7:0]    io_input_payload_0_1_2_2,
  input      [7:0]    io_input_payload_0_1_2_3,
  input      [7:0]    io_input_payload_0_2_0_0,
  input      [7:0]    io_input_payload_0_2_0_1,
  input      [7:0]    io_input_payload_0_2_0_2,
  input      [7:0]    io_input_payload_0_2_0_3,
  input      [7:0]    io_input_payload_0_2_1_0,
  input      [7:0]    io_input_payload_0_2_1_1,
  input      [7:0]    io_input_payload_0_2_1_2,
  input      [7:0]    io_input_payload_0_2_1_3,
  input      [7:0]    io_input_payload_0_2_2_0,
  input      [7:0]    io_input_payload_0_2_2_1,
  input      [7:0]    io_input_payload_0_2_2_2,
  input      [7:0]    io_input_payload_0_2_2_3,
  input      [7:0]    io_input_payload_1_0_0_0,
  input      [7:0]    io_input_payload_1_0_0_1,
  input      [7:0]    io_input_payload_1_0_0_2,
  input      [7:0]    io_input_payload_1_0_0_3,
  input      [7:0]    io_input_payload_1_0_1_0,
  input      [7:0]    io_input_payload_1_0_1_1,
  input      [7:0]    io_input_payload_1_0_1_2,
  input      [7:0]    io_input_payload_1_0_1_3,
  input      [7:0]    io_input_payload_1_0_2_0,
  input      [7:0]    io_input_payload_1_0_2_1,
  input      [7:0]    io_input_payload_1_0_2_2,
  input      [7:0]    io_input_payload_1_0_2_3,
  input      [7:0]    io_input_payload_1_1_0_0,
  input      [7:0]    io_input_payload_1_1_0_1,
  input      [7:0]    io_input_payload_1_1_0_2,
  input      [7:0]    io_input_payload_1_1_0_3,
  input      [7:0]    io_input_payload_1_1_1_0,
  input      [7:0]    io_input_payload_1_1_1_1,
  input      [7:0]    io_input_payload_1_1_1_2,
  input      [7:0]    io_input_payload_1_1_1_3,
  input      [7:0]    io_input_payload_1_1_2_0,
  input      [7:0]    io_input_payload_1_1_2_1,
  input      [7:0]    io_input_payload_1_1_2_2,
  input      [7:0]    io_input_payload_1_1_2_3,
  input      [7:0]    io_input_payload_1_2_0_0,
  input      [7:0]    io_input_payload_1_2_0_1,
  input      [7:0]    io_input_payload_1_2_0_2,
  input      [7:0]    io_input_payload_1_2_0_3,
  input      [7:0]    io_input_payload_1_2_1_0,
  input      [7:0]    io_input_payload_1_2_1_1,
  input      [7:0]    io_input_payload_1_2_1_2,
  input      [7:0]    io_input_payload_1_2_1_3,
  input      [7:0]    io_input_payload_1_2_2_0,
  input      [7:0]    io_input_payload_1_2_2_1,
  input      [7:0]    io_input_payload_1_2_2_2,
  input      [7:0]    io_input_payload_1_2_2_3,
  output reg          io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [7:0]    io_outputs_0_payload_0_0_0_0,
  output     [7:0]    io_outputs_0_payload_0_0_0_1,
  output     [7:0]    io_outputs_0_payload_0_0_0_2,
  output     [7:0]    io_outputs_0_payload_0_0_0_3,
  output     [7:0]    io_outputs_0_payload_0_0_1_0,
  output     [7:0]    io_outputs_0_payload_0_0_1_1,
  output     [7:0]    io_outputs_0_payload_0_0_1_2,
  output     [7:0]    io_outputs_0_payload_0_0_1_3,
  output     [7:0]    io_outputs_0_payload_0_0_2_0,
  output     [7:0]    io_outputs_0_payload_0_0_2_1,
  output     [7:0]    io_outputs_0_payload_0_0_2_2,
  output     [7:0]    io_outputs_0_payload_0_0_2_3,
  output     [7:0]    io_outputs_0_payload_0_1_0_0,
  output     [7:0]    io_outputs_0_payload_0_1_0_1,
  output     [7:0]    io_outputs_0_payload_0_1_0_2,
  output     [7:0]    io_outputs_0_payload_0_1_0_3,
  output     [7:0]    io_outputs_0_payload_0_1_1_0,
  output     [7:0]    io_outputs_0_payload_0_1_1_1,
  output     [7:0]    io_outputs_0_payload_0_1_1_2,
  output     [7:0]    io_outputs_0_payload_0_1_1_3,
  output     [7:0]    io_outputs_0_payload_0_1_2_0,
  output     [7:0]    io_outputs_0_payload_0_1_2_1,
  output     [7:0]    io_outputs_0_payload_0_1_2_2,
  output     [7:0]    io_outputs_0_payload_0_1_2_3,
  output     [7:0]    io_outputs_0_payload_0_2_0_0,
  output     [7:0]    io_outputs_0_payload_0_2_0_1,
  output     [7:0]    io_outputs_0_payload_0_2_0_2,
  output     [7:0]    io_outputs_0_payload_0_2_0_3,
  output     [7:0]    io_outputs_0_payload_0_2_1_0,
  output     [7:0]    io_outputs_0_payload_0_2_1_1,
  output     [7:0]    io_outputs_0_payload_0_2_1_2,
  output     [7:0]    io_outputs_0_payload_0_2_1_3,
  output     [7:0]    io_outputs_0_payload_0_2_2_0,
  output     [7:0]    io_outputs_0_payload_0_2_2_1,
  output     [7:0]    io_outputs_0_payload_0_2_2_2,
  output     [7:0]    io_outputs_0_payload_0_2_2_3,
  output     [7:0]    io_outputs_0_payload_1_0_0_0,
  output     [7:0]    io_outputs_0_payload_1_0_0_1,
  output     [7:0]    io_outputs_0_payload_1_0_0_2,
  output     [7:0]    io_outputs_0_payload_1_0_0_3,
  output     [7:0]    io_outputs_0_payload_1_0_1_0,
  output     [7:0]    io_outputs_0_payload_1_0_1_1,
  output     [7:0]    io_outputs_0_payload_1_0_1_2,
  output     [7:0]    io_outputs_0_payload_1_0_1_3,
  output     [7:0]    io_outputs_0_payload_1_0_2_0,
  output     [7:0]    io_outputs_0_payload_1_0_2_1,
  output     [7:0]    io_outputs_0_payload_1_0_2_2,
  output     [7:0]    io_outputs_0_payload_1_0_2_3,
  output     [7:0]    io_outputs_0_payload_1_1_0_0,
  output     [7:0]    io_outputs_0_payload_1_1_0_1,
  output     [7:0]    io_outputs_0_payload_1_1_0_2,
  output     [7:0]    io_outputs_0_payload_1_1_0_3,
  output     [7:0]    io_outputs_0_payload_1_1_1_0,
  output     [7:0]    io_outputs_0_payload_1_1_1_1,
  output     [7:0]    io_outputs_0_payload_1_1_1_2,
  output     [7:0]    io_outputs_0_payload_1_1_1_3,
  output     [7:0]    io_outputs_0_payload_1_1_2_0,
  output     [7:0]    io_outputs_0_payload_1_1_2_1,
  output     [7:0]    io_outputs_0_payload_1_1_2_2,
  output     [7:0]    io_outputs_0_payload_1_1_2_3,
  output     [7:0]    io_outputs_0_payload_1_2_0_0,
  output     [7:0]    io_outputs_0_payload_1_2_0_1,
  output     [7:0]    io_outputs_0_payload_1_2_0_2,
  output     [7:0]    io_outputs_0_payload_1_2_0_3,
  output     [7:0]    io_outputs_0_payload_1_2_1_0,
  output     [7:0]    io_outputs_0_payload_1_2_1_1,
  output     [7:0]    io_outputs_0_payload_1_2_1_2,
  output     [7:0]    io_outputs_0_payload_1_2_1_3,
  output     [7:0]    io_outputs_0_payload_1_2_2_0,
  output     [7:0]    io_outputs_0_payload_1_2_2_1,
  output     [7:0]    io_outputs_0_payload_1_2_2_2,
  output     [7:0]    io_outputs_0_payload_1_2_2_3,
  output reg          io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [7:0]    io_outputs_1_payload_0_0_0_0,
  output     [7:0]    io_outputs_1_payload_0_0_0_1,
  output     [7:0]    io_outputs_1_payload_0_0_0_2,
  output     [7:0]    io_outputs_1_payload_0_0_0_3,
  output     [7:0]    io_outputs_1_payload_0_0_1_0,
  output     [7:0]    io_outputs_1_payload_0_0_1_1,
  output     [7:0]    io_outputs_1_payload_0_0_1_2,
  output     [7:0]    io_outputs_1_payload_0_0_1_3,
  output     [7:0]    io_outputs_1_payload_0_0_2_0,
  output     [7:0]    io_outputs_1_payload_0_0_2_1,
  output     [7:0]    io_outputs_1_payload_0_0_2_2,
  output     [7:0]    io_outputs_1_payload_0_0_2_3,
  output     [7:0]    io_outputs_1_payload_0_1_0_0,
  output     [7:0]    io_outputs_1_payload_0_1_0_1,
  output     [7:0]    io_outputs_1_payload_0_1_0_2,
  output     [7:0]    io_outputs_1_payload_0_1_0_3,
  output     [7:0]    io_outputs_1_payload_0_1_1_0,
  output     [7:0]    io_outputs_1_payload_0_1_1_1,
  output     [7:0]    io_outputs_1_payload_0_1_1_2,
  output     [7:0]    io_outputs_1_payload_0_1_1_3,
  output     [7:0]    io_outputs_1_payload_0_1_2_0,
  output     [7:0]    io_outputs_1_payload_0_1_2_1,
  output     [7:0]    io_outputs_1_payload_0_1_2_2,
  output     [7:0]    io_outputs_1_payload_0_1_2_3,
  output     [7:0]    io_outputs_1_payload_0_2_0_0,
  output     [7:0]    io_outputs_1_payload_0_2_0_1,
  output     [7:0]    io_outputs_1_payload_0_2_0_2,
  output     [7:0]    io_outputs_1_payload_0_2_0_3,
  output     [7:0]    io_outputs_1_payload_0_2_1_0,
  output     [7:0]    io_outputs_1_payload_0_2_1_1,
  output     [7:0]    io_outputs_1_payload_0_2_1_2,
  output     [7:0]    io_outputs_1_payload_0_2_1_3,
  output     [7:0]    io_outputs_1_payload_0_2_2_0,
  output     [7:0]    io_outputs_1_payload_0_2_2_1,
  output     [7:0]    io_outputs_1_payload_0_2_2_2,
  output     [7:0]    io_outputs_1_payload_0_2_2_3,
  output     [7:0]    io_outputs_1_payload_1_0_0_0,
  output     [7:0]    io_outputs_1_payload_1_0_0_1,
  output     [7:0]    io_outputs_1_payload_1_0_0_2,
  output     [7:0]    io_outputs_1_payload_1_0_0_3,
  output     [7:0]    io_outputs_1_payload_1_0_1_0,
  output     [7:0]    io_outputs_1_payload_1_0_1_1,
  output     [7:0]    io_outputs_1_payload_1_0_1_2,
  output     [7:0]    io_outputs_1_payload_1_0_1_3,
  output     [7:0]    io_outputs_1_payload_1_0_2_0,
  output     [7:0]    io_outputs_1_payload_1_0_2_1,
  output     [7:0]    io_outputs_1_payload_1_0_2_2,
  output     [7:0]    io_outputs_1_payload_1_0_2_3,
  output     [7:0]    io_outputs_1_payload_1_1_0_0,
  output     [7:0]    io_outputs_1_payload_1_1_0_1,
  output     [7:0]    io_outputs_1_payload_1_1_0_2,
  output     [7:0]    io_outputs_1_payload_1_1_0_3,
  output     [7:0]    io_outputs_1_payload_1_1_1_0,
  output     [7:0]    io_outputs_1_payload_1_1_1_1,
  output     [7:0]    io_outputs_1_payload_1_1_1_2,
  output     [7:0]    io_outputs_1_payload_1_1_1_3,
  output     [7:0]    io_outputs_1_payload_1_1_2_0,
  output     [7:0]    io_outputs_1_payload_1_1_2_1,
  output     [7:0]    io_outputs_1_payload_1_1_2_2,
  output     [7:0]    io_outputs_1_payload_1_1_2_3,
  output     [7:0]    io_outputs_1_payload_1_2_0_0,
  output     [7:0]    io_outputs_1_payload_1_2_0_1,
  output     [7:0]    io_outputs_1_payload_1_2_0_2,
  output     [7:0]    io_outputs_1_payload_1_2_0_3,
  output     [7:0]    io_outputs_1_payload_1_2_1_0,
  output     [7:0]    io_outputs_1_payload_1_2_1_1,
  output     [7:0]    io_outputs_1_payload_1_2_1_2,
  output     [7:0]    io_outputs_1_payload_1_2_1_3,
  output     [7:0]    io_outputs_1_payload_1_2_2_0,
  output     [7:0]    io_outputs_1_payload_1_2_2_1,
  output     [7:0]    io_outputs_1_payload_1_2_2_2,
  output     [7:0]    io_outputs_1_payload_1_2_2_3
);

  wire                when_Stream_l764;
  wire                when_Stream_l764_1;

  always @(*) begin
    io_input_ready = 1'b0;
    if(!when_Stream_l764) begin
      io_input_ready = io_outputs_0_ready;
    end
    if(!when_Stream_l764_1) begin
      io_input_ready = io_outputs_1_ready;
    end
  end

  assign io_outputs_0_payload_0_0_0_0 = io_input_payload_0_0_0_0;
  assign io_outputs_0_payload_0_0_0_1 = io_input_payload_0_0_0_1;
  assign io_outputs_0_payload_0_0_0_2 = io_input_payload_0_0_0_2;
  assign io_outputs_0_payload_0_0_0_3 = io_input_payload_0_0_0_3;
  assign io_outputs_0_payload_0_0_1_0 = io_input_payload_0_0_1_0;
  assign io_outputs_0_payload_0_0_1_1 = io_input_payload_0_0_1_1;
  assign io_outputs_0_payload_0_0_1_2 = io_input_payload_0_0_1_2;
  assign io_outputs_0_payload_0_0_1_3 = io_input_payload_0_0_1_3;
  assign io_outputs_0_payload_0_0_2_0 = io_input_payload_0_0_2_0;
  assign io_outputs_0_payload_0_0_2_1 = io_input_payload_0_0_2_1;
  assign io_outputs_0_payload_0_0_2_2 = io_input_payload_0_0_2_2;
  assign io_outputs_0_payload_0_0_2_3 = io_input_payload_0_0_2_3;
  assign io_outputs_0_payload_0_1_0_0 = io_input_payload_0_1_0_0;
  assign io_outputs_0_payload_0_1_0_1 = io_input_payload_0_1_0_1;
  assign io_outputs_0_payload_0_1_0_2 = io_input_payload_0_1_0_2;
  assign io_outputs_0_payload_0_1_0_3 = io_input_payload_0_1_0_3;
  assign io_outputs_0_payload_0_1_1_0 = io_input_payload_0_1_1_0;
  assign io_outputs_0_payload_0_1_1_1 = io_input_payload_0_1_1_1;
  assign io_outputs_0_payload_0_1_1_2 = io_input_payload_0_1_1_2;
  assign io_outputs_0_payload_0_1_1_3 = io_input_payload_0_1_1_3;
  assign io_outputs_0_payload_0_1_2_0 = io_input_payload_0_1_2_0;
  assign io_outputs_0_payload_0_1_2_1 = io_input_payload_0_1_2_1;
  assign io_outputs_0_payload_0_1_2_2 = io_input_payload_0_1_2_2;
  assign io_outputs_0_payload_0_1_2_3 = io_input_payload_0_1_2_3;
  assign io_outputs_0_payload_0_2_0_0 = io_input_payload_0_2_0_0;
  assign io_outputs_0_payload_0_2_0_1 = io_input_payload_0_2_0_1;
  assign io_outputs_0_payload_0_2_0_2 = io_input_payload_0_2_0_2;
  assign io_outputs_0_payload_0_2_0_3 = io_input_payload_0_2_0_3;
  assign io_outputs_0_payload_0_2_1_0 = io_input_payload_0_2_1_0;
  assign io_outputs_0_payload_0_2_1_1 = io_input_payload_0_2_1_1;
  assign io_outputs_0_payload_0_2_1_2 = io_input_payload_0_2_1_2;
  assign io_outputs_0_payload_0_2_1_3 = io_input_payload_0_2_1_3;
  assign io_outputs_0_payload_0_2_2_0 = io_input_payload_0_2_2_0;
  assign io_outputs_0_payload_0_2_2_1 = io_input_payload_0_2_2_1;
  assign io_outputs_0_payload_0_2_2_2 = io_input_payload_0_2_2_2;
  assign io_outputs_0_payload_0_2_2_3 = io_input_payload_0_2_2_3;
  assign io_outputs_0_payload_1_0_0_0 = io_input_payload_1_0_0_0;
  assign io_outputs_0_payload_1_0_0_1 = io_input_payload_1_0_0_1;
  assign io_outputs_0_payload_1_0_0_2 = io_input_payload_1_0_0_2;
  assign io_outputs_0_payload_1_0_0_3 = io_input_payload_1_0_0_3;
  assign io_outputs_0_payload_1_0_1_0 = io_input_payload_1_0_1_0;
  assign io_outputs_0_payload_1_0_1_1 = io_input_payload_1_0_1_1;
  assign io_outputs_0_payload_1_0_1_2 = io_input_payload_1_0_1_2;
  assign io_outputs_0_payload_1_0_1_3 = io_input_payload_1_0_1_3;
  assign io_outputs_0_payload_1_0_2_0 = io_input_payload_1_0_2_0;
  assign io_outputs_0_payload_1_0_2_1 = io_input_payload_1_0_2_1;
  assign io_outputs_0_payload_1_0_2_2 = io_input_payload_1_0_2_2;
  assign io_outputs_0_payload_1_0_2_3 = io_input_payload_1_0_2_3;
  assign io_outputs_0_payload_1_1_0_0 = io_input_payload_1_1_0_0;
  assign io_outputs_0_payload_1_1_0_1 = io_input_payload_1_1_0_1;
  assign io_outputs_0_payload_1_1_0_2 = io_input_payload_1_1_0_2;
  assign io_outputs_0_payload_1_1_0_3 = io_input_payload_1_1_0_3;
  assign io_outputs_0_payload_1_1_1_0 = io_input_payload_1_1_1_0;
  assign io_outputs_0_payload_1_1_1_1 = io_input_payload_1_1_1_1;
  assign io_outputs_0_payload_1_1_1_2 = io_input_payload_1_1_1_2;
  assign io_outputs_0_payload_1_1_1_3 = io_input_payload_1_1_1_3;
  assign io_outputs_0_payload_1_1_2_0 = io_input_payload_1_1_2_0;
  assign io_outputs_0_payload_1_1_2_1 = io_input_payload_1_1_2_1;
  assign io_outputs_0_payload_1_1_2_2 = io_input_payload_1_1_2_2;
  assign io_outputs_0_payload_1_1_2_3 = io_input_payload_1_1_2_3;
  assign io_outputs_0_payload_1_2_0_0 = io_input_payload_1_2_0_0;
  assign io_outputs_0_payload_1_2_0_1 = io_input_payload_1_2_0_1;
  assign io_outputs_0_payload_1_2_0_2 = io_input_payload_1_2_0_2;
  assign io_outputs_0_payload_1_2_0_3 = io_input_payload_1_2_0_3;
  assign io_outputs_0_payload_1_2_1_0 = io_input_payload_1_2_1_0;
  assign io_outputs_0_payload_1_2_1_1 = io_input_payload_1_2_1_1;
  assign io_outputs_0_payload_1_2_1_2 = io_input_payload_1_2_1_2;
  assign io_outputs_0_payload_1_2_1_3 = io_input_payload_1_2_1_3;
  assign io_outputs_0_payload_1_2_2_0 = io_input_payload_1_2_2_0;
  assign io_outputs_0_payload_1_2_2_1 = io_input_payload_1_2_2_1;
  assign io_outputs_0_payload_1_2_2_2 = io_input_payload_1_2_2_2;
  assign io_outputs_0_payload_1_2_2_3 = io_input_payload_1_2_2_3;
  assign when_Stream_l764 = (1'b0 != io_select);
  always @(*) begin
    if(when_Stream_l764) begin
      io_outputs_0_valid = 1'b0;
    end else begin
      io_outputs_0_valid = io_input_valid;
    end
  end

  assign io_outputs_1_payload_0_0_0_0 = io_input_payload_0_0_0_0;
  assign io_outputs_1_payload_0_0_0_1 = io_input_payload_0_0_0_1;
  assign io_outputs_1_payload_0_0_0_2 = io_input_payload_0_0_0_2;
  assign io_outputs_1_payload_0_0_0_3 = io_input_payload_0_0_0_3;
  assign io_outputs_1_payload_0_0_1_0 = io_input_payload_0_0_1_0;
  assign io_outputs_1_payload_0_0_1_1 = io_input_payload_0_0_1_1;
  assign io_outputs_1_payload_0_0_1_2 = io_input_payload_0_0_1_2;
  assign io_outputs_1_payload_0_0_1_3 = io_input_payload_0_0_1_3;
  assign io_outputs_1_payload_0_0_2_0 = io_input_payload_0_0_2_0;
  assign io_outputs_1_payload_0_0_2_1 = io_input_payload_0_0_2_1;
  assign io_outputs_1_payload_0_0_2_2 = io_input_payload_0_0_2_2;
  assign io_outputs_1_payload_0_0_2_3 = io_input_payload_0_0_2_3;
  assign io_outputs_1_payload_0_1_0_0 = io_input_payload_0_1_0_0;
  assign io_outputs_1_payload_0_1_0_1 = io_input_payload_0_1_0_1;
  assign io_outputs_1_payload_0_1_0_2 = io_input_payload_0_1_0_2;
  assign io_outputs_1_payload_0_1_0_3 = io_input_payload_0_1_0_3;
  assign io_outputs_1_payload_0_1_1_0 = io_input_payload_0_1_1_0;
  assign io_outputs_1_payload_0_1_1_1 = io_input_payload_0_1_1_1;
  assign io_outputs_1_payload_0_1_1_2 = io_input_payload_0_1_1_2;
  assign io_outputs_1_payload_0_1_1_3 = io_input_payload_0_1_1_3;
  assign io_outputs_1_payload_0_1_2_0 = io_input_payload_0_1_2_0;
  assign io_outputs_1_payload_0_1_2_1 = io_input_payload_0_1_2_1;
  assign io_outputs_1_payload_0_1_2_2 = io_input_payload_0_1_2_2;
  assign io_outputs_1_payload_0_1_2_3 = io_input_payload_0_1_2_3;
  assign io_outputs_1_payload_0_2_0_0 = io_input_payload_0_2_0_0;
  assign io_outputs_1_payload_0_2_0_1 = io_input_payload_0_2_0_1;
  assign io_outputs_1_payload_0_2_0_2 = io_input_payload_0_2_0_2;
  assign io_outputs_1_payload_0_2_0_3 = io_input_payload_0_2_0_3;
  assign io_outputs_1_payload_0_2_1_0 = io_input_payload_0_2_1_0;
  assign io_outputs_1_payload_0_2_1_1 = io_input_payload_0_2_1_1;
  assign io_outputs_1_payload_0_2_1_2 = io_input_payload_0_2_1_2;
  assign io_outputs_1_payload_0_2_1_3 = io_input_payload_0_2_1_3;
  assign io_outputs_1_payload_0_2_2_0 = io_input_payload_0_2_2_0;
  assign io_outputs_1_payload_0_2_2_1 = io_input_payload_0_2_2_1;
  assign io_outputs_1_payload_0_2_2_2 = io_input_payload_0_2_2_2;
  assign io_outputs_1_payload_0_2_2_3 = io_input_payload_0_2_2_3;
  assign io_outputs_1_payload_1_0_0_0 = io_input_payload_1_0_0_0;
  assign io_outputs_1_payload_1_0_0_1 = io_input_payload_1_0_0_1;
  assign io_outputs_1_payload_1_0_0_2 = io_input_payload_1_0_0_2;
  assign io_outputs_1_payload_1_0_0_3 = io_input_payload_1_0_0_3;
  assign io_outputs_1_payload_1_0_1_0 = io_input_payload_1_0_1_0;
  assign io_outputs_1_payload_1_0_1_1 = io_input_payload_1_0_1_1;
  assign io_outputs_1_payload_1_0_1_2 = io_input_payload_1_0_1_2;
  assign io_outputs_1_payload_1_0_1_3 = io_input_payload_1_0_1_3;
  assign io_outputs_1_payload_1_0_2_0 = io_input_payload_1_0_2_0;
  assign io_outputs_1_payload_1_0_2_1 = io_input_payload_1_0_2_1;
  assign io_outputs_1_payload_1_0_2_2 = io_input_payload_1_0_2_2;
  assign io_outputs_1_payload_1_0_2_3 = io_input_payload_1_0_2_3;
  assign io_outputs_1_payload_1_1_0_0 = io_input_payload_1_1_0_0;
  assign io_outputs_1_payload_1_1_0_1 = io_input_payload_1_1_0_1;
  assign io_outputs_1_payload_1_1_0_2 = io_input_payload_1_1_0_2;
  assign io_outputs_1_payload_1_1_0_3 = io_input_payload_1_1_0_3;
  assign io_outputs_1_payload_1_1_1_0 = io_input_payload_1_1_1_0;
  assign io_outputs_1_payload_1_1_1_1 = io_input_payload_1_1_1_1;
  assign io_outputs_1_payload_1_1_1_2 = io_input_payload_1_1_1_2;
  assign io_outputs_1_payload_1_1_1_3 = io_input_payload_1_1_1_3;
  assign io_outputs_1_payload_1_1_2_0 = io_input_payload_1_1_2_0;
  assign io_outputs_1_payload_1_1_2_1 = io_input_payload_1_1_2_1;
  assign io_outputs_1_payload_1_1_2_2 = io_input_payload_1_1_2_2;
  assign io_outputs_1_payload_1_1_2_3 = io_input_payload_1_1_2_3;
  assign io_outputs_1_payload_1_2_0_0 = io_input_payload_1_2_0_0;
  assign io_outputs_1_payload_1_2_0_1 = io_input_payload_1_2_0_1;
  assign io_outputs_1_payload_1_2_0_2 = io_input_payload_1_2_0_2;
  assign io_outputs_1_payload_1_2_0_3 = io_input_payload_1_2_0_3;
  assign io_outputs_1_payload_1_2_1_0 = io_input_payload_1_2_1_0;
  assign io_outputs_1_payload_1_2_1_1 = io_input_payload_1_2_1_1;
  assign io_outputs_1_payload_1_2_1_2 = io_input_payload_1_2_1_2;
  assign io_outputs_1_payload_1_2_1_3 = io_input_payload_1_2_1_3;
  assign io_outputs_1_payload_1_2_2_0 = io_input_payload_1_2_2_0;
  assign io_outputs_1_payload_1_2_2_1 = io_input_payload_1_2_2_1;
  assign io_outputs_1_payload_1_2_2_2 = io_input_payload_1_2_2_2;
  assign io_outputs_1_payload_1_2_2_3 = io_input_payload_1_2_2_3;
  assign when_Stream_l764_1 = (1'b1 != io_select);
  always @(*) begin
    if(when_Stream_l764_1) begin
      io_outputs_1_valid = 1'b0;
    end else begin
      io_outputs_1_valid = io_input_valid;
    end
  end


endmodule

module LookUpTable (
  input               newTable_valid,
  output              newTable_ready,
  input      [7:0]    newTable_payload,
  input               index_valid,
  output reg          index_ready,
  input      [7:0]    index_payload_0,
  input      [7:0]    index_payload_1,
  input      [7:0]    index_payload_2,
  input      [7:0]    index_payload_3,
  output              value_valid,
  input               value_ready,
  output     [7:0]    value_payload_0,
  output     [7:0]    value_payload_1,
  output     [7:0]    value_payload_2,
  output     [7:0]    value_payload_3,
  input               clk,
  input               reset
);

  reg        [7:0]    tmp_ram_port1;
  reg        [7:0]    tmp_ram_port2;
  reg        [7:0]    tmp_ram_port3;
  reg        [7:0]    tmp_ram_port4;
  wire       [7:0]    tmp_cnt_valueNext;
  wire       [0:0]    tmp_cnt_valueNext_1;
  wire                newTable_fire;
  reg                 cnt_willIncrement;
  wire                cnt_willClear;
  reg        [7:0]    cnt_valueNext;
  reg        [7:0]    cnt_value;
  wire                cnt_willOverflowIfInc;
  wire                cnt_willOverflow;
  wire                newTable_fire_1;
  wire       [7:0]    tmp_rData_0;
  wire       [7:0]    rData_0;
  wire       [7:0]    tmp_rData_1;
  wire       [7:0]    rData_1;
  wire       [7:0]    tmp_rData_2;
  wire       [7:0]    rData_2;
  wire       [7:0]    tmp_rData_3;
  wire       [7:0]    rData_3;
  reg                 rValid;
  wire                when_LookUpTable_l25;
  (* ram_style = "distributed" *) reg [7:0] ram [0:255];

  assign tmp_cnt_valueNext_1 = cnt_willIncrement;
  assign tmp_cnt_valueNext = {7'd0, tmp_cnt_valueNext_1};
  always @(posedge clk) begin
    if(newTable_fire_1) begin
      ram[cnt_value] <= newTable_payload;
    end
  end

  always @(posedge clk) begin
    if(index_ready) begin
      tmp_ram_port1 <= ram[tmp_rData_0];
    end
  end

  always @(posedge clk) begin
    if(index_ready) begin
      tmp_ram_port2 <= ram[tmp_rData_1];
    end
  end

  always @(posedge clk) begin
    if(index_ready) begin
      tmp_ram_port3 <= ram[tmp_rData_2];
    end
  end

  always @(posedge clk) begin
    if(index_ready) begin
      tmp_ram_port4 <= ram[tmp_rData_3];
    end
  end

  assign newTable_fire = (newTable_valid && newTable_ready);
  always @(*) begin
    cnt_willIncrement = 1'b0;
    if(newTable_fire) begin
      cnt_willIncrement = 1'b1;
    end
  end

  assign cnt_willClear = 1'b0;
  assign cnt_willOverflowIfInc = (cnt_value == 8'hff);
  assign cnt_willOverflow = (cnt_willOverflowIfInc && cnt_willIncrement);
  always @(*) begin
    cnt_valueNext = (cnt_value + tmp_cnt_valueNext);
    if(cnt_willClear) begin
      cnt_valueNext = 8'h0;
    end
  end

  assign newTable_fire_1 = (newTable_valid && newTable_ready);
  assign newTable_ready = 1'b1;
  assign tmp_rData_0 = index_payload_0;
  assign rData_0 = tmp_ram_port1;
  assign tmp_rData_1 = index_payload_1;
  assign rData_1 = tmp_ram_port2;
  assign tmp_rData_2 = index_payload_2;
  assign rData_2 = tmp_ram_port3;
  assign tmp_rData_3 = index_payload_3;
  assign rData_3 = tmp_ram_port4;
  always @(*) begin
    index_ready = value_ready;
    if(when_LookUpTable_l25) begin
      index_ready = 1'b1;
    end
  end

  assign when_LookUpTable_l25 = (! rValid);
  assign value_valid = rValid;
  assign value_payload_0 = rData_0;
  assign value_payload_1 = rData_1;
  assign value_payload_2 = rData_2;
  assign value_payload_3 = rData_3;
  always @(posedge clk) begin
    if(reset) begin
      cnt_value <= 8'h0;
      rValid <= 1'b0;
    end else begin
      cnt_value <= cnt_valueNext;
      if(index_ready) begin
        rValid <= index_valid;
      end
    end
  end


endmodule

module VideoPooling (
  input               videoIn_valid,
  output              videoIn_ready,
  input      [7:0]    videoIn_payload_frame_line_pixel_0,
  input      [7:0]    videoIn_payload_frame_line_pixel_1,
  input      [7:0]    videoIn_payload_frame_line_pixel_2,
  input      [7:0]    videoIn_payload_frame_line_pixel_3,
  input               videoIn_payload_frame_line_endOfLine,
  input               videoIn_payload_frame_endOfFrame,
  input               videoIn_payload_endOfPack,
  output              videoOut_valid,
  input               videoOut_ready,
  output     [7:0]    videoOut_payload_frame_line_pixel_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_3,
  output              videoOut_payload_frame_line_endOfLine,
  output              videoOut_payload_frame_endOfFrame,
  output              videoOut_payload_endOfPack,
  input               clk,
  input               reset
);

  wire                window_videoIn_ready;
  wire                window_videoOut_valid;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_0_0;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_0_1;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_0_2;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_0_3;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_1_0;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_1_1;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_1_2;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_0_1_3;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_0_0;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_0_1;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_0_2;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_0_3;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_1_0;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_1_1;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_1_2;
  wire       [7:0]    window_videoOut_payload_frame_line_pixel_1_1_3;
  wire                window_videoOut_payload_frame_line_endOfLine;
  wire                window_videoOut_payload_frame_endOfFrame;
  wire                window_videoOut_payload_endOfPack;
  wire                downSample_videoIn_ready;
  wire                downSample_videoOut_valid;
  wire       [7:0]    downSample_videoOut_payload_frame_line_pixel_0;
  wire       [7:0]    downSample_videoOut_payload_frame_line_pixel_1;
  wire       [7:0]    downSample_videoOut_payload_frame_line_pixel_2;
  wire       [7:0]    downSample_videoOut_payload_frame_line_pixel_3;
  wire                downSample_videoOut_payload_frame_line_endOfLine;
  wire                downSample_videoOut_payload_frame_endOfFrame;
  wire                downSample_videoOut_payload_endOfPack;
  wire                merge_valid;
  reg                 merge_ready;
  wire       [7:0]    merge_payload_frame_line_pixel_0_0;
  wire       [7:0]    merge_payload_frame_line_pixel_0_1;
  wire       [7:0]    merge_payload_frame_line_pixel_0_2;
  wire       [7:0]    merge_payload_frame_line_pixel_0_3;
  wire       [7:0]    merge_payload_frame_line_pixel_1_0;
  wire       [7:0]    merge_payload_frame_line_pixel_1_1;
  wire       [7:0]    merge_payload_frame_line_pixel_1_2;
  wire       [7:0]    merge_payload_frame_line_pixel_1_3;
  wire                merge_payload_frame_line_endOfLine;
  wire                merge_payload_frame_endOfFrame;
  wire                merge_payload_endOfPack;
  wire                mergePipe_valid;
  wire                mergePipe_ready;
  wire       [7:0]    mergePipe_payload_frame_line_pixel_0_0;
  wire       [7:0]    mergePipe_payload_frame_line_pixel_0_1;
  wire       [7:0]    mergePipe_payload_frame_line_pixel_0_2;
  wire       [7:0]    mergePipe_payload_frame_line_pixel_0_3;
  wire       [7:0]    mergePipe_payload_frame_line_pixel_1_0;
  wire       [7:0]    mergePipe_payload_frame_line_pixel_1_1;
  wire       [7:0]    mergePipe_payload_frame_line_pixel_1_2;
  wire       [7:0]    mergePipe_payload_frame_line_pixel_1_3;
  wire                mergePipe_payload_frame_line_endOfLine;
  wire                mergePipe_payload_frame_endOfFrame;
  wire                mergePipe_payload_endOfPack;
  reg                 merge_rValid;
  reg        [7:0]    merge_rData_frame_line_pixel_0_0;
  reg        [7:0]    merge_rData_frame_line_pixel_0_1;
  reg        [7:0]    merge_rData_frame_line_pixel_0_2;
  reg        [7:0]    merge_rData_frame_line_pixel_0_3;
  reg        [7:0]    merge_rData_frame_line_pixel_1_0;
  reg        [7:0]    merge_rData_frame_line_pixel_1_1;
  reg        [7:0]    merge_rData_frame_line_pixel_1_2;
  reg        [7:0]    merge_rData_frame_line_pixel_1_3;
  reg                 merge_rData_frame_line_endOfLine;
  reg                 merge_rData_frame_endOfFrame;
  reg                 merge_rData_endOfPack;
  wire                when_Stream_l342;
  wire                bridge_valid;
  reg                 bridge_ready;
  wire       [7:0]    bridge_payload_frame_line_pixel_0;
  wire       [7:0]    bridge_payload_frame_line_pixel_1;
  wire       [7:0]    bridge_payload_frame_line_pixel_2;
  wire       [7:0]    bridge_payload_frame_line_pixel_3;
  wire                bridge_payload_frame_line_endOfLine;
  wire                bridge_payload_frame_endOfFrame;
  wire                bridge_payload_endOfPack;
  wire                bridgePipe_valid;
  wire                bridgePipe_ready;
  wire       [7:0]    bridgePipe_payload_frame_line_pixel_0;
  wire       [7:0]    bridgePipe_payload_frame_line_pixel_1;
  wire       [7:0]    bridgePipe_payload_frame_line_pixel_2;
  wire       [7:0]    bridgePipe_payload_frame_line_pixel_3;
  wire                bridgePipe_payload_frame_line_endOfLine;
  wire                bridgePipe_payload_frame_endOfFrame;
  wire                bridgePipe_payload_endOfPack;
  reg                 bridge_rValid;
  reg        [7:0]    bridge_rData_frame_line_pixel_0;
  reg        [7:0]    bridge_rData_frame_line_pixel_1;
  reg        [7:0]    bridge_rData_frame_line_pixel_2;
  reg        [7:0]    bridge_rData_frame_line_pixel_3;
  reg                 bridge_rData_frame_line_endOfLine;
  reg                 bridge_rData_frame_endOfFrame;
  reg                 bridge_rData_endOfPack;
  wire                when_Stream_l342_1;

  SlidingWindowValid window (
    .videoIn_valid                              (videoIn_valid                                        ), //i
    .videoIn_ready                              (window_videoIn_ready                                 ), //o
    .videoIn_payload_frame_line_pixel_0         (videoIn_payload_frame_line_pixel_0[7:0]              ), //i
    .videoIn_payload_frame_line_pixel_1         (videoIn_payload_frame_line_pixel_1[7:0]              ), //i
    .videoIn_payload_frame_line_pixel_2         (videoIn_payload_frame_line_pixel_2[7:0]              ), //i
    .videoIn_payload_frame_line_pixel_3         (videoIn_payload_frame_line_pixel_3[7:0]              ), //i
    .videoIn_payload_frame_line_endOfLine       (videoIn_payload_frame_line_endOfLine                 ), //i
    .videoIn_payload_frame_endOfFrame           (videoIn_payload_frame_endOfFrame                     ), //i
    .videoIn_payload_endOfPack                  (videoIn_payload_endOfPack                            ), //i
    .videoOut_valid                             (window_videoOut_valid                                ), //o
    .videoOut_ready                             (merge_ready                                          ), //i
    .videoOut_payload_frame_line_pixel_0_0_0    (window_videoOut_payload_frame_line_pixel_0_0_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_0_1    (window_videoOut_payload_frame_line_pixel_0_0_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_0_2    (window_videoOut_payload_frame_line_pixel_0_0_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_0_3    (window_videoOut_payload_frame_line_pixel_0_0_3[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_1_0    (window_videoOut_payload_frame_line_pixel_0_1_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_1_1    (window_videoOut_payload_frame_line_pixel_0_1_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_1_2    (window_videoOut_payload_frame_line_pixel_0_1_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_1_3    (window_videoOut_payload_frame_line_pixel_0_1_3[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_0_0    (window_videoOut_payload_frame_line_pixel_1_0_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_0_1    (window_videoOut_payload_frame_line_pixel_1_0_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_0_2    (window_videoOut_payload_frame_line_pixel_1_0_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_0_3    (window_videoOut_payload_frame_line_pixel_1_0_3[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_1_0    (window_videoOut_payload_frame_line_pixel_1_1_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_1_1    (window_videoOut_payload_frame_line_pixel_1_1_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_1_2    (window_videoOut_payload_frame_line_pixel_1_1_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_1_3    (window_videoOut_payload_frame_line_pixel_1_1_3[7:0]  ), //o
    .videoOut_payload_frame_line_endOfLine      (window_videoOut_payload_frame_line_endOfLine         ), //o
    .videoOut_payload_frame_endOfFrame          (window_videoOut_payload_frame_endOfFrame             ), //o
    .videoOut_payload_endOfPack                 (window_videoOut_payload_endOfPack                    ), //o
    .clk                                        (clk                                                  ), //i
    .reset                                      (reset                                                )  //i
  );
  VideoDownSample downSample (
    .videoIn_valid                            (bridgePipe_valid                                     ), //i
    .videoIn_ready                            (downSample_videoIn_ready                             ), //o
    .videoIn_payload_frame_line_pixel_0       (bridgePipe_payload_frame_line_pixel_0[7:0]           ), //i
    .videoIn_payload_frame_line_pixel_1       (bridgePipe_payload_frame_line_pixel_1[7:0]           ), //i
    .videoIn_payload_frame_line_pixel_2       (bridgePipe_payload_frame_line_pixel_2[7:0]           ), //i
    .videoIn_payload_frame_line_pixel_3       (bridgePipe_payload_frame_line_pixel_3[7:0]           ), //i
    .videoIn_payload_frame_line_endOfLine     (bridgePipe_payload_frame_line_endOfLine              ), //i
    .videoIn_payload_frame_endOfFrame         (bridgePipe_payload_frame_endOfFrame                  ), //i
    .videoIn_payload_endOfPack                (bridgePipe_payload_endOfPack                         ), //i
    .videoOut_valid                           (downSample_videoOut_valid                            ), //o
    .videoOut_ready                           (videoOut_ready                                       ), //i
    .videoOut_payload_frame_line_pixel_0      (downSample_videoOut_payload_frame_line_pixel_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1      (downSample_videoOut_payload_frame_line_pixel_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2      (downSample_videoOut_payload_frame_line_pixel_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_3      (downSample_videoOut_payload_frame_line_pixel_3[7:0]  ), //o
    .videoOut_payload_frame_line_endOfLine    (downSample_videoOut_payload_frame_line_endOfLine     ), //o
    .videoOut_payload_frame_endOfFrame        (downSample_videoOut_payload_frame_endOfFrame         ), //o
    .videoOut_payload_endOfPack               (downSample_videoOut_payload_endOfPack                ), //o
    .clk                                      (clk                                                  ), //i
    .reset                                    (reset                                                )  //i
  );
  assign videoIn_ready = window_videoIn_ready;
  always @(*) begin
    merge_ready = mergePipe_ready;
    if(when_Stream_l342) begin
      merge_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! mergePipe_valid);
  assign mergePipe_valid = merge_rValid;
  assign mergePipe_payload_frame_line_pixel_0_0 = merge_rData_frame_line_pixel_0_0;
  assign mergePipe_payload_frame_line_pixel_0_1 = merge_rData_frame_line_pixel_0_1;
  assign mergePipe_payload_frame_line_pixel_0_2 = merge_rData_frame_line_pixel_0_2;
  assign mergePipe_payload_frame_line_pixel_0_3 = merge_rData_frame_line_pixel_0_3;
  assign mergePipe_payload_frame_line_pixel_1_0 = merge_rData_frame_line_pixel_1_0;
  assign mergePipe_payload_frame_line_pixel_1_1 = merge_rData_frame_line_pixel_1_1;
  assign mergePipe_payload_frame_line_pixel_1_2 = merge_rData_frame_line_pixel_1_2;
  assign mergePipe_payload_frame_line_pixel_1_3 = merge_rData_frame_line_pixel_1_3;
  assign mergePipe_payload_frame_line_endOfLine = merge_rData_frame_line_endOfLine;
  assign mergePipe_payload_frame_endOfFrame = merge_rData_frame_endOfFrame;
  assign mergePipe_payload_endOfPack = merge_rData_endOfPack;
  assign merge_valid = window_videoOut_valid;
  assign merge_payload_endOfPack = window_videoOut_payload_endOfPack;
  assign merge_payload_frame_endOfFrame = window_videoOut_payload_frame_endOfFrame;
  assign merge_payload_frame_line_endOfLine = window_videoOut_payload_frame_line_endOfLine;
  assign merge_payload_frame_line_pixel_0_0 = (($signed(window_videoOut_payload_frame_line_pixel_0_1_0) < $signed(window_videoOut_payload_frame_line_pixel_0_0_0)) ? window_videoOut_payload_frame_line_pixel_0_0_0 : window_videoOut_payload_frame_line_pixel_0_1_0);
  assign merge_payload_frame_line_pixel_0_1 = (($signed(window_videoOut_payload_frame_line_pixel_0_1_1) < $signed(window_videoOut_payload_frame_line_pixel_0_0_1)) ? window_videoOut_payload_frame_line_pixel_0_0_1 : window_videoOut_payload_frame_line_pixel_0_1_1);
  assign merge_payload_frame_line_pixel_0_2 = (($signed(window_videoOut_payload_frame_line_pixel_0_1_2) < $signed(window_videoOut_payload_frame_line_pixel_0_0_2)) ? window_videoOut_payload_frame_line_pixel_0_0_2 : window_videoOut_payload_frame_line_pixel_0_1_2);
  assign merge_payload_frame_line_pixel_0_3 = (($signed(window_videoOut_payload_frame_line_pixel_0_1_3) < $signed(window_videoOut_payload_frame_line_pixel_0_0_3)) ? window_videoOut_payload_frame_line_pixel_0_0_3 : window_videoOut_payload_frame_line_pixel_0_1_3);
  assign merge_payload_frame_line_pixel_1_0 = (($signed(window_videoOut_payload_frame_line_pixel_1_1_0) < $signed(window_videoOut_payload_frame_line_pixel_1_0_0)) ? window_videoOut_payload_frame_line_pixel_1_0_0 : window_videoOut_payload_frame_line_pixel_1_1_0);
  assign merge_payload_frame_line_pixel_1_1 = (($signed(window_videoOut_payload_frame_line_pixel_1_1_1) < $signed(window_videoOut_payload_frame_line_pixel_1_0_1)) ? window_videoOut_payload_frame_line_pixel_1_0_1 : window_videoOut_payload_frame_line_pixel_1_1_1);
  assign merge_payload_frame_line_pixel_1_2 = (($signed(window_videoOut_payload_frame_line_pixel_1_1_2) < $signed(window_videoOut_payload_frame_line_pixel_1_0_2)) ? window_videoOut_payload_frame_line_pixel_1_0_2 : window_videoOut_payload_frame_line_pixel_1_1_2);
  assign merge_payload_frame_line_pixel_1_3 = (($signed(window_videoOut_payload_frame_line_pixel_1_1_3) < $signed(window_videoOut_payload_frame_line_pixel_1_0_3)) ? window_videoOut_payload_frame_line_pixel_1_0_3 : window_videoOut_payload_frame_line_pixel_1_1_3);
  always @(*) begin
    bridge_ready = bridgePipe_ready;
    if(when_Stream_l342_1) begin
      bridge_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! bridgePipe_valid);
  assign bridgePipe_valid = bridge_rValid;
  assign bridgePipe_payload_frame_line_pixel_0 = bridge_rData_frame_line_pixel_0;
  assign bridgePipe_payload_frame_line_pixel_1 = bridge_rData_frame_line_pixel_1;
  assign bridgePipe_payload_frame_line_pixel_2 = bridge_rData_frame_line_pixel_2;
  assign bridgePipe_payload_frame_line_pixel_3 = bridge_rData_frame_line_pixel_3;
  assign bridgePipe_payload_frame_line_endOfLine = bridge_rData_frame_line_endOfLine;
  assign bridgePipe_payload_frame_endOfFrame = bridge_rData_frame_endOfFrame;
  assign bridgePipe_payload_endOfPack = bridge_rData_endOfPack;
  assign bridge_valid = mergePipe_valid;
  assign mergePipe_ready = bridge_ready;
  assign bridge_payload_endOfPack = mergePipe_payload_endOfPack;
  assign bridge_payload_frame_endOfFrame = mergePipe_payload_frame_endOfFrame;
  assign bridge_payload_frame_line_endOfLine = mergePipe_payload_frame_line_endOfLine;
  assign bridge_payload_frame_line_pixel_0 = (($signed(mergePipe_payload_frame_line_pixel_1_0) < $signed(mergePipe_payload_frame_line_pixel_0_0)) ? mergePipe_payload_frame_line_pixel_0_0 : mergePipe_payload_frame_line_pixel_1_0);
  assign bridge_payload_frame_line_pixel_1 = (($signed(mergePipe_payload_frame_line_pixel_1_1) < $signed(mergePipe_payload_frame_line_pixel_0_1)) ? mergePipe_payload_frame_line_pixel_0_1 : mergePipe_payload_frame_line_pixel_1_1);
  assign bridge_payload_frame_line_pixel_2 = (($signed(mergePipe_payload_frame_line_pixel_1_2) < $signed(mergePipe_payload_frame_line_pixel_0_2)) ? mergePipe_payload_frame_line_pixel_0_2 : mergePipe_payload_frame_line_pixel_1_2);
  assign bridge_payload_frame_line_pixel_3 = (($signed(mergePipe_payload_frame_line_pixel_1_3) < $signed(mergePipe_payload_frame_line_pixel_0_3)) ? mergePipe_payload_frame_line_pixel_0_3 : mergePipe_payload_frame_line_pixel_1_3);
  assign bridgePipe_ready = downSample_videoIn_ready;
  assign videoOut_valid = downSample_videoOut_valid;
  assign videoOut_payload_frame_line_pixel_0 = downSample_videoOut_payload_frame_line_pixel_0;
  assign videoOut_payload_frame_line_pixel_1 = downSample_videoOut_payload_frame_line_pixel_1;
  assign videoOut_payload_frame_line_pixel_2 = downSample_videoOut_payload_frame_line_pixel_2;
  assign videoOut_payload_frame_line_pixel_3 = downSample_videoOut_payload_frame_line_pixel_3;
  assign videoOut_payload_frame_line_endOfLine = downSample_videoOut_payload_frame_line_endOfLine;
  assign videoOut_payload_frame_endOfFrame = downSample_videoOut_payload_frame_endOfFrame;
  assign videoOut_payload_endOfPack = downSample_videoOut_payload_endOfPack;
  always @(posedge clk) begin
    if(reset) begin
      merge_rValid <= 1'b0;
      bridge_rValid <= 1'b0;
    end else begin
      if(merge_ready) begin
        merge_rValid <= merge_valid;
      end
      if(bridge_ready) begin
        bridge_rValid <= bridge_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(merge_ready) begin
      merge_rData_frame_line_pixel_0_0 <= merge_payload_frame_line_pixel_0_0;
      merge_rData_frame_line_pixel_0_1 <= merge_payload_frame_line_pixel_0_1;
      merge_rData_frame_line_pixel_0_2 <= merge_payload_frame_line_pixel_0_2;
      merge_rData_frame_line_pixel_0_3 <= merge_payload_frame_line_pixel_0_3;
      merge_rData_frame_line_pixel_1_0 <= merge_payload_frame_line_pixel_1_0;
      merge_rData_frame_line_pixel_1_1 <= merge_payload_frame_line_pixel_1_1;
      merge_rData_frame_line_pixel_1_2 <= merge_payload_frame_line_pixel_1_2;
      merge_rData_frame_line_pixel_1_3 <= merge_payload_frame_line_pixel_1_3;
      merge_rData_frame_line_endOfLine <= merge_payload_frame_line_endOfLine;
      merge_rData_frame_endOfFrame <= merge_payload_frame_endOfFrame;
      merge_rData_endOfPack <= merge_payload_endOfPack;
    end
    if(bridge_ready) begin
      bridge_rData_frame_line_pixel_0 <= bridge_payload_frame_line_pixel_0;
      bridge_rData_frame_line_pixel_1 <= bridge_payload_frame_line_pixel_1;
      bridge_rData_frame_line_pixel_2 <= bridge_payload_frame_line_pixel_2;
      bridge_rData_frame_line_pixel_3 <= bridge_payload_frame_line_pixel_3;
      bridge_rData_frame_line_endOfLine <= bridge_payload_frame_line_endOfLine;
      bridge_rData_frame_endOfFrame <= bridge_payload_frame_endOfFrame;
      bridge_rData_endOfPack <= bridge_payload_endOfPack;
    end
  end


endmodule

//PecaUnit replaced by PecaUnit

module PecaUnit (
  input      [7:0]    numberOfInputFrames,
  input      [7:0]    numberOfOutputFrames,
  input               inputs_valid,
  output              inputs_ready,
  input      [7:0]    inputs_payload_frame_line_pixel_0_0_0,
  input      [7:0]    inputs_payload_frame_line_pixel_0_0_1,
  input      [7:0]    inputs_payload_frame_line_pixel_0_0_2,
  input      [7:0]    inputs_payload_frame_line_pixel_0_0_3,
  input      [7:0]    inputs_payload_frame_line_pixel_0_1_0,
  input      [7:0]    inputs_payload_frame_line_pixel_0_1_1,
  input      [7:0]    inputs_payload_frame_line_pixel_0_1_2,
  input      [7:0]    inputs_payload_frame_line_pixel_0_1_3,
  input      [7:0]    inputs_payload_frame_line_pixel_0_2_0,
  input      [7:0]    inputs_payload_frame_line_pixel_0_2_1,
  input      [7:0]    inputs_payload_frame_line_pixel_0_2_2,
  input      [7:0]    inputs_payload_frame_line_pixel_0_2_3,
  input      [7:0]    inputs_payload_frame_line_pixel_1_0_0,
  input      [7:0]    inputs_payload_frame_line_pixel_1_0_1,
  input      [7:0]    inputs_payload_frame_line_pixel_1_0_2,
  input      [7:0]    inputs_payload_frame_line_pixel_1_0_3,
  input      [7:0]    inputs_payload_frame_line_pixel_1_1_0,
  input      [7:0]    inputs_payload_frame_line_pixel_1_1_1,
  input      [7:0]    inputs_payload_frame_line_pixel_1_1_2,
  input      [7:0]    inputs_payload_frame_line_pixel_1_1_3,
  input      [7:0]    inputs_payload_frame_line_pixel_1_2_0,
  input      [7:0]    inputs_payload_frame_line_pixel_1_2_1,
  input      [7:0]    inputs_payload_frame_line_pixel_1_2_2,
  input      [7:0]    inputs_payload_frame_line_pixel_1_2_3,
  input      [7:0]    inputs_payload_frame_line_pixel_2_0_0,
  input      [7:0]    inputs_payload_frame_line_pixel_2_0_1,
  input      [7:0]    inputs_payload_frame_line_pixel_2_0_2,
  input      [7:0]    inputs_payload_frame_line_pixel_2_0_3,
  input      [7:0]    inputs_payload_frame_line_pixel_2_1_0,
  input      [7:0]    inputs_payload_frame_line_pixel_2_1_1,
  input      [7:0]    inputs_payload_frame_line_pixel_2_1_2,
  input      [7:0]    inputs_payload_frame_line_pixel_2_1_3,
  input      [7:0]    inputs_payload_frame_line_pixel_2_2_0,
  input      [7:0]    inputs_payload_frame_line_pixel_2_2_1,
  input      [7:0]    inputs_payload_frame_line_pixel_2_2_2,
  input      [7:0]    inputs_payload_frame_line_pixel_2_2_3,
  input               inputs_payload_frame_line_endOfLine,
  input               inputs_payload_frame_endOfFrame,
  input               inputs_payload_endOfPack,
  input               weights_valid,
  output              weights_ready,
  input      [7:0]    weights_payload_0_0_0_0,
  input      [7:0]    weights_payload_0_0_0_1,
  input      [7:0]    weights_payload_0_0_0_2,
  input      [7:0]    weights_payload_0_0_0_3,
  input      [7:0]    weights_payload_0_0_1_0,
  input      [7:0]    weights_payload_0_0_1_1,
  input      [7:0]    weights_payload_0_0_1_2,
  input      [7:0]    weights_payload_0_0_1_3,
  input      [7:0]    weights_payload_0_0_2_0,
  input      [7:0]    weights_payload_0_0_2_1,
  input      [7:0]    weights_payload_0_0_2_2,
  input      [7:0]    weights_payload_0_0_2_3,
  input      [7:0]    weights_payload_0_1_0_0,
  input      [7:0]    weights_payload_0_1_0_1,
  input      [7:0]    weights_payload_0_1_0_2,
  input      [7:0]    weights_payload_0_1_0_3,
  input      [7:0]    weights_payload_0_1_1_0,
  input      [7:0]    weights_payload_0_1_1_1,
  input      [7:0]    weights_payload_0_1_1_2,
  input      [7:0]    weights_payload_0_1_1_3,
  input      [7:0]    weights_payload_0_1_2_0,
  input      [7:0]    weights_payload_0_1_2_1,
  input      [7:0]    weights_payload_0_1_2_2,
  input      [7:0]    weights_payload_0_1_2_3,
  input      [7:0]    weights_payload_0_2_0_0,
  input      [7:0]    weights_payload_0_2_0_1,
  input      [7:0]    weights_payload_0_2_0_2,
  input      [7:0]    weights_payload_0_2_0_3,
  input      [7:0]    weights_payload_0_2_1_0,
  input      [7:0]    weights_payload_0_2_1_1,
  input      [7:0]    weights_payload_0_2_1_2,
  input      [7:0]    weights_payload_0_2_1_3,
  input      [7:0]    weights_payload_0_2_2_0,
  input      [7:0]    weights_payload_0_2_2_1,
  input      [7:0]    weights_payload_0_2_2_2,
  input      [7:0]    weights_payload_0_2_2_3,
  input      [7:0]    weights_payload_1_0_0_0,
  input      [7:0]    weights_payload_1_0_0_1,
  input      [7:0]    weights_payload_1_0_0_2,
  input      [7:0]    weights_payload_1_0_0_3,
  input      [7:0]    weights_payload_1_0_1_0,
  input      [7:0]    weights_payload_1_0_1_1,
  input      [7:0]    weights_payload_1_0_1_2,
  input      [7:0]    weights_payload_1_0_1_3,
  input      [7:0]    weights_payload_1_0_2_0,
  input      [7:0]    weights_payload_1_0_2_1,
  input      [7:0]    weights_payload_1_0_2_2,
  input      [7:0]    weights_payload_1_0_2_3,
  input      [7:0]    weights_payload_1_1_0_0,
  input      [7:0]    weights_payload_1_1_0_1,
  input      [7:0]    weights_payload_1_1_0_2,
  input      [7:0]    weights_payload_1_1_0_3,
  input      [7:0]    weights_payload_1_1_1_0,
  input      [7:0]    weights_payload_1_1_1_1,
  input      [7:0]    weights_payload_1_1_1_2,
  input      [7:0]    weights_payload_1_1_1_3,
  input      [7:0]    weights_payload_1_1_2_0,
  input      [7:0]    weights_payload_1_1_2_1,
  input      [7:0]    weights_payload_1_1_2_2,
  input      [7:0]    weights_payload_1_1_2_3,
  input      [7:0]    weights_payload_1_2_0_0,
  input      [7:0]    weights_payload_1_2_0_1,
  input      [7:0]    weights_payload_1_2_0_2,
  input      [7:0]    weights_payload_1_2_0_3,
  input      [7:0]    weights_payload_1_2_1_0,
  input      [7:0]    weights_payload_1_2_1_1,
  input      [7:0]    weights_payload_1_2_1_2,
  input      [7:0]    weights_payload_1_2_1_3,
  input      [7:0]    weights_payload_1_2_2_0,
  input      [7:0]    weights_payload_1_2_2_1,
  input      [7:0]    weights_payload_1_2_2_2,
  input      [7:0]    weights_payload_1_2_2_3,
  output              outputs_valid,
  input               outputs_ready,
  output     [23:0]   outputs_payload_frame_line_pixel_0,
  output     [23:0]   outputs_payload_frame_line_pixel_1,
  output              outputs_payload_frame_line_endOfLine,
  output              outputs_payload_frame_endOfFrame,
  output              outputs_payload_endOfPack,
  input               clk,
  input               reset
);

  wire                eventM2sPipes_3_eventIn_ready;
  wire                eventM2sPipes_3_eventOut_valid;
  wire                eventM2sPipes_3_CEs_0;
  wire                eventM2sPipes_3_CEs_1;
  wire                eventM2sPipes_3_CEs_2;
  wire                eventM2sPipes_3_CEs_3;
  wire                eventM2sPipes_3_CEs_4;
  wire                eventM2sPipes_3_CEs_5;
  wire                eventM2sPipes_3_CEs_6;
  wire                eventM2sPipes_3_CEs_7;
  wire       [15:0]   sIMD2INT8_72_ab;
  wire       [15:0]   sIMD2INT8_72_ac;
  wire       [15:0]   sIMD2INT8_73_ab;
  wire       [15:0]   sIMD2INT8_73_ac;
  wire       [15:0]   sIMD2INT8_74_ab;
  wire       [15:0]   sIMD2INT8_74_ac;
  wire       [15:0]   sIMD2INT8_75_ab;
  wire       [15:0]   sIMD2INT8_75_ac;
  wire       [15:0]   sIMD2INT8_76_ab;
  wire       [15:0]   sIMD2INT8_76_ac;
  wire       [15:0]   sIMD2INT8_77_ab;
  wire       [15:0]   sIMD2INT8_77_ac;
  wire       [15:0]   sIMD2INT8_78_ab;
  wire       [15:0]   sIMD2INT8_78_ac;
  wire       [15:0]   sIMD2INT8_79_ab;
  wire       [15:0]   sIMD2INT8_79_ac;
  wire       [15:0]   sIMD2INT8_80_ab;
  wire       [15:0]   sIMD2INT8_80_ac;
  wire       [15:0]   sIMD2INT8_81_ab;
  wire       [15:0]   sIMD2INT8_81_ac;
  wire       [15:0]   sIMD2INT8_82_ab;
  wire       [15:0]   sIMD2INT8_82_ac;
  wire       [15:0]   sIMD2INT8_83_ab;
  wire       [15:0]   sIMD2INT8_83_ac;
  wire       [15:0]   sIMD2INT8_84_ab;
  wire       [15:0]   sIMD2INT8_84_ac;
  wire       [15:0]   sIMD2INT8_85_ab;
  wire       [15:0]   sIMD2INT8_85_ac;
  wire       [15:0]   sIMD2INT8_86_ab;
  wire       [15:0]   sIMD2INT8_86_ac;
  wire       [15:0]   sIMD2INT8_87_ab;
  wire       [15:0]   sIMD2INT8_87_ac;
  wire       [15:0]   sIMD2INT8_88_ab;
  wire       [15:0]   sIMD2INT8_88_ac;
  wire       [15:0]   sIMD2INT8_89_ab;
  wire       [15:0]   sIMD2INT8_89_ac;
  wire       [15:0]   sIMD2INT8_90_ab;
  wire       [15:0]   sIMD2INT8_90_ac;
  wire       [15:0]   sIMD2INT8_91_ab;
  wire       [15:0]   sIMD2INT8_91_ac;
  wire       [15:0]   sIMD2INT8_92_ab;
  wire       [15:0]   sIMD2INT8_92_ac;
  wire       [15:0]   sIMD2INT8_93_ab;
  wire       [15:0]   sIMD2INT8_93_ac;
  wire       [15:0]   sIMD2INT8_94_ab;
  wire       [15:0]   sIMD2INT8_94_ac;
  wire       [15:0]   sIMD2INT8_95_ab;
  wire       [15:0]   sIMD2INT8_95_ac;
  wire       [15:0]   sIMD2INT8_96_ab;
  wire       [15:0]   sIMD2INT8_96_ac;
  wire       [15:0]   sIMD2INT8_97_ab;
  wire       [15:0]   sIMD2INT8_97_ac;
  wire       [15:0]   sIMD2INT8_98_ab;
  wire       [15:0]   sIMD2INT8_98_ac;
  wire       [15:0]   sIMD2INT8_99_ab;
  wire       [15:0]   sIMD2INT8_99_ac;
  wire       [15:0]   sIMD2INT8_100_ab;
  wire       [15:0]   sIMD2INT8_100_ac;
  wire       [15:0]   sIMD2INT8_101_ab;
  wire       [15:0]   sIMD2INT8_101_ac;
  wire       [15:0]   sIMD2INT8_102_ab;
  wire       [15:0]   sIMD2INT8_102_ac;
  wire       [15:0]   sIMD2INT8_103_ab;
  wire       [15:0]   sIMD2INT8_103_ac;
  wire       [15:0]   sIMD2INT8_104_ab;
  wire       [15:0]   sIMD2INT8_104_ac;
  wire       [15:0]   sIMD2INT8_105_ab;
  wire       [15:0]   sIMD2INT8_105_ac;
  wire       [15:0]   sIMD2INT8_106_ab;
  wire       [15:0]   sIMD2INT8_106_ac;
  wire       [15:0]   sIMD2INT8_107_ab;
  wire       [15:0]   sIMD2INT8_107_ac;
  wire                acc_videoIn_ready;
  wire                acc_videoOut_valid;
  wire       [23:0]   acc_videoOut_payload_frame_line_pixel_0;
  wire       [23:0]   acc_videoOut_payload_frame_line_pixel_1;
  wire                acc_videoOut_payload_frame_line_endOfLine;
  wire                acc_videoOut_payload_frame_endOfFrame;
  wire                acc_videoOut_payload_endOfPack;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_1;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_2;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_3;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_4;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_5;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_6;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_7;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_8;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_9;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_10;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_11;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_12;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_13;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_14;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_15;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_16;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_18;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_0_18_1;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_1;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_2;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_3;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_4;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_5;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_6;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_7;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_8;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_9;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_10;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_11;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_12;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_13;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_14;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_15;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_16;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_18;
  wire       [15:0]   tmp_tmp_postConv_payload_frame_line_pixel_1_18_1;
  wire                tmp_inputs_ready;
  wire                inputsT_valid;
  wire                inputsT_ready;
  wire       [7:0]    inputsT_payload_frame_line_pixel_0_0_0;
  wire       [7:0]    inputsT_payload_frame_line_pixel_0_0_1;
  wire       [7:0]    inputsT_payload_frame_line_pixel_0_0_2;
  wire       [7:0]    inputsT_payload_frame_line_pixel_0_0_3;
  wire       [7:0]    inputsT_payload_frame_line_pixel_0_1_0;
  wire       [7:0]    inputsT_payload_frame_line_pixel_0_1_1;
  wire       [7:0]    inputsT_payload_frame_line_pixel_0_1_2;
  wire       [7:0]    inputsT_payload_frame_line_pixel_0_1_3;
  wire       [7:0]    inputsT_payload_frame_line_pixel_0_2_0;
  wire       [7:0]    inputsT_payload_frame_line_pixel_0_2_1;
  wire       [7:0]    inputsT_payload_frame_line_pixel_0_2_2;
  wire       [7:0]    inputsT_payload_frame_line_pixel_0_2_3;
  wire       [7:0]    inputsT_payload_frame_line_pixel_1_0_0;
  wire       [7:0]    inputsT_payload_frame_line_pixel_1_0_1;
  wire       [7:0]    inputsT_payload_frame_line_pixel_1_0_2;
  wire       [7:0]    inputsT_payload_frame_line_pixel_1_0_3;
  wire       [7:0]    inputsT_payload_frame_line_pixel_1_1_0;
  wire       [7:0]    inputsT_payload_frame_line_pixel_1_1_1;
  wire       [7:0]    inputsT_payload_frame_line_pixel_1_1_2;
  wire       [7:0]    inputsT_payload_frame_line_pixel_1_1_3;
  wire       [7:0]    inputsT_payload_frame_line_pixel_1_2_0;
  wire       [7:0]    inputsT_payload_frame_line_pixel_1_2_1;
  wire       [7:0]    inputsT_payload_frame_line_pixel_1_2_2;
  wire       [7:0]    inputsT_payload_frame_line_pixel_1_2_3;
  wire       [7:0]    inputsT_payload_frame_line_pixel_2_0_0;
  wire       [7:0]    inputsT_payload_frame_line_pixel_2_0_1;
  wire       [7:0]    inputsT_payload_frame_line_pixel_2_0_2;
  wire       [7:0]    inputsT_payload_frame_line_pixel_2_0_3;
  wire       [7:0]    inputsT_payload_frame_line_pixel_2_1_0;
  wire       [7:0]    inputsT_payload_frame_line_pixel_2_1_1;
  wire       [7:0]    inputsT_payload_frame_line_pixel_2_1_2;
  wire       [7:0]    inputsT_payload_frame_line_pixel_2_1_3;
  wire       [7:0]    inputsT_payload_frame_line_pixel_2_2_0;
  wire       [7:0]    inputsT_payload_frame_line_pixel_2_2_1;
  wire       [7:0]    inputsT_payload_frame_line_pixel_2_2_2;
  wire       [7:0]    inputsT_payload_frame_line_pixel_2_2_3;
  wire                inputsT_payload_frame_line_endOfLine;
  wire                inputsT_payload_frame_endOfFrame;
  wire                inputsT_payload_endOfPack;
  wire                prevConv_valid;
  wire                prevConv_ready;
  wire       [7:0]    prevConv_payload_frame_line_pixel_0_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_0_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_0_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_1_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_1_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_1_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_2_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_2_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_2_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_3_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_3_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_3_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_4_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_4_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_4_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_5_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_5_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_5_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_6_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_6_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_6_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_7_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_7_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_7_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_8_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_8_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_8_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_9_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_9_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_9_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_10_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_10_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_10_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_11_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_11_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_11_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_12_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_12_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_12_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_13_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_13_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_13_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_14_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_14_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_14_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_15_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_15_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_15_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_16_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_16_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_16_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_17_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_17_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_17_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_18_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_18_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_18_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_19_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_19_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_19_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_20_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_20_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_20_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_21_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_21_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_21_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_22_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_22_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_22_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_23_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_23_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_23_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_24_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_24_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_24_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_25_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_25_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_25_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_26_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_26_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_26_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_27_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_27_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_27_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_28_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_28_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_28_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_29_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_29_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_29_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_30_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_30_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_30_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_31_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_31_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_31_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_32_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_32_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_32_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_33_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_33_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_33_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_34_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_34_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_34_2;
  wire       [7:0]    prevConv_payload_frame_line_pixel_35_0;
  wire       [7:0]    prevConv_payload_frame_line_pixel_35_1;
  wire       [7:0]    prevConv_payload_frame_line_pixel_35_2;
  wire                prevConv_payload_frame_line_endOfLine;
  wire                prevConv_payload_frame_endOfFrame;
  wire                prevConv_payload_endOfPack;
  wire                postConv_valid;
  wire                postConv_ready;
  wire       [15:0]   postConv_payload_frame_line_pixel_0;
  wire       [15:0]   postConv_payload_frame_line_pixel_1;
  wire                postConv_payload_frame_line_endOfLine;
  wire                postConv_payload_frame_endOfFrame;
  wire                postConv_payload_endOfPack;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_1;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_2;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_3;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_4;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_5;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_6;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_7;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_8;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_9;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_10;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_11;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_12;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_13;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_14;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_15;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_16;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_17;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_0_18;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_1;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_2;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_3;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_4;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_5;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_6;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_7;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_8;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_9;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_10;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_11;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_12;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_13;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_14;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_15;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_16;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_17;
  reg        [15:0]   tmp_postConv_payload_frame_line_pixel_1_18;
  reg                 tmp_postConv_payload_frame_line_endOfLine;
  reg                 tmp_postConv_payload_frame_endOfFrame;
  reg                 tmp_postConv_payload_endOfPack;
  reg                 tmp_postConv_payload_frame_line_endOfLine_1;
  reg                 tmp_postConv_payload_frame_endOfFrame_1;
  reg                 tmp_postConv_payload_endOfPack_1;
  reg                 tmp_postConv_payload_frame_line_endOfLine_2;
  reg                 tmp_postConv_payload_frame_endOfFrame_2;
  reg                 tmp_postConv_payload_endOfPack_2;
  reg                 tmp_postConv_payload_frame_line_endOfLine_3;
  reg                 tmp_postConv_payload_frame_endOfFrame_3;
  reg                 tmp_postConv_payload_endOfPack_3;
  reg                 tmp_postConv_payload_frame_line_endOfLine_4;
  reg                 tmp_postConv_payload_frame_endOfFrame_4;
  reg                 tmp_postConv_payload_endOfPack_4;
  reg                 tmp_postConv_payload_frame_line_endOfLine_5;
  reg                 tmp_postConv_payload_frame_endOfFrame_5;
  reg                 tmp_postConv_payload_endOfPack_5;
  reg                 tmp_postConv_payload_frame_line_endOfLine_6;
  reg                 tmp_postConv_payload_frame_endOfFrame_6;
  reg                 tmp_postConv_payload_endOfPack_6;
  reg                 tmp_postConv_payload_frame_line_endOfLine_7;
  reg                 tmp_postConv_payload_frame_endOfFrame_7;
  reg                 tmp_postConv_payload_endOfPack_7;
  wire                inputsT_fire;
  wire                postConv_s2mPipe_valid;
  wire                postConv_s2mPipe_ready;
  wire       [15:0]   postConv_s2mPipe_payload_frame_line_pixel_0;
  wire       [15:0]   postConv_s2mPipe_payload_frame_line_pixel_1;
  wire                postConv_s2mPipe_payload_frame_line_endOfLine;
  wire                postConv_s2mPipe_payload_frame_endOfFrame;
  wire                postConv_s2mPipe_payload_endOfPack;
  reg                 postConv_rValid;
  reg        [15:0]   postConv_rData_frame_line_pixel_0;
  reg        [15:0]   postConv_rData_frame_line_pixel_1;
  reg                 postConv_rData_frame_line_endOfLine;
  reg                 postConv_rData_frame_endOfFrame;
  reg                 postConv_rData_endOfPack;

  assign tmp_tmp_postConv_payload_frame_line_pixel_0 = ($signed(sIMD2INT8_72_ab) + $signed(sIMD2INT8_73_ab));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_1 = ($signed(sIMD2INT8_75_ab) + $signed(sIMD2INT8_76_ab));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_2 = ($signed(sIMD2INT8_78_ab) + $signed(sIMD2INT8_79_ab));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_3 = ($signed(sIMD2INT8_81_ab) + $signed(sIMD2INT8_82_ab));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_4 = ($signed(sIMD2INT8_84_ab) + $signed(sIMD2INT8_85_ab));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_5 = ($signed(sIMD2INT8_87_ab) + $signed(sIMD2INT8_88_ab));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_6 = ($signed(sIMD2INT8_90_ab) + $signed(sIMD2INT8_91_ab));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_7 = ($signed(sIMD2INT8_93_ab) + $signed(sIMD2INT8_94_ab));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_8 = ($signed(sIMD2INT8_96_ab) + $signed(sIMD2INT8_97_ab));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_9 = ($signed(sIMD2INT8_99_ab) + $signed(sIMD2INT8_100_ab));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_10 = ($signed(sIMD2INT8_102_ab) + $signed(sIMD2INT8_103_ab));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_11 = ($signed(sIMD2INT8_105_ab) + $signed(sIMD2INT8_106_ab));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_12 = ($signed(tmp_postConv_payload_frame_line_pixel_0) + $signed(tmp_postConv_payload_frame_line_pixel_0_1));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_13 = ($signed(tmp_postConv_payload_frame_line_pixel_0_3) + $signed(tmp_postConv_payload_frame_line_pixel_0_4));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_14 = ($signed(tmp_postConv_payload_frame_line_pixel_0_6) + $signed(tmp_postConv_payload_frame_line_pixel_0_7));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_15 = ($signed(tmp_postConv_payload_frame_line_pixel_0_9) + $signed(tmp_postConv_payload_frame_line_pixel_0_10));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_16 = ($signed(tmp_postConv_payload_frame_line_pixel_0_12) + $signed(tmp_postConv_payload_frame_line_pixel_0_13));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_18 = ($signed(tmp_postConv_payload_frame_line_pixel_0_16) + $signed(tmp_postConv_payload_frame_line_pixel_0_17));
  assign tmp_tmp_postConv_payload_frame_line_pixel_0_18_1 = 16'h0;
  assign tmp_tmp_postConv_payload_frame_line_pixel_1 = ($signed(sIMD2INT8_72_ac) + $signed(sIMD2INT8_73_ac));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_1 = ($signed(sIMD2INT8_75_ac) + $signed(sIMD2INT8_76_ac));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_2 = ($signed(sIMD2INT8_78_ac) + $signed(sIMD2INT8_79_ac));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_3 = ($signed(sIMD2INT8_81_ac) + $signed(sIMD2INT8_82_ac));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_4 = ($signed(sIMD2INT8_84_ac) + $signed(sIMD2INT8_85_ac));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_5 = ($signed(sIMD2INT8_87_ac) + $signed(sIMD2INT8_88_ac));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_6 = ($signed(sIMD2INT8_90_ac) + $signed(sIMD2INT8_91_ac));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_7 = ($signed(sIMD2INT8_93_ac) + $signed(sIMD2INT8_94_ac));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_8 = ($signed(sIMD2INT8_96_ac) + $signed(sIMD2INT8_97_ac));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_9 = ($signed(sIMD2INT8_99_ac) + $signed(sIMD2INT8_100_ac));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_10 = ($signed(sIMD2INT8_102_ac) + $signed(sIMD2INT8_103_ac));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_11 = ($signed(sIMD2INT8_105_ac) + $signed(sIMD2INT8_106_ac));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_12 = ($signed(tmp_postConv_payload_frame_line_pixel_1) + $signed(tmp_postConv_payload_frame_line_pixel_1_1));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_13 = ($signed(tmp_postConv_payload_frame_line_pixel_1_3) + $signed(tmp_postConv_payload_frame_line_pixel_1_4));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_14 = ($signed(tmp_postConv_payload_frame_line_pixel_1_6) + $signed(tmp_postConv_payload_frame_line_pixel_1_7));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_15 = ($signed(tmp_postConv_payload_frame_line_pixel_1_9) + $signed(tmp_postConv_payload_frame_line_pixel_1_10));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_16 = ($signed(tmp_postConv_payload_frame_line_pixel_1_12) + $signed(tmp_postConv_payload_frame_line_pixel_1_13));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_18 = ($signed(tmp_postConv_payload_frame_line_pixel_1_16) + $signed(tmp_postConv_payload_frame_line_pixel_1_17));
  assign tmp_tmp_postConv_payload_frame_line_pixel_1_18_1 = 16'h0;
  EventM2sPipes eventM2sPipes_3 (
    .eventIn_valid     (prevConv_valid                  ), //i
    .eventIn_ready     (eventM2sPipes_3_eventIn_ready   ), //o
    .eventOut_valid    (eventM2sPipes_3_eventOut_valid  ), //o
    .eventOut_ready    (postConv_ready                  ), //i
    .CEs_0             (eventM2sPipes_3_CEs_0           ), //o
    .CEs_1             (eventM2sPipes_3_CEs_1           ), //o
    .CEs_2             (eventM2sPipes_3_CEs_2           ), //o
    .CEs_3             (eventM2sPipes_3_CEs_3           ), //o
    .CEs_4             (eventM2sPipes_3_CEs_4           ), //o
    .CEs_5             (eventM2sPipes_3_CEs_5           ), //o
    .CEs_6             (eventM2sPipes_3_CEs_6           ), //o
    .CEs_7             (eventM2sPipes_3_CEs_7           ), //o
    .clk               (clk                             ), //i
    .reset             (reset                           )  //i
  );
  SIMD2INT8 sIMD2INT8_72 (
    .a        (prevConv_payload_frame_line_pixel_0_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_0_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_0_2[7:0]  ), //i
    .ab       (sIMD2INT8_72_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_72_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                       ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                       ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                       ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                       ), //i
    .clk      (clk                                         )  //i
  );
  SIMD2INT8 sIMD2INT8_73 (
    .a        (prevConv_payload_frame_line_pixel_1_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_1_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_1_2[7:0]  ), //i
    .ab       (sIMD2INT8_73_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_73_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                       ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                       ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                       ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                       ), //i
    .clk      (clk                                         )  //i
  );
  SIMD2INT8 sIMD2INT8_74 (
    .a        (prevConv_payload_frame_line_pixel_2_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_2_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_2_2[7:0]  ), //i
    .ab       (sIMD2INT8_74_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_74_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                       ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                       ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                       ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                       ), //i
    .clk      (clk                                         )  //i
  );
  SIMD2INT8 sIMD2INT8_75 (
    .a        (prevConv_payload_frame_line_pixel_3_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_3_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_3_2[7:0]  ), //i
    .ab       (sIMD2INT8_75_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_75_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                       ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                       ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                       ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                       ), //i
    .clk      (clk                                         )  //i
  );
  SIMD2INT8 sIMD2INT8_76 (
    .a        (prevConv_payload_frame_line_pixel_4_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_4_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_4_2[7:0]  ), //i
    .ab       (sIMD2INT8_76_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_76_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                       ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                       ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                       ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                       ), //i
    .clk      (clk                                         )  //i
  );
  SIMD2INT8 sIMD2INT8_77 (
    .a        (prevConv_payload_frame_line_pixel_5_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_5_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_5_2[7:0]  ), //i
    .ab       (sIMD2INT8_77_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_77_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                       ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                       ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                       ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                       ), //i
    .clk      (clk                                         )  //i
  );
  SIMD2INT8 sIMD2INT8_78 (
    .a        (prevConv_payload_frame_line_pixel_6_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_6_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_6_2[7:0]  ), //i
    .ab       (sIMD2INT8_78_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_78_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                       ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                       ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                       ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                       ), //i
    .clk      (clk                                         )  //i
  );
  SIMD2INT8 sIMD2INT8_79 (
    .a        (prevConv_payload_frame_line_pixel_7_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_7_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_7_2[7:0]  ), //i
    .ab       (sIMD2INT8_79_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_79_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                       ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                       ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                       ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                       ), //i
    .clk      (clk                                         )  //i
  );
  SIMD2INT8 sIMD2INT8_80 (
    .a        (prevConv_payload_frame_line_pixel_8_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_8_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_8_2[7:0]  ), //i
    .ab       (sIMD2INT8_80_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_80_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                       ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                       ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                       ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                       ), //i
    .clk      (clk                                         )  //i
  );
  SIMD2INT8 sIMD2INT8_81 (
    .a        (prevConv_payload_frame_line_pixel_9_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_9_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_9_2[7:0]  ), //i
    .ab       (sIMD2INT8_81_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_81_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                       ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                       ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                       ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                       ), //i
    .clk      (clk                                         )  //i
  );
  SIMD2INT8 sIMD2INT8_82 (
    .a        (prevConv_payload_frame_line_pixel_10_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_10_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_10_2[7:0]  ), //i
    .ab       (sIMD2INT8_82_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_82_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_83 (
    .a        (prevConv_payload_frame_line_pixel_11_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_11_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_11_2[7:0]  ), //i
    .ab       (sIMD2INT8_83_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_83_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_84 (
    .a        (prevConv_payload_frame_line_pixel_12_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_12_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_12_2[7:0]  ), //i
    .ab       (sIMD2INT8_84_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_84_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_85 (
    .a        (prevConv_payload_frame_line_pixel_13_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_13_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_13_2[7:0]  ), //i
    .ab       (sIMD2INT8_85_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_85_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_86 (
    .a        (prevConv_payload_frame_line_pixel_14_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_14_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_14_2[7:0]  ), //i
    .ab       (sIMD2INT8_86_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_86_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_87 (
    .a        (prevConv_payload_frame_line_pixel_15_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_15_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_15_2[7:0]  ), //i
    .ab       (sIMD2INT8_87_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_87_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_88 (
    .a        (prevConv_payload_frame_line_pixel_16_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_16_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_16_2[7:0]  ), //i
    .ab       (sIMD2INT8_88_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_88_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_89 (
    .a        (prevConv_payload_frame_line_pixel_17_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_17_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_17_2[7:0]  ), //i
    .ab       (sIMD2INT8_89_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_89_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_90 (
    .a        (prevConv_payload_frame_line_pixel_18_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_18_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_18_2[7:0]  ), //i
    .ab       (sIMD2INT8_90_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_90_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_91 (
    .a        (prevConv_payload_frame_line_pixel_19_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_19_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_19_2[7:0]  ), //i
    .ab       (sIMD2INT8_91_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_91_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_92 (
    .a        (prevConv_payload_frame_line_pixel_20_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_20_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_20_2[7:0]  ), //i
    .ab       (sIMD2INT8_92_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_92_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_93 (
    .a        (prevConv_payload_frame_line_pixel_21_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_21_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_21_2[7:0]  ), //i
    .ab       (sIMD2INT8_93_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_93_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_94 (
    .a        (prevConv_payload_frame_line_pixel_22_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_22_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_22_2[7:0]  ), //i
    .ab       (sIMD2INT8_94_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_94_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_95 (
    .a        (prevConv_payload_frame_line_pixel_23_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_23_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_23_2[7:0]  ), //i
    .ab       (sIMD2INT8_95_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_95_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_96 (
    .a        (prevConv_payload_frame_line_pixel_24_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_24_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_24_2[7:0]  ), //i
    .ab       (sIMD2INT8_96_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_96_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_97 (
    .a        (prevConv_payload_frame_line_pixel_25_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_25_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_25_2[7:0]  ), //i
    .ab       (sIMD2INT8_97_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_97_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_98 (
    .a        (prevConv_payload_frame_line_pixel_26_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_26_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_26_2[7:0]  ), //i
    .ab       (sIMD2INT8_98_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_98_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_99 (
    .a        (prevConv_payload_frame_line_pixel_27_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_27_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_27_2[7:0]  ), //i
    .ab       (sIMD2INT8_99_ab[15:0]                        ), //o
    .ac       (sIMD2INT8_99_ac[15:0]                        ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_100 (
    .a        (prevConv_payload_frame_line_pixel_28_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_28_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_28_2[7:0]  ), //i
    .ab       (sIMD2INT8_100_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_100_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_101 (
    .a        (prevConv_payload_frame_line_pixel_29_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_29_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_29_2[7:0]  ), //i
    .ab       (sIMD2INT8_101_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_101_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_102 (
    .a        (prevConv_payload_frame_line_pixel_30_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_30_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_30_2[7:0]  ), //i
    .ab       (sIMD2INT8_102_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_102_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_103 (
    .a        (prevConv_payload_frame_line_pixel_31_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_31_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_31_2[7:0]  ), //i
    .ab       (sIMD2INT8_103_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_103_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_104 (
    .a        (prevConv_payload_frame_line_pixel_32_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_32_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_32_2[7:0]  ), //i
    .ab       (sIMD2INT8_104_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_104_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_105 (
    .a        (prevConv_payload_frame_line_pixel_33_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_33_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_33_2[7:0]  ), //i
    .ab       (sIMD2INT8_105_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_105_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_106 (
    .a        (prevConv_payload_frame_line_pixel_34_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_34_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_34_2[7:0]  ), //i
    .ab       (sIMD2INT8_106_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_106_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  SIMD2INT8 sIMD2INT8_107 (
    .a        (prevConv_payload_frame_line_pixel_35_0[7:0]  ), //i
    .b        (prevConv_payload_frame_line_pixel_35_1[7:0]  ), //i
    .c        (prevConv_payload_frame_line_pixel_35_2[7:0]  ), //i
    .ab       (sIMD2INT8_107_ab[15:0]                       ), //o
    .ac       (sIMD2INT8_107_ac[15:0]                       ), //o
    .CEs_0    (eventM2sPipes_3_CEs_0                        ), //i
    .CEs_1    (eventM2sPipes_3_CEs_1                        ), //i
    .CEs_2    (eventM2sPipes_3_CEs_2                        ), //i
    .CEs_3    (eventM2sPipes_3_CEs_3                        ), //i
    .clk      (clk                                          )  //i
  );
  VideoFrameHistory acc (
    .numberOfInputFrames                      (numberOfInputFrames[7:0]                           ), //i
    .numberOfOutputFrames                     (numberOfOutputFrames[7:0]                          ), //i
    .videoIn_valid                            (postConv_s2mPipe_valid                             ), //i
    .videoIn_ready                            (acc_videoIn_ready                                  ), //o
    .videoIn_payload_frame_line_pixel_0       (postConv_s2mPipe_payload_frame_line_pixel_0[15:0]  ), //i
    .videoIn_payload_frame_line_pixel_1       (postConv_s2mPipe_payload_frame_line_pixel_1[15:0]  ), //i
    .videoIn_payload_frame_line_endOfLine     (postConv_s2mPipe_payload_frame_line_endOfLine      ), //i
    .videoIn_payload_frame_endOfFrame         (postConv_s2mPipe_payload_frame_endOfFrame          ), //i
    .videoIn_payload_endOfPack                (postConv_s2mPipe_payload_endOfPack                 ), //i
    .videoOut_valid                           (acc_videoOut_valid                                 ), //o
    .videoOut_ready                           (outputs_ready                                      ), //i
    .videoOut_payload_frame_line_pixel_0      (acc_videoOut_payload_frame_line_pixel_0[23:0]      ), //o
    .videoOut_payload_frame_line_pixel_1      (acc_videoOut_payload_frame_line_pixel_1[23:0]      ), //o
    .videoOut_payload_frame_line_endOfLine    (acc_videoOut_payload_frame_line_endOfLine          ), //o
    .videoOut_payload_frame_endOfFrame        (acc_videoOut_payload_frame_endOfFrame              ), //o
    .videoOut_payload_endOfPack               (acc_videoOut_payload_endOfPack                     ), //o
    .clk                                      (clk                                                ), //i
    .reset                                    (reset                                              )  //i
  );
  assign tmp_inputs_ready = (! (! weights_valid));
  assign inputsT_valid = (inputs_valid && tmp_inputs_ready);
  assign inputs_ready = (inputsT_ready && tmp_inputs_ready);
  assign inputsT_payload_frame_line_pixel_0_0_0 = inputs_payload_frame_line_pixel_0_0_0;
  assign inputsT_payload_frame_line_pixel_0_0_1 = inputs_payload_frame_line_pixel_0_0_1;
  assign inputsT_payload_frame_line_pixel_0_0_2 = inputs_payload_frame_line_pixel_0_0_2;
  assign inputsT_payload_frame_line_pixel_0_0_3 = inputs_payload_frame_line_pixel_0_0_3;
  assign inputsT_payload_frame_line_pixel_0_1_0 = inputs_payload_frame_line_pixel_0_1_0;
  assign inputsT_payload_frame_line_pixel_0_1_1 = inputs_payload_frame_line_pixel_0_1_1;
  assign inputsT_payload_frame_line_pixel_0_1_2 = inputs_payload_frame_line_pixel_0_1_2;
  assign inputsT_payload_frame_line_pixel_0_1_3 = inputs_payload_frame_line_pixel_0_1_3;
  assign inputsT_payload_frame_line_pixel_0_2_0 = inputs_payload_frame_line_pixel_0_2_0;
  assign inputsT_payload_frame_line_pixel_0_2_1 = inputs_payload_frame_line_pixel_0_2_1;
  assign inputsT_payload_frame_line_pixel_0_2_2 = inputs_payload_frame_line_pixel_0_2_2;
  assign inputsT_payload_frame_line_pixel_0_2_3 = inputs_payload_frame_line_pixel_0_2_3;
  assign inputsT_payload_frame_line_pixel_1_0_0 = inputs_payload_frame_line_pixel_1_0_0;
  assign inputsT_payload_frame_line_pixel_1_0_1 = inputs_payload_frame_line_pixel_1_0_1;
  assign inputsT_payload_frame_line_pixel_1_0_2 = inputs_payload_frame_line_pixel_1_0_2;
  assign inputsT_payload_frame_line_pixel_1_0_3 = inputs_payload_frame_line_pixel_1_0_3;
  assign inputsT_payload_frame_line_pixel_1_1_0 = inputs_payload_frame_line_pixel_1_1_0;
  assign inputsT_payload_frame_line_pixel_1_1_1 = inputs_payload_frame_line_pixel_1_1_1;
  assign inputsT_payload_frame_line_pixel_1_1_2 = inputs_payload_frame_line_pixel_1_1_2;
  assign inputsT_payload_frame_line_pixel_1_1_3 = inputs_payload_frame_line_pixel_1_1_3;
  assign inputsT_payload_frame_line_pixel_1_2_0 = inputs_payload_frame_line_pixel_1_2_0;
  assign inputsT_payload_frame_line_pixel_1_2_1 = inputs_payload_frame_line_pixel_1_2_1;
  assign inputsT_payload_frame_line_pixel_1_2_2 = inputs_payload_frame_line_pixel_1_2_2;
  assign inputsT_payload_frame_line_pixel_1_2_3 = inputs_payload_frame_line_pixel_1_2_3;
  assign inputsT_payload_frame_line_pixel_2_0_0 = inputs_payload_frame_line_pixel_2_0_0;
  assign inputsT_payload_frame_line_pixel_2_0_1 = inputs_payload_frame_line_pixel_2_0_1;
  assign inputsT_payload_frame_line_pixel_2_0_2 = inputs_payload_frame_line_pixel_2_0_2;
  assign inputsT_payload_frame_line_pixel_2_0_3 = inputs_payload_frame_line_pixel_2_0_3;
  assign inputsT_payload_frame_line_pixel_2_1_0 = inputs_payload_frame_line_pixel_2_1_0;
  assign inputsT_payload_frame_line_pixel_2_1_1 = inputs_payload_frame_line_pixel_2_1_1;
  assign inputsT_payload_frame_line_pixel_2_1_2 = inputs_payload_frame_line_pixel_2_1_2;
  assign inputsT_payload_frame_line_pixel_2_1_3 = inputs_payload_frame_line_pixel_2_1_3;
  assign inputsT_payload_frame_line_pixel_2_2_0 = inputs_payload_frame_line_pixel_2_2_0;
  assign inputsT_payload_frame_line_pixel_2_2_1 = inputs_payload_frame_line_pixel_2_2_1;
  assign inputsT_payload_frame_line_pixel_2_2_2 = inputs_payload_frame_line_pixel_2_2_2;
  assign inputsT_payload_frame_line_pixel_2_2_3 = inputs_payload_frame_line_pixel_2_2_3;
  assign inputsT_payload_frame_line_endOfLine = inputs_payload_frame_line_endOfLine;
  assign inputsT_payload_frame_endOfFrame = inputs_payload_frame_endOfFrame;
  assign inputsT_payload_endOfPack = inputs_payload_endOfPack;
  assign prevConv_valid = inputsT_valid;
  assign inputsT_ready = prevConv_ready;
  assign prevConv_payload_frame_line_pixel_0_0 = inputsT_payload_frame_line_pixel_0_0_0;
  assign prevConv_payload_frame_line_pixel_0_1 = weights_payload_0_0_0_0;
  assign prevConv_payload_frame_line_pixel_0_2 = weights_payload_1_0_0_0;
  assign prevConv_payload_frame_line_pixel_1_0 = inputsT_payload_frame_line_pixel_0_0_1;
  assign prevConv_payload_frame_line_pixel_1_1 = weights_payload_0_0_0_1;
  assign prevConv_payload_frame_line_pixel_1_2 = weights_payload_1_0_0_1;
  assign prevConv_payload_frame_line_pixel_2_0 = inputsT_payload_frame_line_pixel_0_0_2;
  assign prevConv_payload_frame_line_pixel_2_1 = weights_payload_0_0_0_2;
  assign prevConv_payload_frame_line_pixel_2_2 = weights_payload_1_0_0_2;
  assign prevConv_payload_frame_line_pixel_3_0 = inputsT_payload_frame_line_pixel_0_0_3;
  assign prevConv_payload_frame_line_pixel_3_1 = weights_payload_0_0_0_3;
  assign prevConv_payload_frame_line_pixel_3_2 = weights_payload_1_0_0_3;
  assign prevConv_payload_frame_line_pixel_4_0 = inputsT_payload_frame_line_pixel_0_1_0;
  assign prevConv_payload_frame_line_pixel_4_1 = weights_payload_0_0_1_0;
  assign prevConv_payload_frame_line_pixel_4_2 = weights_payload_1_0_1_0;
  assign prevConv_payload_frame_line_pixel_5_0 = inputsT_payload_frame_line_pixel_0_1_1;
  assign prevConv_payload_frame_line_pixel_5_1 = weights_payload_0_0_1_1;
  assign prevConv_payload_frame_line_pixel_5_2 = weights_payload_1_0_1_1;
  assign prevConv_payload_frame_line_pixel_6_0 = inputsT_payload_frame_line_pixel_0_1_2;
  assign prevConv_payload_frame_line_pixel_6_1 = weights_payload_0_0_1_2;
  assign prevConv_payload_frame_line_pixel_6_2 = weights_payload_1_0_1_2;
  assign prevConv_payload_frame_line_pixel_7_0 = inputsT_payload_frame_line_pixel_0_1_3;
  assign prevConv_payload_frame_line_pixel_7_1 = weights_payload_0_0_1_3;
  assign prevConv_payload_frame_line_pixel_7_2 = weights_payload_1_0_1_3;
  assign prevConv_payload_frame_line_pixel_8_0 = inputsT_payload_frame_line_pixel_0_2_0;
  assign prevConv_payload_frame_line_pixel_8_1 = weights_payload_0_0_2_0;
  assign prevConv_payload_frame_line_pixel_8_2 = weights_payload_1_0_2_0;
  assign prevConv_payload_frame_line_pixel_9_0 = inputsT_payload_frame_line_pixel_0_2_1;
  assign prevConv_payload_frame_line_pixel_9_1 = weights_payload_0_0_2_1;
  assign prevConv_payload_frame_line_pixel_9_2 = weights_payload_1_0_2_1;
  assign prevConv_payload_frame_line_pixel_10_0 = inputsT_payload_frame_line_pixel_0_2_2;
  assign prevConv_payload_frame_line_pixel_10_1 = weights_payload_0_0_2_2;
  assign prevConv_payload_frame_line_pixel_10_2 = weights_payload_1_0_2_2;
  assign prevConv_payload_frame_line_pixel_11_0 = inputsT_payload_frame_line_pixel_0_2_3;
  assign prevConv_payload_frame_line_pixel_11_1 = weights_payload_0_0_2_3;
  assign prevConv_payload_frame_line_pixel_11_2 = weights_payload_1_0_2_3;
  assign prevConv_payload_frame_line_pixel_12_0 = inputsT_payload_frame_line_pixel_1_0_0;
  assign prevConv_payload_frame_line_pixel_12_1 = weights_payload_0_1_0_0;
  assign prevConv_payload_frame_line_pixel_12_2 = weights_payload_1_1_0_0;
  assign prevConv_payload_frame_line_pixel_13_0 = inputsT_payload_frame_line_pixel_1_0_1;
  assign prevConv_payload_frame_line_pixel_13_1 = weights_payload_0_1_0_1;
  assign prevConv_payload_frame_line_pixel_13_2 = weights_payload_1_1_0_1;
  assign prevConv_payload_frame_line_pixel_14_0 = inputsT_payload_frame_line_pixel_1_0_2;
  assign prevConv_payload_frame_line_pixel_14_1 = weights_payload_0_1_0_2;
  assign prevConv_payload_frame_line_pixel_14_2 = weights_payload_1_1_0_2;
  assign prevConv_payload_frame_line_pixel_15_0 = inputsT_payload_frame_line_pixel_1_0_3;
  assign prevConv_payload_frame_line_pixel_15_1 = weights_payload_0_1_0_3;
  assign prevConv_payload_frame_line_pixel_15_2 = weights_payload_1_1_0_3;
  assign prevConv_payload_frame_line_pixel_16_0 = inputsT_payload_frame_line_pixel_1_1_0;
  assign prevConv_payload_frame_line_pixel_16_1 = weights_payload_0_1_1_0;
  assign prevConv_payload_frame_line_pixel_16_2 = weights_payload_1_1_1_0;
  assign prevConv_payload_frame_line_pixel_17_0 = inputsT_payload_frame_line_pixel_1_1_1;
  assign prevConv_payload_frame_line_pixel_17_1 = weights_payload_0_1_1_1;
  assign prevConv_payload_frame_line_pixel_17_2 = weights_payload_1_1_1_1;
  assign prevConv_payload_frame_line_pixel_18_0 = inputsT_payload_frame_line_pixel_1_1_2;
  assign prevConv_payload_frame_line_pixel_18_1 = weights_payload_0_1_1_2;
  assign prevConv_payload_frame_line_pixel_18_2 = weights_payload_1_1_1_2;
  assign prevConv_payload_frame_line_pixel_19_0 = inputsT_payload_frame_line_pixel_1_1_3;
  assign prevConv_payload_frame_line_pixel_19_1 = weights_payload_0_1_1_3;
  assign prevConv_payload_frame_line_pixel_19_2 = weights_payload_1_1_1_3;
  assign prevConv_payload_frame_line_pixel_20_0 = inputsT_payload_frame_line_pixel_1_2_0;
  assign prevConv_payload_frame_line_pixel_20_1 = weights_payload_0_1_2_0;
  assign prevConv_payload_frame_line_pixel_20_2 = weights_payload_1_1_2_0;
  assign prevConv_payload_frame_line_pixel_21_0 = inputsT_payload_frame_line_pixel_1_2_1;
  assign prevConv_payload_frame_line_pixel_21_1 = weights_payload_0_1_2_1;
  assign prevConv_payload_frame_line_pixel_21_2 = weights_payload_1_1_2_1;
  assign prevConv_payload_frame_line_pixel_22_0 = inputsT_payload_frame_line_pixel_1_2_2;
  assign prevConv_payload_frame_line_pixel_22_1 = weights_payload_0_1_2_2;
  assign prevConv_payload_frame_line_pixel_22_2 = weights_payload_1_1_2_2;
  assign prevConv_payload_frame_line_pixel_23_0 = inputsT_payload_frame_line_pixel_1_2_3;
  assign prevConv_payload_frame_line_pixel_23_1 = weights_payload_0_1_2_3;
  assign prevConv_payload_frame_line_pixel_23_2 = weights_payload_1_1_2_3;
  assign prevConv_payload_frame_line_pixel_24_0 = inputsT_payload_frame_line_pixel_2_0_0;
  assign prevConv_payload_frame_line_pixel_24_1 = weights_payload_0_2_0_0;
  assign prevConv_payload_frame_line_pixel_24_2 = weights_payload_1_2_0_0;
  assign prevConv_payload_frame_line_pixel_25_0 = inputsT_payload_frame_line_pixel_2_0_1;
  assign prevConv_payload_frame_line_pixel_25_1 = weights_payload_0_2_0_1;
  assign prevConv_payload_frame_line_pixel_25_2 = weights_payload_1_2_0_1;
  assign prevConv_payload_frame_line_pixel_26_0 = inputsT_payload_frame_line_pixel_2_0_2;
  assign prevConv_payload_frame_line_pixel_26_1 = weights_payload_0_2_0_2;
  assign prevConv_payload_frame_line_pixel_26_2 = weights_payload_1_2_0_2;
  assign prevConv_payload_frame_line_pixel_27_0 = inputsT_payload_frame_line_pixel_2_0_3;
  assign prevConv_payload_frame_line_pixel_27_1 = weights_payload_0_2_0_3;
  assign prevConv_payload_frame_line_pixel_27_2 = weights_payload_1_2_0_3;
  assign prevConv_payload_frame_line_pixel_28_0 = inputsT_payload_frame_line_pixel_2_1_0;
  assign prevConv_payload_frame_line_pixel_28_1 = weights_payload_0_2_1_0;
  assign prevConv_payload_frame_line_pixel_28_2 = weights_payload_1_2_1_0;
  assign prevConv_payload_frame_line_pixel_29_0 = inputsT_payload_frame_line_pixel_2_1_1;
  assign prevConv_payload_frame_line_pixel_29_1 = weights_payload_0_2_1_1;
  assign prevConv_payload_frame_line_pixel_29_2 = weights_payload_1_2_1_1;
  assign prevConv_payload_frame_line_pixel_30_0 = inputsT_payload_frame_line_pixel_2_1_2;
  assign prevConv_payload_frame_line_pixel_30_1 = weights_payload_0_2_1_2;
  assign prevConv_payload_frame_line_pixel_30_2 = weights_payload_1_2_1_2;
  assign prevConv_payload_frame_line_pixel_31_0 = inputsT_payload_frame_line_pixel_2_1_3;
  assign prevConv_payload_frame_line_pixel_31_1 = weights_payload_0_2_1_3;
  assign prevConv_payload_frame_line_pixel_31_2 = weights_payload_1_2_1_3;
  assign prevConv_payload_frame_line_pixel_32_0 = inputsT_payload_frame_line_pixel_2_2_0;
  assign prevConv_payload_frame_line_pixel_32_1 = weights_payload_0_2_2_0;
  assign prevConv_payload_frame_line_pixel_32_2 = weights_payload_1_2_2_0;
  assign prevConv_payload_frame_line_pixel_33_0 = inputsT_payload_frame_line_pixel_2_2_1;
  assign prevConv_payload_frame_line_pixel_33_1 = weights_payload_0_2_2_1;
  assign prevConv_payload_frame_line_pixel_33_2 = weights_payload_1_2_2_1;
  assign prevConv_payload_frame_line_pixel_34_0 = inputsT_payload_frame_line_pixel_2_2_2;
  assign prevConv_payload_frame_line_pixel_34_1 = weights_payload_0_2_2_2;
  assign prevConv_payload_frame_line_pixel_34_2 = weights_payload_1_2_2_2;
  assign prevConv_payload_frame_line_pixel_35_0 = inputsT_payload_frame_line_pixel_2_2_3;
  assign prevConv_payload_frame_line_pixel_35_1 = weights_payload_0_2_2_3;
  assign prevConv_payload_frame_line_pixel_35_2 = weights_payload_1_2_2_3;
  assign prevConv_payload_frame_line_endOfLine = inputsT_payload_frame_line_endOfLine;
  assign prevConv_payload_frame_endOfFrame = inputsT_payload_frame_endOfFrame;
  assign prevConv_payload_endOfPack = inputsT_payload_endOfPack;
  assign prevConv_ready = eventM2sPipes_3_eventIn_ready;
  assign postConv_payload_frame_line_pixel_0 = tmp_postConv_payload_frame_line_pixel_0_18;
  assign postConv_payload_frame_line_pixel_1 = tmp_postConv_payload_frame_line_pixel_1_18;
  assign postConv_valid = eventM2sPipes_3_eventOut_valid;
  assign postConv_payload_endOfPack = tmp_postConv_payload_endOfPack_7;
  assign postConv_payload_frame_endOfFrame = tmp_postConv_payload_frame_endOfFrame_7;
  assign postConv_payload_frame_line_endOfLine = tmp_postConv_payload_frame_line_endOfLine_7;
  assign inputsT_fire = (inputsT_valid && inputsT_ready);
  assign weights_ready = (inputsT_fire && inputsT_payload_frame_endOfFrame);
  assign postConv_ready = (! postConv_rValid);
  assign postConv_s2mPipe_valid = (postConv_valid || postConv_rValid);
  assign postConv_s2mPipe_payload_frame_line_pixel_0 = (postConv_rValid ? postConv_rData_frame_line_pixel_0 : postConv_payload_frame_line_pixel_0);
  assign postConv_s2mPipe_payload_frame_line_pixel_1 = (postConv_rValid ? postConv_rData_frame_line_pixel_1 : postConv_payload_frame_line_pixel_1);
  assign postConv_s2mPipe_payload_frame_line_endOfLine = (postConv_rValid ? postConv_rData_frame_line_endOfLine : postConv_payload_frame_line_endOfLine);
  assign postConv_s2mPipe_payload_frame_endOfFrame = (postConv_rValid ? postConv_rData_frame_endOfFrame : postConv_payload_frame_endOfFrame);
  assign postConv_s2mPipe_payload_endOfPack = (postConv_rValid ? postConv_rData_endOfPack : postConv_payload_endOfPack);
  assign postConv_s2mPipe_ready = acc_videoIn_ready;
  assign outputs_valid = acc_videoOut_valid;
  assign outputs_payload_frame_line_pixel_0 = acc_videoOut_payload_frame_line_pixel_0;
  assign outputs_payload_frame_line_pixel_1 = acc_videoOut_payload_frame_line_pixel_1;
  assign outputs_payload_frame_line_endOfLine = acc_videoOut_payload_frame_line_endOfLine;
  assign outputs_payload_frame_endOfFrame = acc_videoOut_payload_frame_endOfFrame;
  assign outputs_payload_endOfPack = acc_videoOut_payload_endOfPack;
  always @(posedge clk) begin
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_0 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0) + $signed(sIMD2INT8_74_ab));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_0_1 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_1) + $signed(sIMD2INT8_77_ab));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_0_2 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_2) + $signed(sIMD2INT8_80_ab));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_0_3 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_3) + $signed(sIMD2INT8_83_ab));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_0_4 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_4) + $signed(sIMD2INT8_86_ab));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_0_5 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_5) + $signed(sIMD2INT8_89_ab));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_0_6 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_6) + $signed(sIMD2INT8_92_ab));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_0_7 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_7) + $signed(sIMD2INT8_95_ab));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_0_8 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_8) + $signed(sIMD2INT8_98_ab));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_0_9 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_9) + $signed(sIMD2INT8_101_ab));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_0_10 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_10) + $signed(sIMD2INT8_104_ab));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_0_11 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_11) + $signed(sIMD2INT8_107_ab));
    end
    if(eventM2sPipes_3_CEs_5) begin
      tmp_postConv_payload_frame_line_pixel_0_12 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_12) + $signed(tmp_postConv_payload_frame_line_pixel_0_2));
    end
    if(eventM2sPipes_3_CEs_5) begin
      tmp_postConv_payload_frame_line_pixel_0_13 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_13) + $signed(tmp_postConv_payload_frame_line_pixel_0_5));
    end
    if(eventM2sPipes_3_CEs_5) begin
      tmp_postConv_payload_frame_line_pixel_0_14 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_14) + $signed(tmp_postConv_payload_frame_line_pixel_0_8));
    end
    if(eventM2sPipes_3_CEs_5) begin
      tmp_postConv_payload_frame_line_pixel_0_15 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_15) + $signed(tmp_postConv_payload_frame_line_pixel_0_11));
    end
    if(eventM2sPipes_3_CEs_6) begin
      tmp_postConv_payload_frame_line_pixel_0_16 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_16) + $signed(tmp_postConv_payload_frame_line_pixel_0_14));
    end
    if(eventM2sPipes_3_CEs_6) begin
      tmp_postConv_payload_frame_line_pixel_0_17 <= tmp_postConv_payload_frame_line_pixel_0_15;
    end
    if(eventM2sPipes_3_CEs_7) begin
      tmp_postConv_payload_frame_line_pixel_0_18 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_0_18) + $signed(tmp_tmp_postConv_payload_frame_line_pixel_0_18_1));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_1 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1) + $signed(sIMD2INT8_74_ac));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_1_1 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_1) + $signed(sIMD2INT8_77_ac));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_1_2 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_2) + $signed(sIMD2INT8_80_ac));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_1_3 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_3) + $signed(sIMD2INT8_83_ac));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_1_4 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_4) + $signed(sIMD2INT8_86_ac));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_1_5 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_5) + $signed(sIMD2INT8_89_ac));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_1_6 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_6) + $signed(sIMD2INT8_92_ac));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_1_7 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_7) + $signed(sIMD2INT8_95_ac));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_1_8 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_8) + $signed(sIMD2INT8_98_ac));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_1_9 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_9) + $signed(sIMD2INT8_101_ac));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_1_10 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_10) + $signed(sIMD2INT8_104_ac));
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_pixel_1_11 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_11) + $signed(sIMD2INT8_107_ac));
    end
    if(eventM2sPipes_3_CEs_5) begin
      tmp_postConv_payload_frame_line_pixel_1_12 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_12) + $signed(tmp_postConv_payload_frame_line_pixel_1_2));
    end
    if(eventM2sPipes_3_CEs_5) begin
      tmp_postConv_payload_frame_line_pixel_1_13 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_13) + $signed(tmp_postConv_payload_frame_line_pixel_1_5));
    end
    if(eventM2sPipes_3_CEs_5) begin
      tmp_postConv_payload_frame_line_pixel_1_14 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_14) + $signed(tmp_postConv_payload_frame_line_pixel_1_8));
    end
    if(eventM2sPipes_3_CEs_5) begin
      tmp_postConv_payload_frame_line_pixel_1_15 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_15) + $signed(tmp_postConv_payload_frame_line_pixel_1_11));
    end
    if(eventM2sPipes_3_CEs_6) begin
      tmp_postConv_payload_frame_line_pixel_1_16 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_16) + $signed(tmp_postConv_payload_frame_line_pixel_1_14));
    end
    if(eventM2sPipes_3_CEs_6) begin
      tmp_postConv_payload_frame_line_pixel_1_17 <= tmp_postConv_payload_frame_line_pixel_1_15;
    end
    if(eventM2sPipes_3_CEs_7) begin
      tmp_postConv_payload_frame_line_pixel_1_18 <= ($signed(tmp_tmp_postConv_payload_frame_line_pixel_1_18) + $signed(tmp_tmp_postConv_payload_frame_line_pixel_1_18_1));
    end
    if(eventM2sPipes_3_CEs_0) begin
      tmp_postConv_payload_frame_line_endOfLine <= prevConv_payload_frame_line_endOfLine;
      tmp_postConv_payload_frame_endOfFrame <= prevConv_payload_frame_endOfFrame;
      tmp_postConv_payload_endOfPack <= prevConv_payload_endOfPack;
    end
    if(eventM2sPipes_3_CEs_1) begin
      tmp_postConv_payload_frame_line_endOfLine_1 <= tmp_postConv_payload_frame_line_endOfLine;
      tmp_postConv_payload_frame_endOfFrame_1 <= tmp_postConv_payload_frame_endOfFrame;
      tmp_postConv_payload_endOfPack_1 <= tmp_postConv_payload_endOfPack;
    end
    if(eventM2sPipes_3_CEs_2) begin
      tmp_postConv_payload_frame_line_endOfLine_2 <= tmp_postConv_payload_frame_line_endOfLine_1;
      tmp_postConv_payload_frame_endOfFrame_2 <= tmp_postConv_payload_frame_endOfFrame_1;
      tmp_postConv_payload_endOfPack_2 <= tmp_postConv_payload_endOfPack_1;
    end
    if(eventM2sPipes_3_CEs_3) begin
      tmp_postConv_payload_frame_line_endOfLine_3 <= tmp_postConv_payload_frame_line_endOfLine_2;
      tmp_postConv_payload_frame_endOfFrame_3 <= tmp_postConv_payload_frame_endOfFrame_2;
      tmp_postConv_payload_endOfPack_3 <= tmp_postConv_payload_endOfPack_2;
    end
    if(eventM2sPipes_3_CEs_4) begin
      tmp_postConv_payload_frame_line_endOfLine_4 <= tmp_postConv_payload_frame_line_endOfLine_3;
      tmp_postConv_payload_frame_endOfFrame_4 <= tmp_postConv_payload_frame_endOfFrame_3;
      tmp_postConv_payload_endOfPack_4 <= tmp_postConv_payload_endOfPack_3;
    end
    if(eventM2sPipes_3_CEs_5) begin
      tmp_postConv_payload_frame_line_endOfLine_5 <= tmp_postConv_payload_frame_line_endOfLine_4;
      tmp_postConv_payload_frame_endOfFrame_5 <= tmp_postConv_payload_frame_endOfFrame_4;
      tmp_postConv_payload_endOfPack_5 <= tmp_postConv_payload_endOfPack_4;
    end
    if(eventM2sPipes_3_CEs_6) begin
      tmp_postConv_payload_frame_line_endOfLine_6 <= tmp_postConv_payload_frame_line_endOfLine_5;
      tmp_postConv_payload_frame_endOfFrame_6 <= tmp_postConv_payload_frame_endOfFrame_5;
      tmp_postConv_payload_endOfPack_6 <= tmp_postConv_payload_endOfPack_5;
    end
    if(eventM2sPipes_3_CEs_7) begin
      tmp_postConv_payload_frame_line_endOfLine_7 <= tmp_postConv_payload_frame_line_endOfLine_6;
      tmp_postConv_payload_frame_endOfFrame_7 <= tmp_postConv_payload_frame_endOfFrame_6;
      tmp_postConv_payload_endOfPack_7 <= tmp_postConv_payload_endOfPack_6;
    end
    if(postConv_ready) begin
      postConv_rData_frame_line_pixel_0 <= postConv_payload_frame_line_pixel_0;
      postConv_rData_frame_line_pixel_1 <= postConv_payload_frame_line_pixel_1;
      postConv_rData_frame_line_endOfLine <= postConv_payload_frame_line_endOfLine;
      postConv_rData_frame_endOfFrame <= postConv_payload_frame_endOfFrame;
      postConv_rData_endOfPack <= postConv_payload_endOfPack;
    end
  end

  always @(posedge clk) begin
    if(reset) begin
      postConv_rValid <= 1'b0;
    end else begin
      if(postConv_valid) begin
        postConv_rValid <= 1'b1;
      end
      if(postConv_s2mPipe_ready) begin
        postConv_rValid <= 1'b0;
      end
    end
  end


endmodule

module StreamFork_4 (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [7:0]    io_input_payload_frame_line_pixel_0_0_0,
  input      [7:0]    io_input_payload_frame_line_pixel_0_0_1,
  input      [7:0]    io_input_payload_frame_line_pixel_0_0_2,
  input      [7:0]    io_input_payload_frame_line_pixel_0_0_3,
  input      [7:0]    io_input_payload_frame_line_pixel_0_1_0,
  input      [7:0]    io_input_payload_frame_line_pixel_0_1_1,
  input      [7:0]    io_input_payload_frame_line_pixel_0_1_2,
  input      [7:0]    io_input_payload_frame_line_pixel_0_1_3,
  input      [7:0]    io_input_payload_frame_line_pixel_0_2_0,
  input      [7:0]    io_input_payload_frame_line_pixel_0_2_1,
  input      [7:0]    io_input_payload_frame_line_pixel_0_2_2,
  input      [7:0]    io_input_payload_frame_line_pixel_0_2_3,
  input      [7:0]    io_input_payload_frame_line_pixel_1_0_0,
  input      [7:0]    io_input_payload_frame_line_pixel_1_0_1,
  input      [7:0]    io_input_payload_frame_line_pixel_1_0_2,
  input      [7:0]    io_input_payload_frame_line_pixel_1_0_3,
  input      [7:0]    io_input_payload_frame_line_pixel_1_1_0,
  input      [7:0]    io_input_payload_frame_line_pixel_1_1_1,
  input      [7:0]    io_input_payload_frame_line_pixel_1_1_2,
  input      [7:0]    io_input_payload_frame_line_pixel_1_1_3,
  input      [7:0]    io_input_payload_frame_line_pixel_1_2_0,
  input      [7:0]    io_input_payload_frame_line_pixel_1_2_1,
  input      [7:0]    io_input_payload_frame_line_pixel_1_2_2,
  input      [7:0]    io_input_payload_frame_line_pixel_1_2_3,
  input      [7:0]    io_input_payload_frame_line_pixel_2_0_0,
  input      [7:0]    io_input_payload_frame_line_pixel_2_0_1,
  input      [7:0]    io_input_payload_frame_line_pixel_2_0_2,
  input      [7:0]    io_input_payload_frame_line_pixel_2_0_3,
  input      [7:0]    io_input_payload_frame_line_pixel_2_1_0,
  input      [7:0]    io_input_payload_frame_line_pixel_2_1_1,
  input      [7:0]    io_input_payload_frame_line_pixel_2_1_2,
  input      [7:0]    io_input_payload_frame_line_pixel_2_1_3,
  input      [7:0]    io_input_payload_frame_line_pixel_2_2_0,
  input      [7:0]    io_input_payload_frame_line_pixel_2_2_1,
  input      [7:0]    io_input_payload_frame_line_pixel_2_2_2,
  input      [7:0]    io_input_payload_frame_line_pixel_2_2_3,
  input               io_input_payload_frame_line_endOfLine,
  input               io_input_payload_frame_endOfFrame,
  input               io_input_payload_endOfPack,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_0_0_0,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_0_0_1,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_0_0_2,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_0_0_3,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_0_1_0,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_0_1_1,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_0_1_2,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_0_1_3,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_0_2_0,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_0_2_1,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_0_2_2,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_0_2_3,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_1_0_0,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_1_0_1,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_1_0_2,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_1_0_3,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_1_1_0,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_1_1_1,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_1_1_2,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_1_1_3,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_1_2_0,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_1_2_1,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_1_2_2,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_1_2_3,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_2_0_0,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_2_0_1,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_2_0_2,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_2_0_3,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_2_1_0,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_2_1_1,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_2_1_2,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_2_1_3,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_2_2_0,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_2_2_1,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_2_2_2,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_2_2_3,
  output              io_outputs_0_payload_frame_line_endOfLine,
  output              io_outputs_0_payload_frame_endOfFrame,
  output              io_outputs_0_payload_endOfPack,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_0_0_0,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_0_0_1,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_0_0_2,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_0_0_3,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_0_1_0,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_0_1_1,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_0_1_2,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_0_1_3,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_0_2_0,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_0_2_1,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_0_2_2,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_0_2_3,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_1_0_0,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_1_0_1,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_1_0_2,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_1_0_3,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_1_1_0,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_1_1_1,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_1_1_2,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_1_1_3,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_1_2_0,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_1_2_1,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_1_2_2,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_1_2_3,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_2_0_0,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_2_0_1,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_2_0_2,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_2_0_3,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_2_1_0,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_2_1_1,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_2_1_2,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_2_1_3,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_2_2_0,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_2_2_1,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_2_2_2,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_2_2_3,
  output              io_outputs_1_payload_frame_line_endOfLine,
  output              io_outputs_1_payload_frame_endOfFrame,
  output              io_outputs_1_payload_endOfPack,
  input               clk,
  input               reset
);

  reg                 tmp_io_outputs_0_valid;
  reg                 tmp_io_outputs_1_valid;
  wire                when_Stream_l825;
  wire                when_Stream_l825_1;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(when_Stream_l825) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l825_1) begin
      io_input_ready = 1'b0;
    end
  end

  assign when_Stream_l825 = ((! io_outputs_0_ready) && tmp_io_outputs_0_valid);
  assign when_Stream_l825_1 = ((! io_outputs_1_ready) && tmp_io_outputs_1_valid);
  assign io_outputs_0_valid = (io_input_valid && tmp_io_outputs_0_valid);
  assign io_outputs_0_payload_frame_line_pixel_0_0_0 = io_input_payload_frame_line_pixel_0_0_0;
  assign io_outputs_0_payload_frame_line_pixel_0_0_1 = io_input_payload_frame_line_pixel_0_0_1;
  assign io_outputs_0_payload_frame_line_pixel_0_0_2 = io_input_payload_frame_line_pixel_0_0_2;
  assign io_outputs_0_payload_frame_line_pixel_0_0_3 = io_input_payload_frame_line_pixel_0_0_3;
  assign io_outputs_0_payload_frame_line_pixel_0_1_0 = io_input_payload_frame_line_pixel_0_1_0;
  assign io_outputs_0_payload_frame_line_pixel_0_1_1 = io_input_payload_frame_line_pixel_0_1_1;
  assign io_outputs_0_payload_frame_line_pixel_0_1_2 = io_input_payload_frame_line_pixel_0_1_2;
  assign io_outputs_0_payload_frame_line_pixel_0_1_3 = io_input_payload_frame_line_pixel_0_1_3;
  assign io_outputs_0_payload_frame_line_pixel_0_2_0 = io_input_payload_frame_line_pixel_0_2_0;
  assign io_outputs_0_payload_frame_line_pixel_0_2_1 = io_input_payload_frame_line_pixel_0_2_1;
  assign io_outputs_0_payload_frame_line_pixel_0_2_2 = io_input_payload_frame_line_pixel_0_2_2;
  assign io_outputs_0_payload_frame_line_pixel_0_2_3 = io_input_payload_frame_line_pixel_0_2_3;
  assign io_outputs_0_payload_frame_line_pixel_1_0_0 = io_input_payload_frame_line_pixel_1_0_0;
  assign io_outputs_0_payload_frame_line_pixel_1_0_1 = io_input_payload_frame_line_pixel_1_0_1;
  assign io_outputs_0_payload_frame_line_pixel_1_0_2 = io_input_payload_frame_line_pixel_1_0_2;
  assign io_outputs_0_payload_frame_line_pixel_1_0_3 = io_input_payload_frame_line_pixel_1_0_3;
  assign io_outputs_0_payload_frame_line_pixel_1_1_0 = io_input_payload_frame_line_pixel_1_1_0;
  assign io_outputs_0_payload_frame_line_pixel_1_1_1 = io_input_payload_frame_line_pixel_1_1_1;
  assign io_outputs_0_payload_frame_line_pixel_1_1_2 = io_input_payload_frame_line_pixel_1_1_2;
  assign io_outputs_0_payload_frame_line_pixel_1_1_3 = io_input_payload_frame_line_pixel_1_1_3;
  assign io_outputs_0_payload_frame_line_pixel_1_2_0 = io_input_payload_frame_line_pixel_1_2_0;
  assign io_outputs_0_payload_frame_line_pixel_1_2_1 = io_input_payload_frame_line_pixel_1_2_1;
  assign io_outputs_0_payload_frame_line_pixel_1_2_2 = io_input_payload_frame_line_pixel_1_2_2;
  assign io_outputs_0_payload_frame_line_pixel_1_2_3 = io_input_payload_frame_line_pixel_1_2_3;
  assign io_outputs_0_payload_frame_line_pixel_2_0_0 = io_input_payload_frame_line_pixel_2_0_0;
  assign io_outputs_0_payload_frame_line_pixel_2_0_1 = io_input_payload_frame_line_pixel_2_0_1;
  assign io_outputs_0_payload_frame_line_pixel_2_0_2 = io_input_payload_frame_line_pixel_2_0_2;
  assign io_outputs_0_payload_frame_line_pixel_2_0_3 = io_input_payload_frame_line_pixel_2_0_3;
  assign io_outputs_0_payload_frame_line_pixel_2_1_0 = io_input_payload_frame_line_pixel_2_1_0;
  assign io_outputs_0_payload_frame_line_pixel_2_1_1 = io_input_payload_frame_line_pixel_2_1_1;
  assign io_outputs_0_payload_frame_line_pixel_2_1_2 = io_input_payload_frame_line_pixel_2_1_2;
  assign io_outputs_0_payload_frame_line_pixel_2_1_3 = io_input_payload_frame_line_pixel_2_1_3;
  assign io_outputs_0_payload_frame_line_pixel_2_2_0 = io_input_payload_frame_line_pixel_2_2_0;
  assign io_outputs_0_payload_frame_line_pixel_2_2_1 = io_input_payload_frame_line_pixel_2_2_1;
  assign io_outputs_0_payload_frame_line_pixel_2_2_2 = io_input_payload_frame_line_pixel_2_2_2;
  assign io_outputs_0_payload_frame_line_pixel_2_2_3 = io_input_payload_frame_line_pixel_2_2_3;
  assign io_outputs_0_payload_frame_line_endOfLine = io_input_payload_frame_line_endOfLine;
  assign io_outputs_0_payload_frame_endOfFrame = io_input_payload_frame_endOfFrame;
  assign io_outputs_0_payload_endOfPack = io_input_payload_endOfPack;
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && tmp_io_outputs_1_valid);
  assign io_outputs_1_payload_frame_line_pixel_0_0_0 = io_input_payload_frame_line_pixel_0_0_0;
  assign io_outputs_1_payload_frame_line_pixel_0_0_1 = io_input_payload_frame_line_pixel_0_0_1;
  assign io_outputs_1_payload_frame_line_pixel_0_0_2 = io_input_payload_frame_line_pixel_0_0_2;
  assign io_outputs_1_payload_frame_line_pixel_0_0_3 = io_input_payload_frame_line_pixel_0_0_3;
  assign io_outputs_1_payload_frame_line_pixel_0_1_0 = io_input_payload_frame_line_pixel_0_1_0;
  assign io_outputs_1_payload_frame_line_pixel_0_1_1 = io_input_payload_frame_line_pixel_0_1_1;
  assign io_outputs_1_payload_frame_line_pixel_0_1_2 = io_input_payload_frame_line_pixel_0_1_2;
  assign io_outputs_1_payload_frame_line_pixel_0_1_3 = io_input_payload_frame_line_pixel_0_1_3;
  assign io_outputs_1_payload_frame_line_pixel_0_2_0 = io_input_payload_frame_line_pixel_0_2_0;
  assign io_outputs_1_payload_frame_line_pixel_0_2_1 = io_input_payload_frame_line_pixel_0_2_1;
  assign io_outputs_1_payload_frame_line_pixel_0_2_2 = io_input_payload_frame_line_pixel_0_2_2;
  assign io_outputs_1_payload_frame_line_pixel_0_2_3 = io_input_payload_frame_line_pixel_0_2_3;
  assign io_outputs_1_payload_frame_line_pixel_1_0_0 = io_input_payload_frame_line_pixel_1_0_0;
  assign io_outputs_1_payload_frame_line_pixel_1_0_1 = io_input_payload_frame_line_pixel_1_0_1;
  assign io_outputs_1_payload_frame_line_pixel_1_0_2 = io_input_payload_frame_line_pixel_1_0_2;
  assign io_outputs_1_payload_frame_line_pixel_1_0_3 = io_input_payload_frame_line_pixel_1_0_3;
  assign io_outputs_1_payload_frame_line_pixel_1_1_0 = io_input_payload_frame_line_pixel_1_1_0;
  assign io_outputs_1_payload_frame_line_pixel_1_1_1 = io_input_payload_frame_line_pixel_1_1_1;
  assign io_outputs_1_payload_frame_line_pixel_1_1_2 = io_input_payload_frame_line_pixel_1_1_2;
  assign io_outputs_1_payload_frame_line_pixel_1_1_3 = io_input_payload_frame_line_pixel_1_1_3;
  assign io_outputs_1_payload_frame_line_pixel_1_2_0 = io_input_payload_frame_line_pixel_1_2_0;
  assign io_outputs_1_payload_frame_line_pixel_1_2_1 = io_input_payload_frame_line_pixel_1_2_1;
  assign io_outputs_1_payload_frame_line_pixel_1_2_2 = io_input_payload_frame_line_pixel_1_2_2;
  assign io_outputs_1_payload_frame_line_pixel_1_2_3 = io_input_payload_frame_line_pixel_1_2_3;
  assign io_outputs_1_payload_frame_line_pixel_2_0_0 = io_input_payload_frame_line_pixel_2_0_0;
  assign io_outputs_1_payload_frame_line_pixel_2_0_1 = io_input_payload_frame_line_pixel_2_0_1;
  assign io_outputs_1_payload_frame_line_pixel_2_0_2 = io_input_payload_frame_line_pixel_2_0_2;
  assign io_outputs_1_payload_frame_line_pixel_2_0_3 = io_input_payload_frame_line_pixel_2_0_3;
  assign io_outputs_1_payload_frame_line_pixel_2_1_0 = io_input_payload_frame_line_pixel_2_1_0;
  assign io_outputs_1_payload_frame_line_pixel_2_1_1 = io_input_payload_frame_line_pixel_2_1_1;
  assign io_outputs_1_payload_frame_line_pixel_2_1_2 = io_input_payload_frame_line_pixel_2_1_2;
  assign io_outputs_1_payload_frame_line_pixel_2_1_3 = io_input_payload_frame_line_pixel_2_1_3;
  assign io_outputs_1_payload_frame_line_pixel_2_2_0 = io_input_payload_frame_line_pixel_2_2_0;
  assign io_outputs_1_payload_frame_line_pixel_2_2_1 = io_input_payload_frame_line_pixel_2_2_1;
  assign io_outputs_1_payload_frame_line_pixel_2_2_2 = io_input_payload_frame_line_pixel_2_2_2;
  assign io_outputs_1_payload_frame_line_pixel_2_2_3 = io_input_payload_frame_line_pixel_2_2_3;
  assign io_outputs_1_payload_frame_line_endOfLine = io_input_payload_frame_line_endOfLine;
  assign io_outputs_1_payload_frame_endOfFrame = io_input_payload_frame_endOfFrame;
  assign io_outputs_1_payload_endOfPack = io_input_payload_endOfPack;
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  always @(posedge clk) begin
    if(reset) begin
      tmp_io_outputs_0_valid <= 1'b1;
      tmp_io_outputs_1_valid <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        tmp_io_outputs_0_valid <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        tmp_io_outputs_1_valid <= 1'b0;
      end
      if(io_input_ready) begin
        tmp_io_outputs_0_valid <= 1'b1;
        tmp_io_outputs_1_valid <= 1'b1;
      end
    end
  end


endmodule

module SlidingWindowSame (
  input               videoIn_valid,
  output              videoIn_ready,
  input      [7:0]    videoIn_payload_frame_line_pixel_0,
  input      [7:0]    videoIn_payload_frame_line_pixel_1,
  input      [7:0]    videoIn_payload_frame_line_pixel_2,
  input      [7:0]    videoIn_payload_frame_line_pixel_3,
  input               videoIn_payload_frame_line_endOfLine,
  input               videoIn_payload_frame_endOfFrame,
  input               videoIn_payload_endOfPack,
  output              videoOut_valid,
  input               videoOut_ready,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_2_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_2_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_2_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_2_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_2_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_2_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_2_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_2_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_0_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_0_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_0_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_0_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_1_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_1_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_1_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_1_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_2_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_2_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_2_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_2_3,
  output              videoOut_payload_frame_line_endOfLine,
  output              videoOut_payload_frame_endOfFrame,
  output              videoOut_payload_endOfPack,
  input               clk,
  input               reset
);

  reg                 line_videoOut_ready;
  reg                 pixel_videoOut_ready;
  wire                line_videoIn_ready;
  wire                line_videoOut_valid;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_0_0;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_0_1;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_0_2;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_0_3;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_1_0;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_1_1;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_1_2;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_1_3;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_2_0;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_2_1;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_2_2;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_2_3;
  wire                line_videoOut_payload_frame_line_endOfLine;
  wire                line_videoOut_payload_frame_endOfFrame;
  wire                line_videoOut_payload_endOfPack;
  wire                pixel_videoIn_ready;
  wire                pixel_videoOut_valid;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_0_0;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_0_1;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_0_2;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_0_3;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_1_0;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_1_1;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_1_2;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_1_3;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_2_0;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_2_1;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_2_2;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_2_3;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_0_0;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_0_1;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_0_2;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_0_3;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_1_0;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_1_1;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_1_2;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_1_3;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_2_0;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_2_1;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_2_2;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_2_3;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_2_0_0;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_2_0_1;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_2_0_2;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_2_0_3;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_2_1_0;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_2_1_1;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_2_1_2;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_2_1_3;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_2_2_0;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_2_2_1;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_2_2_2;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_2_2_3;
  wire                pixel_videoOut_payload_frame_line_endOfLine;
  wire                pixel_videoOut_payload_frame_endOfFrame;
  wire                pixel_videoOut_payload_endOfPack;
  wire                pixelOut_valid;
  wire                pixelOut_ready;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_0_0;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_0_1;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_0_2;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_0_3;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_1_0;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_1_1;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_1_2;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_1_3;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_2_0;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_2_1;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_2_2;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_2_3;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_0_0;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_0_1;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_0_2;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_0_3;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_1_0;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_1_1;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_1_2;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_1_3;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_2_0;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_2_1;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_2_2;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_2_3;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_2_0_0;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_2_0_1;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_2_0_2;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_2_0_3;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_2_1_0;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_2_1_1;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_2_1_2;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_2_1_3;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_2_2_0;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_2_2_1;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_2_2_2;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_2_2_3;
  wire                pixelOut_payload_frame_line_endOfLine;
  wire                pixelOut_payload_frame_endOfFrame;
  wire                pixelOut_payload_endOfPack;
  reg                 pixel_videoOut_rValid;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_0_0;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_0_1;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_0_2;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_0_3;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_1_0;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_1_1;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_1_2;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_1_3;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_2_0;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_2_1;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_2_2;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_2_3;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_0_0;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_0_1;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_0_2;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_0_3;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_1_0;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_1_1;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_1_2;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_1_3;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_2_0;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_2_1;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_2_2;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_2_3;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_2_0_0;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_2_0_1;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_2_0_2;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_2_0_3;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_2_1_0;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_2_1_1;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_2_1_2;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_2_1_3;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_2_2_0;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_2_2_1;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_2_2_2;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_2_2_3;
  reg                 pixel_videoOut_rData_frame_line_endOfLine;
  reg                 pixel_videoOut_rData_frame_endOfFrame;
  reg                 pixel_videoOut_rData_endOfPack;
  wire                when_Stream_l342;
  wire                line_videoOut_m2sPipe_valid;
  wire                line_videoOut_m2sPipe_ready;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_0_0;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_0_1;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_0_2;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_0_3;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_1_0;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_1_1;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_1_2;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_1_3;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_2_0;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_2_1;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_2_2;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_2_3;
  wire                line_videoOut_m2sPipe_payload_frame_line_endOfLine;
  wire                line_videoOut_m2sPipe_payload_frame_endOfFrame;
  wire                line_videoOut_m2sPipe_payload_endOfPack;
  reg                 line_videoOut_rValid;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_0_0;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_0_1;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_0_2;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_0_3;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_1_0;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_1_1;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_1_2;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_1_3;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_2_0;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_2_1;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_2_2;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_2_3;
  reg                 line_videoOut_rData_frame_line_endOfLine;
  reg                 line_videoOut_rData_frame_endOfFrame;
  reg                 line_videoOut_rData_endOfPack;
  wire                when_Stream_l342_1;
  wire                line_videoOut_m2sPipe_s2mPipe_valid;
  wire                line_videoOut_m2sPipe_s2mPipe_ready;
  wire       [7:0]    line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_0_0;
  wire       [7:0]    line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_0_1;
  wire       [7:0]    line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_0_2;
  wire       [7:0]    line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_0_3;
  wire       [7:0]    line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_1_0;
  wire       [7:0]    line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_1_1;
  wire       [7:0]    line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_1_2;
  wire       [7:0]    line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_1_3;
  wire       [7:0]    line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_2_0;
  wire       [7:0]    line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_2_1;
  wire       [7:0]    line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_2_2;
  wire       [7:0]    line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_2_3;
  wire                line_videoOut_m2sPipe_s2mPipe_payload_frame_line_endOfLine;
  wire                line_videoOut_m2sPipe_s2mPipe_payload_frame_endOfFrame;
  wire                line_videoOut_m2sPipe_s2mPipe_payload_endOfPack;
  reg                 line_videoOut_m2sPipe_rValid;
  reg        [7:0]    line_videoOut_m2sPipe_rData_frame_line_pixel_0_0;
  reg        [7:0]    line_videoOut_m2sPipe_rData_frame_line_pixel_0_1;
  reg        [7:0]    line_videoOut_m2sPipe_rData_frame_line_pixel_0_2;
  reg        [7:0]    line_videoOut_m2sPipe_rData_frame_line_pixel_0_3;
  reg        [7:0]    line_videoOut_m2sPipe_rData_frame_line_pixel_1_0;
  reg        [7:0]    line_videoOut_m2sPipe_rData_frame_line_pixel_1_1;
  reg        [7:0]    line_videoOut_m2sPipe_rData_frame_line_pixel_1_2;
  reg        [7:0]    line_videoOut_m2sPipe_rData_frame_line_pixel_1_3;
  reg        [7:0]    line_videoOut_m2sPipe_rData_frame_line_pixel_2_0;
  reg        [7:0]    line_videoOut_m2sPipe_rData_frame_line_pixel_2_1;
  reg        [7:0]    line_videoOut_m2sPipe_rData_frame_line_pixel_2_2;
  reg        [7:0]    line_videoOut_m2sPipe_rData_frame_line_pixel_2_3;
  reg                 line_videoOut_m2sPipe_rData_frame_line_endOfLine;
  reg                 line_videoOut_m2sPipe_rData_frame_endOfFrame;
  reg                 line_videoOut_m2sPipe_rData_endOfPack;

  LineBufferSame line (
    .videoIn_valid                            (videoIn_valid                                    ), //i
    .videoIn_ready                            (line_videoIn_ready                               ), //o
    .videoIn_payload_frame_line_pixel_0       (videoIn_payload_frame_line_pixel_0[7:0]          ), //i
    .videoIn_payload_frame_line_pixel_1       (videoIn_payload_frame_line_pixel_1[7:0]          ), //i
    .videoIn_payload_frame_line_pixel_2       (videoIn_payload_frame_line_pixel_2[7:0]          ), //i
    .videoIn_payload_frame_line_pixel_3       (videoIn_payload_frame_line_pixel_3[7:0]          ), //i
    .videoIn_payload_frame_line_endOfLine     (videoIn_payload_frame_line_endOfLine             ), //i
    .videoIn_payload_frame_endOfFrame         (videoIn_payload_frame_endOfFrame                 ), //i
    .videoIn_payload_endOfPack                (videoIn_payload_endOfPack                        ), //i
    .videoOut_valid                           (line_videoOut_valid                              ), //o
    .videoOut_ready                           (line_videoOut_ready                              ), //i
    .videoOut_payload_frame_line_pixel_0_0    (line_videoOut_payload_frame_line_pixel_0_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_1    (line_videoOut_payload_frame_line_pixel_0_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_2    (line_videoOut_payload_frame_line_pixel_0_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_3    (line_videoOut_payload_frame_line_pixel_0_3[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_0    (line_videoOut_payload_frame_line_pixel_1_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_1    (line_videoOut_payload_frame_line_pixel_1_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_2    (line_videoOut_payload_frame_line_pixel_1_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_3    (line_videoOut_payload_frame_line_pixel_1_3[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_0    (line_videoOut_payload_frame_line_pixel_2_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_1    (line_videoOut_payload_frame_line_pixel_2_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_2    (line_videoOut_payload_frame_line_pixel_2_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_2_3    (line_videoOut_payload_frame_line_pixel_2_3[7:0]  ), //o
    .videoOut_payload_frame_line_endOfLine    (line_videoOut_payload_frame_line_endOfLine       ), //o
    .videoOut_payload_frame_endOfFrame        (line_videoOut_payload_frame_endOfFrame           ), //o
    .videoOut_payload_endOfPack               (line_videoOut_payload_endOfPack                  ), //o
    .clk                                      (clk                                              ), //i
    .reset                                    (reset                                            )  //i
  );
  PixelBufferSame pixel (
    .videoIn_valid                              (line_videoOut_m2sPipe_s2mPipe_valid                              ), //i
    .videoIn_ready                              (pixel_videoIn_ready                                              ), //o
    .videoIn_payload_frame_line_pixel_0_0       (line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_0_0[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_0_1       (line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_0_1[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_0_2       (line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_0_2[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_0_3       (line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_0_3[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_1_0       (line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_1_0[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_1_1       (line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_1_1[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_1_2       (line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_1_2[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_1_3       (line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_1_3[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_2_0       (line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_2_0[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_2_1       (line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_2_1[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_2_2       (line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_2_2[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_2_3       (line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_2_3[7:0]  ), //i
    .videoIn_payload_frame_line_endOfLine       (line_videoOut_m2sPipe_s2mPipe_payload_frame_line_endOfLine       ), //i
    .videoIn_payload_frame_endOfFrame           (line_videoOut_m2sPipe_s2mPipe_payload_frame_endOfFrame           ), //i
    .videoIn_payload_endOfPack                  (line_videoOut_m2sPipe_s2mPipe_payload_endOfPack                  ), //i
    .videoOut_valid                             (pixel_videoOut_valid                                             ), //o
    .videoOut_ready                             (pixel_videoOut_ready                                             ), //i
    .videoOut_payload_frame_line_pixel_0_0_0    (pixel_videoOut_payload_frame_line_pixel_0_0_0[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_0_0_1    (pixel_videoOut_payload_frame_line_pixel_0_0_1[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_0_0_2    (pixel_videoOut_payload_frame_line_pixel_0_0_2[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_0_0_3    (pixel_videoOut_payload_frame_line_pixel_0_0_3[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_0_1_0    (pixel_videoOut_payload_frame_line_pixel_0_1_0[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_0_1_1    (pixel_videoOut_payload_frame_line_pixel_0_1_1[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_0_1_2    (pixel_videoOut_payload_frame_line_pixel_0_1_2[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_0_1_3    (pixel_videoOut_payload_frame_line_pixel_0_1_3[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_0_2_0    (pixel_videoOut_payload_frame_line_pixel_0_2_0[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_0_2_1    (pixel_videoOut_payload_frame_line_pixel_0_2_1[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_0_2_2    (pixel_videoOut_payload_frame_line_pixel_0_2_2[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_0_2_3    (pixel_videoOut_payload_frame_line_pixel_0_2_3[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_1_0_0    (pixel_videoOut_payload_frame_line_pixel_1_0_0[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_1_0_1    (pixel_videoOut_payload_frame_line_pixel_1_0_1[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_1_0_2    (pixel_videoOut_payload_frame_line_pixel_1_0_2[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_1_0_3    (pixel_videoOut_payload_frame_line_pixel_1_0_3[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_1_1_0    (pixel_videoOut_payload_frame_line_pixel_1_1_0[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_1_1_1    (pixel_videoOut_payload_frame_line_pixel_1_1_1[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_1_1_2    (pixel_videoOut_payload_frame_line_pixel_1_1_2[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_1_1_3    (pixel_videoOut_payload_frame_line_pixel_1_1_3[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_1_2_0    (pixel_videoOut_payload_frame_line_pixel_1_2_0[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_1_2_1    (pixel_videoOut_payload_frame_line_pixel_1_2_1[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_1_2_2    (pixel_videoOut_payload_frame_line_pixel_1_2_2[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_1_2_3    (pixel_videoOut_payload_frame_line_pixel_1_2_3[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_2_0_0    (pixel_videoOut_payload_frame_line_pixel_2_0_0[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_2_0_1    (pixel_videoOut_payload_frame_line_pixel_2_0_1[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_2_0_2    (pixel_videoOut_payload_frame_line_pixel_2_0_2[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_2_0_3    (pixel_videoOut_payload_frame_line_pixel_2_0_3[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_2_1_0    (pixel_videoOut_payload_frame_line_pixel_2_1_0[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_2_1_1    (pixel_videoOut_payload_frame_line_pixel_2_1_1[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_2_1_2    (pixel_videoOut_payload_frame_line_pixel_2_1_2[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_2_1_3    (pixel_videoOut_payload_frame_line_pixel_2_1_3[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_2_2_0    (pixel_videoOut_payload_frame_line_pixel_2_2_0[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_2_2_1    (pixel_videoOut_payload_frame_line_pixel_2_2_1[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_2_2_2    (pixel_videoOut_payload_frame_line_pixel_2_2_2[7:0]               ), //o
    .videoOut_payload_frame_line_pixel_2_2_3    (pixel_videoOut_payload_frame_line_pixel_2_2_3[7:0]               ), //o
    .videoOut_payload_frame_line_endOfLine      (pixel_videoOut_payload_frame_line_endOfLine                      ), //o
    .videoOut_payload_frame_endOfFrame          (pixel_videoOut_payload_frame_endOfFrame                          ), //o
    .videoOut_payload_endOfPack                 (pixel_videoOut_payload_endOfPack                                 ), //o
    .clk                                        (clk                                                              ), //i
    .reset                                      (reset                                                            )  //i
  );
  always @(*) begin
    pixel_videoOut_ready = pixelOut_ready;
    if(when_Stream_l342) begin
      pixel_videoOut_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! pixelOut_valid);
  assign pixelOut_valid = pixel_videoOut_rValid;
  assign pixelOut_payload_frame_line_pixel_0_0_0 = pixel_videoOut_rData_frame_line_pixel_0_0_0;
  assign pixelOut_payload_frame_line_pixel_0_0_1 = pixel_videoOut_rData_frame_line_pixel_0_0_1;
  assign pixelOut_payload_frame_line_pixel_0_0_2 = pixel_videoOut_rData_frame_line_pixel_0_0_2;
  assign pixelOut_payload_frame_line_pixel_0_0_3 = pixel_videoOut_rData_frame_line_pixel_0_0_3;
  assign pixelOut_payload_frame_line_pixel_0_1_0 = pixel_videoOut_rData_frame_line_pixel_0_1_0;
  assign pixelOut_payload_frame_line_pixel_0_1_1 = pixel_videoOut_rData_frame_line_pixel_0_1_1;
  assign pixelOut_payload_frame_line_pixel_0_1_2 = pixel_videoOut_rData_frame_line_pixel_0_1_2;
  assign pixelOut_payload_frame_line_pixel_0_1_3 = pixel_videoOut_rData_frame_line_pixel_0_1_3;
  assign pixelOut_payload_frame_line_pixel_0_2_0 = pixel_videoOut_rData_frame_line_pixel_0_2_0;
  assign pixelOut_payload_frame_line_pixel_0_2_1 = pixel_videoOut_rData_frame_line_pixel_0_2_1;
  assign pixelOut_payload_frame_line_pixel_0_2_2 = pixel_videoOut_rData_frame_line_pixel_0_2_2;
  assign pixelOut_payload_frame_line_pixel_0_2_3 = pixel_videoOut_rData_frame_line_pixel_0_2_3;
  assign pixelOut_payload_frame_line_pixel_1_0_0 = pixel_videoOut_rData_frame_line_pixel_1_0_0;
  assign pixelOut_payload_frame_line_pixel_1_0_1 = pixel_videoOut_rData_frame_line_pixel_1_0_1;
  assign pixelOut_payload_frame_line_pixel_1_0_2 = pixel_videoOut_rData_frame_line_pixel_1_0_2;
  assign pixelOut_payload_frame_line_pixel_1_0_3 = pixel_videoOut_rData_frame_line_pixel_1_0_3;
  assign pixelOut_payload_frame_line_pixel_1_1_0 = pixel_videoOut_rData_frame_line_pixel_1_1_0;
  assign pixelOut_payload_frame_line_pixel_1_1_1 = pixel_videoOut_rData_frame_line_pixel_1_1_1;
  assign pixelOut_payload_frame_line_pixel_1_1_2 = pixel_videoOut_rData_frame_line_pixel_1_1_2;
  assign pixelOut_payload_frame_line_pixel_1_1_3 = pixel_videoOut_rData_frame_line_pixel_1_1_3;
  assign pixelOut_payload_frame_line_pixel_1_2_0 = pixel_videoOut_rData_frame_line_pixel_1_2_0;
  assign pixelOut_payload_frame_line_pixel_1_2_1 = pixel_videoOut_rData_frame_line_pixel_1_2_1;
  assign pixelOut_payload_frame_line_pixel_1_2_2 = pixel_videoOut_rData_frame_line_pixel_1_2_2;
  assign pixelOut_payload_frame_line_pixel_1_2_3 = pixel_videoOut_rData_frame_line_pixel_1_2_3;
  assign pixelOut_payload_frame_line_pixel_2_0_0 = pixel_videoOut_rData_frame_line_pixel_2_0_0;
  assign pixelOut_payload_frame_line_pixel_2_0_1 = pixel_videoOut_rData_frame_line_pixel_2_0_1;
  assign pixelOut_payload_frame_line_pixel_2_0_2 = pixel_videoOut_rData_frame_line_pixel_2_0_2;
  assign pixelOut_payload_frame_line_pixel_2_0_3 = pixel_videoOut_rData_frame_line_pixel_2_0_3;
  assign pixelOut_payload_frame_line_pixel_2_1_0 = pixel_videoOut_rData_frame_line_pixel_2_1_0;
  assign pixelOut_payload_frame_line_pixel_2_1_1 = pixel_videoOut_rData_frame_line_pixel_2_1_1;
  assign pixelOut_payload_frame_line_pixel_2_1_2 = pixel_videoOut_rData_frame_line_pixel_2_1_2;
  assign pixelOut_payload_frame_line_pixel_2_1_3 = pixel_videoOut_rData_frame_line_pixel_2_1_3;
  assign pixelOut_payload_frame_line_pixel_2_2_0 = pixel_videoOut_rData_frame_line_pixel_2_2_0;
  assign pixelOut_payload_frame_line_pixel_2_2_1 = pixel_videoOut_rData_frame_line_pixel_2_2_1;
  assign pixelOut_payload_frame_line_pixel_2_2_2 = pixel_videoOut_rData_frame_line_pixel_2_2_2;
  assign pixelOut_payload_frame_line_pixel_2_2_3 = pixel_videoOut_rData_frame_line_pixel_2_2_3;
  assign pixelOut_payload_frame_line_endOfLine = pixel_videoOut_rData_frame_line_endOfLine;
  assign pixelOut_payload_frame_endOfFrame = pixel_videoOut_rData_frame_endOfFrame;
  assign pixelOut_payload_endOfPack = pixel_videoOut_rData_endOfPack;
  assign videoIn_ready = line_videoIn_ready;
  always @(*) begin
    line_videoOut_ready = line_videoOut_m2sPipe_ready;
    if(when_Stream_l342_1) begin
      line_videoOut_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! line_videoOut_m2sPipe_valid);
  assign line_videoOut_m2sPipe_valid = line_videoOut_rValid;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_0_0 = line_videoOut_rData_frame_line_pixel_0_0;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_0_1 = line_videoOut_rData_frame_line_pixel_0_1;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_0_2 = line_videoOut_rData_frame_line_pixel_0_2;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_0_3 = line_videoOut_rData_frame_line_pixel_0_3;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_1_0 = line_videoOut_rData_frame_line_pixel_1_0;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_1_1 = line_videoOut_rData_frame_line_pixel_1_1;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_1_2 = line_videoOut_rData_frame_line_pixel_1_2;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_1_3 = line_videoOut_rData_frame_line_pixel_1_3;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_2_0 = line_videoOut_rData_frame_line_pixel_2_0;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_2_1 = line_videoOut_rData_frame_line_pixel_2_1;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_2_2 = line_videoOut_rData_frame_line_pixel_2_2;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_2_3 = line_videoOut_rData_frame_line_pixel_2_3;
  assign line_videoOut_m2sPipe_payload_frame_line_endOfLine = line_videoOut_rData_frame_line_endOfLine;
  assign line_videoOut_m2sPipe_payload_frame_endOfFrame = line_videoOut_rData_frame_endOfFrame;
  assign line_videoOut_m2sPipe_payload_endOfPack = line_videoOut_rData_endOfPack;
  assign line_videoOut_m2sPipe_ready = (! line_videoOut_m2sPipe_rValid);
  assign line_videoOut_m2sPipe_s2mPipe_valid = (line_videoOut_m2sPipe_valid || line_videoOut_m2sPipe_rValid);
  assign line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_0_0 = (line_videoOut_m2sPipe_rValid ? line_videoOut_m2sPipe_rData_frame_line_pixel_0_0 : line_videoOut_m2sPipe_payload_frame_line_pixel_0_0);
  assign line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_0_1 = (line_videoOut_m2sPipe_rValid ? line_videoOut_m2sPipe_rData_frame_line_pixel_0_1 : line_videoOut_m2sPipe_payload_frame_line_pixel_0_1);
  assign line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_0_2 = (line_videoOut_m2sPipe_rValid ? line_videoOut_m2sPipe_rData_frame_line_pixel_0_2 : line_videoOut_m2sPipe_payload_frame_line_pixel_0_2);
  assign line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_0_3 = (line_videoOut_m2sPipe_rValid ? line_videoOut_m2sPipe_rData_frame_line_pixel_0_3 : line_videoOut_m2sPipe_payload_frame_line_pixel_0_3);
  assign line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_1_0 = (line_videoOut_m2sPipe_rValid ? line_videoOut_m2sPipe_rData_frame_line_pixel_1_0 : line_videoOut_m2sPipe_payload_frame_line_pixel_1_0);
  assign line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_1_1 = (line_videoOut_m2sPipe_rValid ? line_videoOut_m2sPipe_rData_frame_line_pixel_1_1 : line_videoOut_m2sPipe_payload_frame_line_pixel_1_1);
  assign line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_1_2 = (line_videoOut_m2sPipe_rValid ? line_videoOut_m2sPipe_rData_frame_line_pixel_1_2 : line_videoOut_m2sPipe_payload_frame_line_pixel_1_2);
  assign line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_1_3 = (line_videoOut_m2sPipe_rValid ? line_videoOut_m2sPipe_rData_frame_line_pixel_1_3 : line_videoOut_m2sPipe_payload_frame_line_pixel_1_3);
  assign line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_2_0 = (line_videoOut_m2sPipe_rValid ? line_videoOut_m2sPipe_rData_frame_line_pixel_2_0 : line_videoOut_m2sPipe_payload_frame_line_pixel_2_0);
  assign line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_2_1 = (line_videoOut_m2sPipe_rValid ? line_videoOut_m2sPipe_rData_frame_line_pixel_2_1 : line_videoOut_m2sPipe_payload_frame_line_pixel_2_1);
  assign line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_2_2 = (line_videoOut_m2sPipe_rValid ? line_videoOut_m2sPipe_rData_frame_line_pixel_2_2 : line_videoOut_m2sPipe_payload_frame_line_pixel_2_2);
  assign line_videoOut_m2sPipe_s2mPipe_payload_frame_line_pixel_2_3 = (line_videoOut_m2sPipe_rValid ? line_videoOut_m2sPipe_rData_frame_line_pixel_2_3 : line_videoOut_m2sPipe_payload_frame_line_pixel_2_3);
  assign line_videoOut_m2sPipe_s2mPipe_payload_frame_line_endOfLine = (line_videoOut_m2sPipe_rValid ? line_videoOut_m2sPipe_rData_frame_line_endOfLine : line_videoOut_m2sPipe_payload_frame_line_endOfLine);
  assign line_videoOut_m2sPipe_s2mPipe_payload_frame_endOfFrame = (line_videoOut_m2sPipe_rValid ? line_videoOut_m2sPipe_rData_frame_endOfFrame : line_videoOut_m2sPipe_payload_frame_endOfFrame);
  assign line_videoOut_m2sPipe_s2mPipe_payload_endOfPack = (line_videoOut_m2sPipe_rValid ? line_videoOut_m2sPipe_rData_endOfPack : line_videoOut_m2sPipe_payload_endOfPack);
  assign line_videoOut_m2sPipe_s2mPipe_ready = pixel_videoIn_ready;
  assign videoOut_valid = pixelOut_valid;
  assign pixelOut_ready = videoOut_ready;
  assign videoOut_payload_endOfPack = pixelOut_payload_endOfPack;
  assign videoOut_payload_frame_endOfFrame = pixelOut_payload_frame_endOfFrame;
  assign videoOut_payload_frame_line_endOfLine = pixelOut_payload_frame_line_endOfLine;
  assign videoOut_payload_frame_line_pixel_0_0_0 = pixelOut_payload_frame_line_pixel_0_0_0;
  assign videoOut_payload_frame_line_pixel_0_0_1 = pixelOut_payload_frame_line_pixel_0_0_1;
  assign videoOut_payload_frame_line_pixel_0_0_2 = pixelOut_payload_frame_line_pixel_0_0_2;
  assign videoOut_payload_frame_line_pixel_0_0_3 = pixelOut_payload_frame_line_pixel_0_0_3;
  assign videoOut_payload_frame_line_pixel_0_1_0 = pixelOut_payload_frame_line_pixel_1_0_0;
  assign videoOut_payload_frame_line_pixel_0_1_1 = pixelOut_payload_frame_line_pixel_1_0_1;
  assign videoOut_payload_frame_line_pixel_0_1_2 = pixelOut_payload_frame_line_pixel_1_0_2;
  assign videoOut_payload_frame_line_pixel_0_1_3 = pixelOut_payload_frame_line_pixel_1_0_3;
  assign videoOut_payload_frame_line_pixel_0_2_0 = pixelOut_payload_frame_line_pixel_2_0_0;
  assign videoOut_payload_frame_line_pixel_0_2_1 = pixelOut_payload_frame_line_pixel_2_0_1;
  assign videoOut_payload_frame_line_pixel_0_2_2 = pixelOut_payload_frame_line_pixel_2_0_2;
  assign videoOut_payload_frame_line_pixel_0_2_3 = pixelOut_payload_frame_line_pixel_2_0_3;
  assign videoOut_payload_frame_line_pixel_1_0_0 = pixelOut_payload_frame_line_pixel_0_1_0;
  assign videoOut_payload_frame_line_pixel_1_0_1 = pixelOut_payload_frame_line_pixel_0_1_1;
  assign videoOut_payload_frame_line_pixel_1_0_2 = pixelOut_payload_frame_line_pixel_0_1_2;
  assign videoOut_payload_frame_line_pixel_1_0_3 = pixelOut_payload_frame_line_pixel_0_1_3;
  assign videoOut_payload_frame_line_pixel_1_1_0 = pixelOut_payload_frame_line_pixel_1_1_0;
  assign videoOut_payload_frame_line_pixel_1_1_1 = pixelOut_payload_frame_line_pixel_1_1_1;
  assign videoOut_payload_frame_line_pixel_1_1_2 = pixelOut_payload_frame_line_pixel_1_1_2;
  assign videoOut_payload_frame_line_pixel_1_1_3 = pixelOut_payload_frame_line_pixel_1_1_3;
  assign videoOut_payload_frame_line_pixel_1_2_0 = pixelOut_payload_frame_line_pixel_2_1_0;
  assign videoOut_payload_frame_line_pixel_1_2_1 = pixelOut_payload_frame_line_pixel_2_1_1;
  assign videoOut_payload_frame_line_pixel_1_2_2 = pixelOut_payload_frame_line_pixel_2_1_2;
  assign videoOut_payload_frame_line_pixel_1_2_3 = pixelOut_payload_frame_line_pixel_2_1_3;
  assign videoOut_payload_frame_line_pixel_2_0_0 = pixelOut_payload_frame_line_pixel_0_2_0;
  assign videoOut_payload_frame_line_pixel_2_0_1 = pixelOut_payload_frame_line_pixel_0_2_1;
  assign videoOut_payload_frame_line_pixel_2_0_2 = pixelOut_payload_frame_line_pixel_0_2_2;
  assign videoOut_payload_frame_line_pixel_2_0_3 = pixelOut_payload_frame_line_pixel_0_2_3;
  assign videoOut_payload_frame_line_pixel_2_1_0 = pixelOut_payload_frame_line_pixel_1_2_0;
  assign videoOut_payload_frame_line_pixel_2_1_1 = pixelOut_payload_frame_line_pixel_1_2_1;
  assign videoOut_payload_frame_line_pixel_2_1_2 = pixelOut_payload_frame_line_pixel_1_2_2;
  assign videoOut_payload_frame_line_pixel_2_1_3 = pixelOut_payload_frame_line_pixel_1_2_3;
  assign videoOut_payload_frame_line_pixel_2_2_0 = pixelOut_payload_frame_line_pixel_2_2_0;
  assign videoOut_payload_frame_line_pixel_2_2_1 = pixelOut_payload_frame_line_pixel_2_2_1;
  assign videoOut_payload_frame_line_pixel_2_2_2 = pixelOut_payload_frame_line_pixel_2_2_2;
  assign videoOut_payload_frame_line_pixel_2_2_3 = pixelOut_payload_frame_line_pixel_2_2_3;
  always @(posedge clk) begin
    if(reset) begin
      pixel_videoOut_rValid <= 1'b0;
      line_videoOut_rValid <= 1'b0;
      line_videoOut_m2sPipe_rValid <= 1'b0;
    end else begin
      if(pixel_videoOut_ready) begin
        pixel_videoOut_rValid <= pixel_videoOut_valid;
      end
      if(line_videoOut_ready) begin
        line_videoOut_rValid <= line_videoOut_valid;
      end
      if(line_videoOut_m2sPipe_valid) begin
        line_videoOut_m2sPipe_rValid <= 1'b1;
      end
      if(line_videoOut_m2sPipe_s2mPipe_ready) begin
        line_videoOut_m2sPipe_rValid <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(pixel_videoOut_ready) begin
      pixel_videoOut_rData_frame_line_pixel_0_0_0 <= pixel_videoOut_payload_frame_line_pixel_0_0_0;
      pixel_videoOut_rData_frame_line_pixel_0_0_1 <= pixel_videoOut_payload_frame_line_pixel_0_0_1;
      pixel_videoOut_rData_frame_line_pixel_0_0_2 <= pixel_videoOut_payload_frame_line_pixel_0_0_2;
      pixel_videoOut_rData_frame_line_pixel_0_0_3 <= pixel_videoOut_payload_frame_line_pixel_0_0_3;
      pixel_videoOut_rData_frame_line_pixel_0_1_0 <= pixel_videoOut_payload_frame_line_pixel_0_1_0;
      pixel_videoOut_rData_frame_line_pixel_0_1_1 <= pixel_videoOut_payload_frame_line_pixel_0_1_1;
      pixel_videoOut_rData_frame_line_pixel_0_1_2 <= pixel_videoOut_payload_frame_line_pixel_0_1_2;
      pixel_videoOut_rData_frame_line_pixel_0_1_3 <= pixel_videoOut_payload_frame_line_pixel_0_1_3;
      pixel_videoOut_rData_frame_line_pixel_0_2_0 <= pixel_videoOut_payload_frame_line_pixel_0_2_0;
      pixel_videoOut_rData_frame_line_pixel_0_2_1 <= pixel_videoOut_payload_frame_line_pixel_0_2_1;
      pixel_videoOut_rData_frame_line_pixel_0_2_2 <= pixel_videoOut_payload_frame_line_pixel_0_2_2;
      pixel_videoOut_rData_frame_line_pixel_0_2_3 <= pixel_videoOut_payload_frame_line_pixel_0_2_3;
      pixel_videoOut_rData_frame_line_pixel_1_0_0 <= pixel_videoOut_payload_frame_line_pixel_1_0_0;
      pixel_videoOut_rData_frame_line_pixel_1_0_1 <= pixel_videoOut_payload_frame_line_pixel_1_0_1;
      pixel_videoOut_rData_frame_line_pixel_1_0_2 <= pixel_videoOut_payload_frame_line_pixel_1_0_2;
      pixel_videoOut_rData_frame_line_pixel_1_0_3 <= pixel_videoOut_payload_frame_line_pixel_1_0_3;
      pixel_videoOut_rData_frame_line_pixel_1_1_0 <= pixel_videoOut_payload_frame_line_pixel_1_1_0;
      pixel_videoOut_rData_frame_line_pixel_1_1_1 <= pixel_videoOut_payload_frame_line_pixel_1_1_1;
      pixel_videoOut_rData_frame_line_pixel_1_1_2 <= pixel_videoOut_payload_frame_line_pixel_1_1_2;
      pixel_videoOut_rData_frame_line_pixel_1_1_3 <= pixel_videoOut_payload_frame_line_pixel_1_1_3;
      pixel_videoOut_rData_frame_line_pixel_1_2_0 <= pixel_videoOut_payload_frame_line_pixel_1_2_0;
      pixel_videoOut_rData_frame_line_pixel_1_2_1 <= pixel_videoOut_payload_frame_line_pixel_1_2_1;
      pixel_videoOut_rData_frame_line_pixel_1_2_2 <= pixel_videoOut_payload_frame_line_pixel_1_2_2;
      pixel_videoOut_rData_frame_line_pixel_1_2_3 <= pixel_videoOut_payload_frame_line_pixel_1_2_3;
      pixel_videoOut_rData_frame_line_pixel_2_0_0 <= pixel_videoOut_payload_frame_line_pixel_2_0_0;
      pixel_videoOut_rData_frame_line_pixel_2_0_1 <= pixel_videoOut_payload_frame_line_pixel_2_0_1;
      pixel_videoOut_rData_frame_line_pixel_2_0_2 <= pixel_videoOut_payload_frame_line_pixel_2_0_2;
      pixel_videoOut_rData_frame_line_pixel_2_0_3 <= pixel_videoOut_payload_frame_line_pixel_2_0_3;
      pixel_videoOut_rData_frame_line_pixel_2_1_0 <= pixel_videoOut_payload_frame_line_pixel_2_1_0;
      pixel_videoOut_rData_frame_line_pixel_2_1_1 <= pixel_videoOut_payload_frame_line_pixel_2_1_1;
      pixel_videoOut_rData_frame_line_pixel_2_1_2 <= pixel_videoOut_payload_frame_line_pixel_2_1_2;
      pixel_videoOut_rData_frame_line_pixel_2_1_3 <= pixel_videoOut_payload_frame_line_pixel_2_1_3;
      pixel_videoOut_rData_frame_line_pixel_2_2_0 <= pixel_videoOut_payload_frame_line_pixel_2_2_0;
      pixel_videoOut_rData_frame_line_pixel_2_2_1 <= pixel_videoOut_payload_frame_line_pixel_2_2_1;
      pixel_videoOut_rData_frame_line_pixel_2_2_2 <= pixel_videoOut_payload_frame_line_pixel_2_2_2;
      pixel_videoOut_rData_frame_line_pixel_2_2_3 <= pixel_videoOut_payload_frame_line_pixel_2_2_3;
      pixel_videoOut_rData_frame_line_endOfLine <= pixel_videoOut_payload_frame_line_endOfLine;
      pixel_videoOut_rData_frame_endOfFrame <= pixel_videoOut_payload_frame_endOfFrame;
      pixel_videoOut_rData_endOfPack <= pixel_videoOut_payload_endOfPack;
    end
    if(line_videoOut_ready) begin
      line_videoOut_rData_frame_line_pixel_0_0 <= line_videoOut_payload_frame_line_pixel_0_0;
      line_videoOut_rData_frame_line_pixel_0_1 <= line_videoOut_payload_frame_line_pixel_0_1;
      line_videoOut_rData_frame_line_pixel_0_2 <= line_videoOut_payload_frame_line_pixel_0_2;
      line_videoOut_rData_frame_line_pixel_0_3 <= line_videoOut_payload_frame_line_pixel_0_3;
      line_videoOut_rData_frame_line_pixel_1_0 <= line_videoOut_payload_frame_line_pixel_1_0;
      line_videoOut_rData_frame_line_pixel_1_1 <= line_videoOut_payload_frame_line_pixel_1_1;
      line_videoOut_rData_frame_line_pixel_1_2 <= line_videoOut_payload_frame_line_pixel_1_2;
      line_videoOut_rData_frame_line_pixel_1_3 <= line_videoOut_payload_frame_line_pixel_1_3;
      line_videoOut_rData_frame_line_pixel_2_0 <= line_videoOut_payload_frame_line_pixel_2_0;
      line_videoOut_rData_frame_line_pixel_2_1 <= line_videoOut_payload_frame_line_pixel_2_1;
      line_videoOut_rData_frame_line_pixel_2_2 <= line_videoOut_payload_frame_line_pixel_2_2;
      line_videoOut_rData_frame_line_pixel_2_3 <= line_videoOut_payload_frame_line_pixel_2_3;
      line_videoOut_rData_frame_line_endOfLine <= line_videoOut_payload_frame_line_endOfLine;
      line_videoOut_rData_frame_endOfFrame <= line_videoOut_payload_frame_endOfFrame;
      line_videoOut_rData_endOfPack <= line_videoOut_payload_endOfPack;
    end
    if(line_videoOut_m2sPipe_ready) begin
      line_videoOut_m2sPipe_rData_frame_line_pixel_0_0 <= line_videoOut_m2sPipe_payload_frame_line_pixel_0_0;
      line_videoOut_m2sPipe_rData_frame_line_pixel_0_1 <= line_videoOut_m2sPipe_payload_frame_line_pixel_0_1;
      line_videoOut_m2sPipe_rData_frame_line_pixel_0_2 <= line_videoOut_m2sPipe_payload_frame_line_pixel_0_2;
      line_videoOut_m2sPipe_rData_frame_line_pixel_0_3 <= line_videoOut_m2sPipe_payload_frame_line_pixel_0_3;
      line_videoOut_m2sPipe_rData_frame_line_pixel_1_0 <= line_videoOut_m2sPipe_payload_frame_line_pixel_1_0;
      line_videoOut_m2sPipe_rData_frame_line_pixel_1_1 <= line_videoOut_m2sPipe_payload_frame_line_pixel_1_1;
      line_videoOut_m2sPipe_rData_frame_line_pixel_1_2 <= line_videoOut_m2sPipe_payload_frame_line_pixel_1_2;
      line_videoOut_m2sPipe_rData_frame_line_pixel_1_3 <= line_videoOut_m2sPipe_payload_frame_line_pixel_1_3;
      line_videoOut_m2sPipe_rData_frame_line_pixel_2_0 <= line_videoOut_m2sPipe_payload_frame_line_pixel_2_0;
      line_videoOut_m2sPipe_rData_frame_line_pixel_2_1 <= line_videoOut_m2sPipe_payload_frame_line_pixel_2_1;
      line_videoOut_m2sPipe_rData_frame_line_pixel_2_2 <= line_videoOut_m2sPipe_payload_frame_line_pixel_2_2;
      line_videoOut_m2sPipe_rData_frame_line_pixel_2_3 <= line_videoOut_m2sPipe_payload_frame_line_pixel_2_3;
      line_videoOut_m2sPipe_rData_frame_line_endOfLine <= line_videoOut_m2sPipe_payload_frame_line_endOfLine;
      line_videoOut_m2sPipe_rData_frame_endOfFrame <= line_videoOut_m2sPipe_payload_frame_endOfFrame;
      line_videoOut_m2sPipe_rData_endOfPack <= line_videoOut_m2sPipe_payload_endOfPack;
    end
  end


endmodule

//StreamFifoHighPerf_2 replaced by StreamFifoHighPerf_2

module StreamFifoHighPerf_2 (
  input               push_valid,
  output              push_ready,
  input      [7:0]    push_payload_0_0_0_0,
  input      [7:0]    push_payload_0_0_0_1,
  input      [7:0]    push_payload_0_0_0_2,
  input      [7:0]    push_payload_0_0_0_3,
  input      [7:0]    push_payload_0_0_1_0,
  input      [7:0]    push_payload_0_0_1_1,
  input      [7:0]    push_payload_0_0_1_2,
  input      [7:0]    push_payload_0_0_1_3,
  input      [7:0]    push_payload_0_0_2_0,
  input      [7:0]    push_payload_0_0_2_1,
  input      [7:0]    push_payload_0_0_2_2,
  input      [7:0]    push_payload_0_0_2_3,
  input      [7:0]    push_payload_0_1_0_0,
  input      [7:0]    push_payload_0_1_0_1,
  input      [7:0]    push_payload_0_1_0_2,
  input      [7:0]    push_payload_0_1_0_3,
  input      [7:0]    push_payload_0_1_1_0,
  input      [7:0]    push_payload_0_1_1_1,
  input      [7:0]    push_payload_0_1_1_2,
  input      [7:0]    push_payload_0_1_1_3,
  input      [7:0]    push_payload_0_1_2_0,
  input      [7:0]    push_payload_0_1_2_1,
  input      [7:0]    push_payload_0_1_2_2,
  input      [7:0]    push_payload_0_1_2_3,
  input      [7:0]    push_payload_0_2_0_0,
  input      [7:0]    push_payload_0_2_0_1,
  input      [7:0]    push_payload_0_2_0_2,
  input      [7:0]    push_payload_0_2_0_3,
  input      [7:0]    push_payload_0_2_1_0,
  input      [7:0]    push_payload_0_2_1_1,
  input      [7:0]    push_payload_0_2_1_2,
  input      [7:0]    push_payload_0_2_1_3,
  input      [7:0]    push_payload_0_2_2_0,
  input      [7:0]    push_payload_0_2_2_1,
  input      [7:0]    push_payload_0_2_2_2,
  input      [7:0]    push_payload_0_2_2_3,
  input      [7:0]    push_payload_1_0_0_0,
  input      [7:0]    push_payload_1_0_0_1,
  input      [7:0]    push_payload_1_0_0_2,
  input      [7:0]    push_payload_1_0_0_3,
  input      [7:0]    push_payload_1_0_1_0,
  input      [7:0]    push_payload_1_0_1_1,
  input      [7:0]    push_payload_1_0_1_2,
  input      [7:0]    push_payload_1_0_1_3,
  input      [7:0]    push_payload_1_0_2_0,
  input      [7:0]    push_payload_1_0_2_1,
  input      [7:0]    push_payload_1_0_2_2,
  input      [7:0]    push_payload_1_0_2_3,
  input      [7:0]    push_payload_1_1_0_0,
  input      [7:0]    push_payload_1_1_0_1,
  input      [7:0]    push_payload_1_1_0_2,
  input      [7:0]    push_payload_1_1_0_3,
  input      [7:0]    push_payload_1_1_1_0,
  input      [7:0]    push_payload_1_1_1_1,
  input      [7:0]    push_payload_1_1_1_2,
  input      [7:0]    push_payload_1_1_1_3,
  input      [7:0]    push_payload_1_1_2_0,
  input      [7:0]    push_payload_1_1_2_1,
  input      [7:0]    push_payload_1_1_2_2,
  input      [7:0]    push_payload_1_1_2_3,
  input      [7:0]    push_payload_1_2_0_0,
  input      [7:0]    push_payload_1_2_0_1,
  input      [7:0]    push_payload_1_2_0_2,
  input      [7:0]    push_payload_1_2_0_3,
  input      [7:0]    push_payload_1_2_1_0,
  input      [7:0]    push_payload_1_2_1_1,
  input      [7:0]    push_payload_1_2_1_2,
  input      [7:0]    push_payload_1_2_1_3,
  input      [7:0]    push_payload_1_2_2_0,
  input      [7:0]    push_payload_1_2_2_1,
  input      [7:0]    push_payload_1_2_2_2,
  input      [7:0]    push_payload_1_2_2_3,
  output              pop_valid,
  input               pop_ready,
  output     [7:0]    pop_payload_0_0_0_0,
  output     [7:0]    pop_payload_0_0_0_1,
  output     [7:0]    pop_payload_0_0_0_2,
  output     [7:0]    pop_payload_0_0_0_3,
  output     [7:0]    pop_payload_0_0_1_0,
  output     [7:0]    pop_payload_0_0_1_1,
  output     [7:0]    pop_payload_0_0_1_2,
  output     [7:0]    pop_payload_0_0_1_3,
  output     [7:0]    pop_payload_0_0_2_0,
  output     [7:0]    pop_payload_0_0_2_1,
  output     [7:0]    pop_payload_0_0_2_2,
  output     [7:0]    pop_payload_0_0_2_3,
  output     [7:0]    pop_payload_0_1_0_0,
  output     [7:0]    pop_payload_0_1_0_1,
  output     [7:0]    pop_payload_0_1_0_2,
  output     [7:0]    pop_payload_0_1_0_3,
  output     [7:0]    pop_payload_0_1_1_0,
  output     [7:0]    pop_payload_0_1_1_1,
  output     [7:0]    pop_payload_0_1_1_2,
  output     [7:0]    pop_payload_0_1_1_3,
  output     [7:0]    pop_payload_0_1_2_0,
  output     [7:0]    pop_payload_0_1_2_1,
  output     [7:0]    pop_payload_0_1_2_2,
  output     [7:0]    pop_payload_0_1_2_3,
  output     [7:0]    pop_payload_0_2_0_0,
  output     [7:0]    pop_payload_0_2_0_1,
  output     [7:0]    pop_payload_0_2_0_2,
  output     [7:0]    pop_payload_0_2_0_3,
  output     [7:0]    pop_payload_0_2_1_0,
  output     [7:0]    pop_payload_0_2_1_1,
  output     [7:0]    pop_payload_0_2_1_2,
  output     [7:0]    pop_payload_0_2_1_3,
  output     [7:0]    pop_payload_0_2_2_0,
  output     [7:0]    pop_payload_0_2_2_1,
  output     [7:0]    pop_payload_0_2_2_2,
  output     [7:0]    pop_payload_0_2_2_3,
  output     [7:0]    pop_payload_1_0_0_0,
  output     [7:0]    pop_payload_1_0_0_1,
  output     [7:0]    pop_payload_1_0_0_2,
  output     [7:0]    pop_payload_1_0_0_3,
  output     [7:0]    pop_payload_1_0_1_0,
  output     [7:0]    pop_payload_1_0_1_1,
  output     [7:0]    pop_payload_1_0_1_2,
  output     [7:0]    pop_payload_1_0_1_3,
  output     [7:0]    pop_payload_1_0_2_0,
  output     [7:0]    pop_payload_1_0_2_1,
  output     [7:0]    pop_payload_1_0_2_2,
  output     [7:0]    pop_payload_1_0_2_3,
  output     [7:0]    pop_payload_1_1_0_0,
  output     [7:0]    pop_payload_1_1_0_1,
  output     [7:0]    pop_payload_1_1_0_2,
  output     [7:0]    pop_payload_1_1_0_3,
  output     [7:0]    pop_payload_1_1_1_0,
  output     [7:0]    pop_payload_1_1_1_1,
  output     [7:0]    pop_payload_1_1_1_2,
  output     [7:0]    pop_payload_1_1_1_3,
  output     [7:0]    pop_payload_1_1_2_0,
  output     [7:0]    pop_payload_1_1_2_1,
  output     [7:0]    pop_payload_1_1_2_2,
  output     [7:0]    pop_payload_1_1_2_3,
  output     [7:0]    pop_payload_1_2_0_0,
  output     [7:0]    pop_payload_1_2_0_1,
  output     [7:0]    pop_payload_1_2_0_2,
  output     [7:0]    pop_payload_1_2_0_3,
  output     [7:0]    pop_payload_1_2_1_0,
  output     [7:0]    pop_payload_1_2_1_1,
  output     [7:0]    pop_payload_1_2_1_2,
  output     [7:0]    pop_payload_1_2_1_3,
  output     [7:0]    pop_payload_1_2_2_0,
  output     [7:0]    pop_payload_1_2_2_1,
  output     [7:0]    pop_payload_1_2_2_2,
  output     [7:0]    pop_payload_1_2_2_3,
  input               flush,
  input               clk,
  input               reset
);

  reg        [575:0]  tmp_ram_port0;
  wire       [4:0]    tmp_pushPtr_valueNext;
  wire       [0:0]    tmp_pushPtr_valueNext_1;
  wire       [4:0]    tmp_popPtr_valueNext;
  wire       [0:0]    tmp_popPtr_valueNext_1;
  wire       [575:0]  tmp_ram_port;
  reg                 tmp_1;
  wire                popEvent_valid;
  reg                 popEvent_ready;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  reg        [4:0]    pushPtr_valueNext;
  reg        [4:0]    pushPtr_value;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  reg        [4:0]    popPtr_valueNext;
  reg        [4:0]    popPtr_value;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                pushing;
  wire                popping;
  wire                empty;
  wire                full;
  reg                 tmp_popEvent_valid;
  reg                 rValid;
  wire       [7:0]    rData_0_0_0_0;
  wire       [7:0]    rData_0_0_0_1;
  wire       [7:0]    rData_0_0_0_2;
  wire       [7:0]    rData_0_0_0_3;
  wire       [7:0]    rData_0_0_1_0;
  wire       [7:0]    rData_0_0_1_1;
  wire       [7:0]    rData_0_0_1_2;
  wire       [7:0]    rData_0_0_1_3;
  wire       [7:0]    rData_0_0_2_0;
  wire       [7:0]    rData_0_0_2_1;
  wire       [7:0]    rData_0_0_2_2;
  wire       [7:0]    rData_0_0_2_3;
  wire       [7:0]    rData_0_1_0_0;
  wire       [7:0]    rData_0_1_0_1;
  wire       [7:0]    rData_0_1_0_2;
  wire       [7:0]    rData_0_1_0_3;
  wire       [7:0]    rData_0_1_1_0;
  wire       [7:0]    rData_0_1_1_1;
  wire       [7:0]    rData_0_1_1_2;
  wire       [7:0]    rData_0_1_1_3;
  wire       [7:0]    rData_0_1_2_0;
  wire       [7:0]    rData_0_1_2_1;
  wire       [7:0]    rData_0_1_2_2;
  wire       [7:0]    rData_0_1_2_3;
  wire       [7:0]    rData_0_2_0_0;
  wire       [7:0]    rData_0_2_0_1;
  wire       [7:0]    rData_0_2_0_2;
  wire       [7:0]    rData_0_2_0_3;
  wire       [7:0]    rData_0_2_1_0;
  wire       [7:0]    rData_0_2_1_1;
  wire       [7:0]    rData_0_2_1_2;
  wire       [7:0]    rData_0_2_1_3;
  wire       [7:0]    rData_0_2_2_0;
  wire       [7:0]    rData_0_2_2_1;
  wire       [7:0]    rData_0_2_2_2;
  wire       [7:0]    rData_0_2_2_3;
  wire       [7:0]    rData_1_0_0_0;
  wire       [7:0]    rData_1_0_0_1;
  wire       [7:0]    rData_1_0_0_2;
  wire       [7:0]    rData_1_0_0_3;
  wire       [7:0]    rData_1_0_1_0;
  wire       [7:0]    rData_1_0_1_1;
  wire       [7:0]    rData_1_0_1_2;
  wire       [7:0]    rData_1_0_1_3;
  wire       [7:0]    rData_1_0_2_0;
  wire       [7:0]    rData_1_0_2_1;
  wire       [7:0]    rData_1_0_2_2;
  wire       [7:0]    rData_1_0_2_3;
  wire       [7:0]    rData_1_1_0_0;
  wire       [7:0]    rData_1_1_0_1;
  wire       [7:0]    rData_1_1_0_2;
  wire       [7:0]    rData_1_1_0_3;
  wire       [7:0]    rData_1_1_1_0;
  wire       [7:0]    rData_1_1_1_1;
  wire       [7:0]    rData_1_1_1_2;
  wire       [7:0]    rData_1_1_1_3;
  wire       [7:0]    rData_1_1_2_0;
  wire       [7:0]    rData_1_1_2_1;
  wire       [7:0]    rData_1_1_2_2;
  wire       [7:0]    rData_1_1_2_3;
  wire       [7:0]    rData_1_2_0_0;
  wire       [7:0]    rData_1_2_0_1;
  wire       [7:0]    rData_1_2_0_2;
  wire       [7:0]    rData_1_2_0_3;
  wire       [7:0]    rData_1_2_1_0;
  wire       [7:0]    rData_1_2_1_1;
  wire       [7:0]    rData_1_2_1_2;
  wire       [7:0]    rData_1_2_1_3;
  wire       [7:0]    rData_1_2_2_0;
  wire       [7:0]    rData_1_2_2_1;
  wire       [7:0]    rData_1_2_2_2;
  wire       [7:0]    rData_1_2_2_3;
  wire       [575:0]  tmp_rData_0_0_0_0;
  wire       [287:0]  tmp_rData_0_0_0_0_1;
  wire       [95:0]   tmp_rData_0_0_0_0_2;
  wire       [31:0]   tmp_rData_0_0_0_0_3;
  wire       [31:0]   tmp_rData_0_0_1_0;
  wire       [31:0]   tmp_rData_0_0_2_0;
  wire       [95:0]   tmp_rData_0_1_0_0;
  wire       [31:0]   tmp_rData_0_1_0_0_1;
  wire       [31:0]   tmp_rData_0_1_1_0;
  wire       [31:0]   tmp_rData_0_1_2_0;
  wire       [95:0]   tmp_rData_0_2_0_0;
  wire       [31:0]   tmp_rData_0_2_0_0_1;
  wire       [31:0]   tmp_rData_0_2_1_0;
  wire       [31:0]   tmp_rData_0_2_2_0;
  wire       [287:0]  tmp_rData_1_0_0_0;
  wire       [95:0]   tmp_rData_1_0_0_0_1;
  wire       [31:0]   tmp_rData_1_0_0_0_2;
  wire       [31:0]   tmp_rData_1_0_1_0;
  wire       [31:0]   tmp_rData_1_0_2_0;
  wire       [95:0]   tmp_rData_1_1_0_0;
  wire       [31:0]   tmp_rData_1_1_0_0_1;
  wire       [31:0]   tmp_rData_1_1_1_0;
  wire       [31:0]   tmp_rData_1_1_2_0;
  wire       [95:0]   tmp_rData_1_2_0_0;
  wire       [31:0]   tmp_rData_1_2_0_0_1;
  wire       [31:0]   tmp_rData_1_2_1_0;
  wire       [31:0]   tmp_rData_1_2_2_0;
  wire                when_StreamFifoHighPerf_l38;
  wire                when_StreamFifoHighPerf_l42;
  (* ram_style = "distributed" *) reg [575:0] ram [0:31];

  assign tmp_pushPtr_valueNext_1 = pushPtr_willIncrement;
  assign tmp_pushPtr_valueNext = {4'd0, tmp_pushPtr_valueNext_1};
  assign tmp_popPtr_valueNext_1 = popPtr_willIncrement;
  assign tmp_popPtr_valueNext = {4'd0, tmp_popPtr_valueNext_1};
  assign tmp_ram_port = {{{{push_payload_1_2_2_3,{push_payload_1_2_2_2,{push_payload_1_2_2_1,push_payload_1_2_2_0}}},{{push_payload_1_2_1_3,{push_payload_1_2_1_2,{push_payload_1_2_1_1,push_payload_1_2_1_0}}},{push_payload_1_2_0_3,{push_payload_1_2_0_2,{push_payload_1_2_0_1,push_payload_1_2_0_0}}}}},{{{push_payload_1_1_2_3,{push_payload_1_1_2_2,{push_payload_1_1_2_1,push_payload_1_1_2_0}}},{{push_payload_1_1_1_3,{push_payload_1_1_1_2,{push_payload_1_1_1_1,push_payload_1_1_1_0}}},{push_payload_1_1_0_3,{push_payload_1_1_0_2,{push_payload_1_1_0_1,push_payload_1_1_0_0}}}}},{{push_payload_1_0_2_3,{push_payload_1_0_2_2,{push_payload_1_0_2_1,push_payload_1_0_2_0}}},{{push_payload_1_0_1_3,{push_payload_1_0_1_2,{push_payload_1_0_1_1,push_payload_1_0_1_0}}},{push_payload_1_0_0_3,{push_payload_1_0_0_2,{push_payload_1_0_0_1,push_payload_1_0_0_0}}}}}}},{{{push_payload_0_2_2_3,{push_payload_0_2_2_2,{push_payload_0_2_2_1,push_payload_0_2_2_0}}},{{push_payload_0_2_1_3,{push_payload_0_2_1_2,{push_payload_0_2_1_1,push_payload_0_2_1_0}}},{push_payload_0_2_0_3,{push_payload_0_2_0_2,{push_payload_0_2_0_1,push_payload_0_2_0_0}}}}},{{{push_payload_0_1_2_3,{push_payload_0_1_2_2,{push_payload_0_1_2_1,push_payload_0_1_2_0}}},{{push_payload_0_1_1_3,{push_payload_0_1_1_2,{push_payload_0_1_1_1,push_payload_0_1_1_0}}},{push_payload_0_1_0_3,{push_payload_0_1_0_2,{push_payload_0_1_0_1,push_payload_0_1_0_0}}}}},{{push_payload_0_0_2_3,{push_payload_0_0_2_2,{push_payload_0_0_2_1,push_payload_0_0_2_0}}},{{push_payload_0_0_1_3,{push_payload_0_0_1_2,{push_payload_0_0_1_1,push_payload_0_0_1_0}}},{push_payload_0_0_0_3,{push_payload_0_0_0_2,{push_payload_0_0_0_1,push_payload_0_0_0_0}}}}}}}};
  always @(posedge clk) begin
    if(popEvent_ready) begin
      tmp_ram_port0 <= ram[popPtr_value];
    end
  end

  always @(posedge clk) begin
    if(tmp_1) begin
      ram[pushPtr_value] <= tmp_ram_port;
    end
  end

  always @(*) begin
    tmp_1 = 1'b0;
    if(pushing) begin
      tmp_1 = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing) begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willClear = 1'b0;
    if(flush) begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = (pushPtr_value == 5'h1f);
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @(*) begin
    pushPtr_valueNext = (pushPtr_value + tmp_pushPtr_valueNext);
    if(pushPtr_willClear) begin
      pushPtr_valueNext = 5'h0;
    end
  end

  always @(*) begin
    popPtr_willIncrement = 1'b0;
    if(popping) begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    popPtr_willClear = 1'b0;
    if(flush) begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = (popPtr_value == 5'h1f);
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  always @(*) begin
    popPtr_valueNext = (popPtr_value + tmp_popPtr_valueNext);
    if(popPtr_willClear) begin
      popPtr_valueNext = 5'h0;
    end
  end

  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign pushing = (push_valid && push_ready);
  assign popping = (popEvent_valid && popEvent_ready);
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign push_ready = (! full);
  assign popEvent_valid = ((! empty) && (! (tmp_popEvent_valid && (! full))));
  assign tmp_rData_0_0_0_0 = tmp_ram_port0;
  assign tmp_rData_0_0_0_0_1 = tmp_rData_0_0_0_0[287 : 0];
  assign tmp_rData_0_0_0_0_2 = tmp_rData_0_0_0_0_1[95 : 0];
  assign tmp_rData_0_0_0_0_3 = tmp_rData_0_0_0_0_2[31 : 0];
  assign rData_0_0_0_0 = tmp_rData_0_0_0_0_3[7 : 0];
  assign rData_0_0_0_1 = tmp_rData_0_0_0_0_3[15 : 8];
  assign rData_0_0_0_2 = tmp_rData_0_0_0_0_3[23 : 16];
  assign rData_0_0_0_3 = tmp_rData_0_0_0_0_3[31 : 24];
  assign tmp_rData_0_0_1_0 = tmp_rData_0_0_0_0_2[63 : 32];
  assign rData_0_0_1_0 = tmp_rData_0_0_1_0[7 : 0];
  assign rData_0_0_1_1 = tmp_rData_0_0_1_0[15 : 8];
  assign rData_0_0_1_2 = tmp_rData_0_0_1_0[23 : 16];
  assign rData_0_0_1_3 = tmp_rData_0_0_1_0[31 : 24];
  assign tmp_rData_0_0_2_0 = tmp_rData_0_0_0_0_2[95 : 64];
  assign rData_0_0_2_0 = tmp_rData_0_0_2_0[7 : 0];
  assign rData_0_0_2_1 = tmp_rData_0_0_2_0[15 : 8];
  assign rData_0_0_2_2 = tmp_rData_0_0_2_0[23 : 16];
  assign rData_0_0_2_3 = tmp_rData_0_0_2_0[31 : 24];
  assign tmp_rData_0_1_0_0 = tmp_rData_0_0_0_0_1[191 : 96];
  assign tmp_rData_0_1_0_0_1 = tmp_rData_0_1_0_0[31 : 0];
  assign rData_0_1_0_0 = tmp_rData_0_1_0_0_1[7 : 0];
  assign rData_0_1_0_1 = tmp_rData_0_1_0_0_1[15 : 8];
  assign rData_0_1_0_2 = tmp_rData_0_1_0_0_1[23 : 16];
  assign rData_0_1_0_3 = tmp_rData_0_1_0_0_1[31 : 24];
  assign tmp_rData_0_1_1_0 = tmp_rData_0_1_0_0[63 : 32];
  assign rData_0_1_1_0 = tmp_rData_0_1_1_0[7 : 0];
  assign rData_0_1_1_1 = tmp_rData_0_1_1_0[15 : 8];
  assign rData_0_1_1_2 = tmp_rData_0_1_1_0[23 : 16];
  assign rData_0_1_1_3 = tmp_rData_0_1_1_0[31 : 24];
  assign tmp_rData_0_1_2_0 = tmp_rData_0_1_0_0[95 : 64];
  assign rData_0_1_2_0 = tmp_rData_0_1_2_0[7 : 0];
  assign rData_0_1_2_1 = tmp_rData_0_1_2_0[15 : 8];
  assign rData_0_1_2_2 = tmp_rData_0_1_2_0[23 : 16];
  assign rData_0_1_2_3 = tmp_rData_0_1_2_0[31 : 24];
  assign tmp_rData_0_2_0_0 = tmp_rData_0_0_0_0_1[287 : 192];
  assign tmp_rData_0_2_0_0_1 = tmp_rData_0_2_0_0[31 : 0];
  assign rData_0_2_0_0 = tmp_rData_0_2_0_0_1[7 : 0];
  assign rData_0_2_0_1 = tmp_rData_0_2_0_0_1[15 : 8];
  assign rData_0_2_0_2 = tmp_rData_0_2_0_0_1[23 : 16];
  assign rData_0_2_0_3 = tmp_rData_0_2_0_0_1[31 : 24];
  assign tmp_rData_0_2_1_0 = tmp_rData_0_2_0_0[63 : 32];
  assign rData_0_2_1_0 = tmp_rData_0_2_1_0[7 : 0];
  assign rData_0_2_1_1 = tmp_rData_0_2_1_0[15 : 8];
  assign rData_0_2_1_2 = tmp_rData_0_2_1_0[23 : 16];
  assign rData_0_2_1_3 = tmp_rData_0_2_1_0[31 : 24];
  assign tmp_rData_0_2_2_0 = tmp_rData_0_2_0_0[95 : 64];
  assign rData_0_2_2_0 = tmp_rData_0_2_2_0[7 : 0];
  assign rData_0_2_2_1 = tmp_rData_0_2_2_0[15 : 8];
  assign rData_0_2_2_2 = tmp_rData_0_2_2_0[23 : 16];
  assign rData_0_2_2_3 = tmp_rData_0_2_2_0[31 : 24];
  assign tmp_rData_1_0_0_0 = tmp_rData_0_0_0_0[575 : 288];
  assign tmp_rData_1_0_0_0_1 = tmp_rData_1_0_0_0[95 : 0];
  assign tmp_rData_1_0_0_0_2 = tmp_rData_1_0_0_0_1[31 : 0];
  assign rData_1_0_0_0 = tmp_rData_1_0_0_0_2[7 : 0];
  assign rData_1_0_0_1 = tmp_rData_1_0_0_0_2[15 : 8];
  assign rData_1_0_0_2 = tmp_rData_1_0_0_0_2[23 : 16];
  assign rData_1_0_0_3 = tmp_rData_1_0_0_0_2[31 : 24];
  assign tmp_rData_1_0_1_0 = tmp_rData_1_0_0_0_1[63 : 32];
  assign rData_1_0_1_0 = tmp_rData_1_0_1_0[7 : 0];
  assign rData_1_0_1_1 = tmp_rData_1_0_1_0[15 : 8];
  assign rData_1_0_1_2 = tmp_rData_1_0_1_0[23 : 16];
  assign rData_1_0_1_3 = tmp_rData_1_0_1_0[31 : 24];
  assign tmp_rData_1_0_2_0 = tmp_rData_1_0_0_0_1[95 : 64];
  assign rData_1_0_2_0 = tmp_rData_1_0_2_0[7 : 0];
  assign rData_1_0_2_1 = tmp_rData_1_0_2_0[15 : 8];
  assign rData_1_0_2_2 = tmp_rData_1_0_2_0[23 : 16];
  assign rData_1_0_2_3 = tmp_rData_1_0_2_0[31 : 24];
  assign tmp_rData_1_1_0_0 = tmp_rData_1_0_0_0[191 : 96];
  assign tmp_rData_1_1_0_0_1 = tmp_rData_1_1_0_0[31 : 0];
  assign rData_1_1_0_0 = tmp_rData_1_1_0_0_1[7 : 0];
  assign rData_1_1_0_1 = tmp_rData_1_1_0_0_1[15 : 8];
  assign rData_1_1_0_2 = tmp_rData_1_1_0_0_1[23 : 16];
  assign rData_1_1_0_3 = tmp_rData_1_1_0_0_1[31 : 24];
  assign tmp_rData_1_1_1_0 = tmp_rData_1_1_0_0[63 : 32];
  assign rData_1_1_1_0 = tmp_rData_1_1_1_0[7 : 0];
  assign rData_1_1_1_1 = tmp_rData_1_1_1_0[15 : 8];
  assign rData_1_1_1_2 = tmp_rData_1_1_1_0[23 : 16];
  assign rData_1_1_1_3 = tmp_rData_1_1_1_0[31 : 24];
  assign tmp_rData_1_1_2_0 = tmp_rData_1_1_0_0[95 : 64];
  assign rData_1_1_2_0 = tmp_rData_1_1_2_0[7 : 0];
  assign rData_1_1_2_1 = tmp_rData_1_1_2_0[15 : 8];
  assign rData_1_1_2_2 = tmp_rData_1_1_2_0[23 : 16];
  assign rData_1_1_2_3 = tmp_rData_1_1_2_0[31 : 24];
  assign tmp_rData_1_2_0_0 = tmp_rData_1_0_0_0[287 : 192];
  assign tmp_rData_1_2_0_0_1 = tmp_rData_1_2_0_0[31 : 0];
  assign rData_1_2_0_0 = tmp_rData_1_2_0_0_1[7 : 0];
  assign rData_1_2_0_1 = tmp_rData_1_2_0_0_1[15 : 8];
  assign rData_1_2_0_2 = tmp_rData_1_2_0_0_1[23 : 16];
  assign rData_1_2_0_3 = tmp_rData_1_2_0_0_1[31 : 24];
  assign tmp_rData_1_2_1_0 = tmp_rData_1_2_0_0[63 : 32];
  assign rData_1_2_1_0 = tmp_rData_1_2_1_0[7 : 0];
  assign rData_1_2_1_1 = tmp_rData_1_2_1_0[15 : 8];
  assign rData_1_2_1_2 = tmp_rData_1_2_1_0[23 : 16];
  assign rData_1_2_1_3 = tmp_rData_1_2_1_0[31 : 24];
  assign tmp_rData_1_2_2_0 = tmp_rData_1_2_0_0[95 : 64];
  assign rData_1_2_2_0 = tmp_rData_1_2_2_0[7 : 0];
  assign rData_1_2_2_1 = tmp_rData_1_2_2_0[15 : 8];
  assign rData_1_2_2_2 = tmp_rData_1_2_2_0[23 : 16];
  assign rData_1_2_2_3 = tmp_rData_1_2_2_0[31 : 24];
  always @(*) begin
    popEvent_ready = pop_ready;
    if(when_StreamFifoHighPerf_l38) begin
      popEvent_ready = 1'b1;
    end
  end

  assign when_StreamFifoHighPerf_l38 = (! rValid);
  assign pop_valid = rValid;
  assign pop_payload_0_0_0_0 = rData_0_0_0_0;
  assign pop_payload_0_0_0_1 = rData_0_0_0_1;
  assign pop_payload_0_0_0_2 = rData_0_0_0_2;
  assign pop_payload_0_0_0_3 = rData_0_0_0_3;
  assign pop_payload_0_0_1_0 = rData_0_0_1_0;
  assign pop_payload_0_0_1_1 = rData_0_0_1_1;
  assign pop_payload_0_0_1_2 = rData_0_0_1_2;
  assign pop_payload_0_0_1_3 = rData_0_0_1_3;
  assign pop_payload_0_0_2_0 = rData_0_0_2_0;
  assign pop_payload_0_0_2_1 = rData_0_0_2_1;
  assign pop_payload_0_0_2_2 = rData_0_0_2_2;
  assign pop_payload_0_0_2_3 = rData_0_0_2_3;
  assign pop_payload_0_1_0_0 = rData_0_1_0_0;
  assign pop_payload_0_1_0_1 = rData_0_1_0_1;
  assign pop_payload_0_1_0_2 = rData_0_1_0_2;
  assign pop_payload_0_1_0_3 = rData_0_1_0_3;
  assign pop_payload_0_1_1_0 = rData_0_1_1_0;
  assign pop_payload_0_1_1_1 = rData_0_1_1_1;
  assign pop_payload_0_1_1_2 = rData_0_1_1_2;
  assign pop_payload_0_1_1_3 = rData_0_1_1_3;
  assign pop_payload_0_1_2_0 = rData_0_1_2_0;
  assign pop_payload_0_1_2_1 = rData_0_1_2_1;
  assign pop_payload_0_1_2_2 = rData_0_1_2_2;
  assign pop_payload_0_1_2_3 = rData_0_1_2_3;
  assign pop_payload_0_2_0_0 = rData_0_2_0_0;
  assign pop_payload_0_2_0_1 = rData_0_2_0_1;
  assign pop_payload_0_2_0_2 = rData_0_2_0_2;
  assign pop_payload_0_2_0_3 = rData_0_2_0_3;
  assign pop_payload_0_2_1_0 = rData_0_2_1_0;
  assign pop_payload_0_2_1_1 = rData_0_2_1_1;
  assign pop_payload_0_2_1_2 = rData_0_2_1_2;
  assign pop_payload_0_2_1_3 = rData_0_2_1_3;
  assign pop_payload_0_2_2_0 = rData_0_2_2_0;
  assign pop_payload_0_2_2_1 = rData_0_2_2_1;
  assign pop_payload_0_2_2_2 = rData_0_2_2_2;
  assign pop_payload_0_2_2_3 = rData_0_2_2_3;
  assign pop_payload_1_0_0_0 = rData_1_0_0_0;
  assign pop_payload_1_0_0_1 = rData_1_0_0_1;
  assign pop_payload_1_0_0_2 = rData_1_0_0_2;
  assign pop_payload_1_0_0_3 = rData_1_0_0_3;
  assign pop_payload_1_0_1_0 = rData_1_0_1_0;
  assign pop_payload_1_0_1_1 = rData_1_0_1_1;
  assign pop_payload_1_0_1_2 = rData_1_0_1_2;
  assign pop_payload_1_0_1_3 = rData_1_0_1_3;
  assign pop_payload_1_0_2_0 = rData_1_0_2_0;
  assign pop_payload_1_0_2_1 = rData_1_0_2_1;
  assign pop_payload_1_0_2_2 = rData_1_0_2_2;
  assign pop_payload_1_0_2_3 = rData_1_0_2_3;
  assign pop_payload_1_1_0_0 = rData_1_1_0_0;
  assign pop_payload_1_1_0_1 = rData_1_1_0_1;
  assign pop_payload_1_1_0_2 = rData_1_1_0_2;
  assign pop_payload_1_1_0_3 = rData_1_1_0_3;
  assign pop_payload_1_1_1_0 = rData_1_1_1_0;
  assign pop_payload_1_1_1_1 = rData_1_1_1_1;
  assign pop_payload_1_1_1_2 = rData_1_1_1_2;
  assign pop_payload_1_1_1_3 = rData_1_1_1_3;
  assign pop_payload_1_1_2_0 = rData_1_1_2_0;
  assign pop_payload_1_1_2_1 = rData_1_1_2_1;
  assign pop_payload_1_1_2_2 = rData_1_1_2_2;
  assign pop_payload_1_1_2_3 = rData_1_1_2_3;
  assign pop_payload_1_2_0_0 = rData_1_2_0_0;
  assign pop_payload_1_2_0_1 = rData_1_2_0_1;
  assign pop_payload_1_2_0_2 = rData_1_2_0_2;
  assign pop_payload_1_2_0_3 = rData_1_2_0_3;
  assign pop_payload_1_2_1_0 = rData_1_2_1_0;
  assign pop_payload_1_2_1_1 = rData_1_2_1_1;
  assign pop_payload_1_2_1_2 = rData_1_2_1_2;
  assign pop_payload_1_2_1_3 = rData_1_2_1_3;
  assign pop_payload_1_2_2_0 = rData_1_2_2_0;
  assign pop_payload_1_2_2_1 = rData_1_2_2_1;
  assign pop_payload_1_2_2_2 = rData_1_2_2_2;
  assign pop_payload_1_2_2_3 = rData_1_2_2_3;
  assign when_StreamFifoHighPerf_l42 = (pushing != popping);
  always @(posedge clk) begin
    if(reset) begin
      pushPtr_value <= 5'h0;
      popPtr_value <= 5'h0;
      risingOccupancy <= 1'b0;
      tmp_popEvent_valid <= 1'b0;
      rValid <= 1'b0;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value <= popPtr_valueNext;
      tmp_popEvent_valid <= (popPtr_valueNext == pushPtr_value);
      if(popEvent_ready) begin
        rValid <= popEvent_valid;
      end
      if(when_StreamFifoHighPerf_l42) begin
        risingOccupancy <= pushing;
      end
      if(flush) begin
        rValid <= 1'b0;
        risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

//SInt48fixTo7_0_ROUNDTOINF replaced by SInt48fixTo7_0_ROUNDTOINF

//AMultB replaced by AMultB

//SInt48fixTo7_0_ROUNDTOINF replaced by SInt48fixTo7_0_ROUNDTOINF

//AMultB replaced by AMultB

//SInt48fixTo7_0_ROUNDTOINF replaced by SInt48fixTo7_0_ROUNDTOINF

//AMultB replaced by AMultB

module SInt48fixTo7_0_ROUNDTOINF (
  input      [47:0]   din,
  output     [7:0]    dout
);

  wire       [40:0]   tmp_when_SInt_l131;
  wire       [39:0]   tmp_when_SInt_l137;
  reg        [7:0]    tmp_dout;
  wire                when_SInt_l130;
  wire                when_SInt_l131;
  wire                when_SInt_l137;

  assign tmp_when_SInt_l131 = din[47 : 7];
  assign tmp_when_SInt_l137 = din[46 : 7];
  assign when_SInt_l130 = din[47];
  assign when_SInt_l131 = (! (&tmp_when_SInt_l131));
  always @(*) begin
    if(when_SInt_l130) begin
      if(when_SInt_l131) begin
        tmp_dout = 8'h80;
      end else begin
        tmp_dout = din[7 : 0];
      end
    end else begin
      if(when_SInt_l137) begin
        tmp_dout = 8'h7f;
      end else begin
        tmp_dout = din[7 : 0];
      end
    end
  end

  assign when_SInt_l137 = (|tmp_when_SInt_l137);
  assign dout = tmp_dout;

endmodule

module AMultB (
  input      [29:0]   A,
  input      [17:0]   B,
  output     [47:0]   P,
  input               CEs_0,
  input               CEs_1,
  input               CEs_2,
  input               CEs_3,
  input               clk
);

  wire       [29:0]   dSP48E1_1_ACOUT;
  wire       [17:0]   dSP48E1_1_BCOUT;
  wire       [47:0]   dSP48E1_1_PCOUT;
  wire       [0:0]    dSP48E1_1_CARRYCASCOUT;
  wire       [0:0]    dSP48E1_1_MULTSIGNOUT;
  wire       [47:0]   dSP48E1_1_P;
  wire       [3:0]    dSP48E1_1_CARRYOUT;

  DSP48E1 #(
    .A_INPUT("DIRECT"),
    .B_INPUT("DIRECT"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(2),
    .BREG(2),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(1),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(1),
    .OPMODEREG(1),
    .ALUMODEREG(1) 
  ) dSP48E1_1 (
    .CLK              (clk                      ), //i
    .ALUMODE          (4'b0000                  ), //i
    .INMODE           (5'h0                     ), //i
    .OPMODE           (7'h05                    ), //i
    .CARRYINSEL       (3'b000                   ), //i
    .ACIN             (30'h0                    ), //i
    .BCIN             (18'h0                    ), //i
    .PCIN             (48'h0                    ), //i
    .CARRYCASCIN      (1'b0                     ), //i
    .MULTSIGNIN       (1'b0                     ), //i
    .ACOUT            (dSP48E1_1_ACOUT[29:0]    ), //o
    .BCOUT            (dSP48E1_1_BCOUT[17:0]    ), //o
    .PCOUT            (dSP48E1_1_PCOUT[47:0]    ), //o
    .CARRYCASCOUT     (dSP48E1_1_CARRYCASCOUT   ), //o
    .MULTSIGNOUT      (dSP48E1_1_MULTSIGNOUT    ), //o
    .CEA1             (CEs_0                    ), //i
    .CEA2             (CEs_1                    ), //i
    .CEB1             (CEs_0                    ), //i
    .CEB2             (CEs_1                    ), //i
    .CEC              (1'b0                     ), //i
    .CED              (1'b0                     ), //i
    .CEAD             (1'b0                     ), //i
    .CEM              (CEs_2                    ), //i
    .CEP              (CEs_3                    ), //i
    .CECARRYIN        (1'b0                     ), //i
    .CECTRL           (1'b0                     ), //i
    .CEINMODE         (1'b0                     ), //i
    .CEALUMODE        (1'b0                     ), //i
    .RSTA             (1'b0                     ), //i
    .RSTB             (1'b0                     ), //i
    .RSTC             (1'b0                     ), //i
    .RSTD             (1'b0                     ), //i
    .RSTM             (1'b0                     ), //i
    .RSTP             (1'b0                     ), //i
    .RSTALLCARRYIN    (1'b0                     ), //i
    .RSTCTRL          (1'b0                     ), //i
    .RSTINMODE        (1'b0                     ), //i
    .RSTALUMODE       (1'b0                     ), //i
    .A                (A[29:0]                  ), //i
    .B                (B[17:0]                  ), //i
    .C                (48'h0                    ), //i
    .D                (25'h0                    ), //i
    .CARRYIN          (1'b0                     ), //i
    .P                (dSP48E1_1_P[47:0]        ), //o
    .CARRYOUT         (dSP48E1_1_CARRYOUT[3:0]  )  //o
  );
  assign P = dSP48E1_1_P;

endmodule

module VideoDownSample (
  input               videoIn_valid,
  output reg          videoIn_ready,
  input      [7:0]    videoIn_payload_frame_line_pixel_0,
  input      [7:0]    videoIn_payload_frame_line_pixel_1,
  input      [7:0]    videoIn_payload_frame_line_pixel_2,
  input      [7:0]    videoIn_payload_frame_line_pixel_3,
  input               videoIn_payload_frame_line_endOfLine,
  input               videoIn_payload_frame_endOfFrame,
  input               videoIn_payload_endOfPack,
  output              videoOut_valid,
  input               videoOut_ready,
  output     [7:0]    videoOut_payload_frame_line_pixel_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_3,
  output              videoOut_payload_frame_line_endOfLine,
  output              videoOut_payload_frame_endOfFrame,
  output              videoOut_payload_endOfPack,
  input               clk,
  input               reset
);

  reg                 pixCnt;
  reg                 lineCnt;
  wire                pixCntInv;
  wire                lineCntInv;
  wire                fire;
  wire                when_VideoDownSample_l25;
  wire                when_VideoDownSample_l26;
  wire                when_VideoDownSample_l27;
  wire                when_Stream_l408;
  reg                 videoIn_thrown_valid;
  wire                videoIn_thrown_ready;
  wire       [7:0]    videoIn_thrown_payload_frame_line_pixel_0;
  wire       [7:0]    videoIn_thrown_payload_frame_line_pixel_1;
  wire       [7:0]    videoIn_thrown_payload_frame_line_pixel_2;
  wire       [7:0]    videoIn_thrown_payload_frame_line_pixel_3;
  wire                videoIn_thrown_payload_frame_line_endOfLine;
  wire                videoIn_thrown_payload_frame_endOfFrame;
  wire                videoIn_thrown_payload_endOfPack;

  assign pixCntInv = (! pixCnt);
  assign lineCntInv = (! lineCnt);
  assign fire = (videoIn_valid && videoIn_ready);
  assign when_VideoDownSample_l25 = (fire && videoIn_payload_frame_line_endOfLine);
  assign when_VideoDownSample_l26 = (fire && videoIn_payload_frame_line_endOfLine);
  assign when_VideoDownSample_l27 = (fire && videoIn_payload_frame_endOfFrame);
  assign when_Stream_l408 = (pixCnt || lineCnt);
  always @(*) begin
    videoIn_thrown_valid = videoIn_valid;
    if(when_Stream_l408) begin
      videoIn_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    videoIn_ready = videoIn_thrown_ready;
    if(when_Stream_l408) begin
      videoIn_ready = 1'b1;
    end
  end

  assign videoIn_thrown_payload_frame_line_pixel_0 = videoIn_payload_frame_line_pixel_0;
  assign videoIn_thrown_payload_frame_line_pixel_1 = videoIn_payload_frame_line_pixel_1;
  assign videoIn_thrown_payload_frame_line_pixel_2 = videoIn_payload_frame_line_pixel_2;
  assign videoIn_thrown_payload_frame_line_pixel_3 = videoIn_payload_frame_line_pixel_3;
  assign videoIn_thrown_payload_frame_line_endOfLine = videoIn_payload_frame_line_endOfLine;
  assign videoIn_thrown_payload_frame_endOfFrame = videoIn_payload_frame_endOfFrame;
  assign videoIn_thrown_payload_endOfPack = videoIn_payload_endOfPack;
  assign videoOut_valid = videoIn_thrown_valid;
  assign videoIn_thrown_ready = videoOut_ready;
  assign videoOut_payload_frame_line_pixel_0 = videoIn_thrown_payload_frame_line_pixel_0;
  assign videoOut_payload_frame_line_pixel_1 = videoIn_thrown_payload_frame_line_pixel_1;
  assign videoOut_payload_frame_line_pixel_2 = videoIn_thrown_payload_frame_line_pixel_2;
  assign videoOut_payload_frame_line_pixel_3 = videoIn_thrown_payload_frame_line_pixel_3;
  assign videoOut_payload_frame_line_endOfLine = videoIn_thrown_payload_frame_line_endOfLine;
  assign videoOut_payload_frame_endOfFrame = videoIn_thrown_payload_frame_endOfFrame;
  assign videoOut_payload_endOfPack = videoIn_thrown_payload_endOfPack;
  always @(posedge clk) begin
    if(reset) begin
      pixCnt <= 1'b0;
      lineCnt <= 1'b0;
    end else begin
      if(fire) begin
        pixCnt <= pixCntInv;
      end
      if(when_VideoDownSample_l25) begin
        pixCnt <= 1'b0;
      end
      if(when_VideoDownSample_l26) begin
        lineCnt <= lineCntInv;
      end
      if(when_VideoDownSample_l27) begin
        lineCnt <= 1'b0;
      end
    end
  end


endmodule

module SlidingWindowValid (
  input               videoIn_valid,
  output              videoIn_ready,
  input      [7:0]    videoIn_payload_frame_line_pixel_0,
  input      [7:0]    videoIn_payload_frame_line_pixel_1,
  input      [7:0]    videoIn_payload_frame_line_pixel_2,
  input      [7:0]    videoIn_payload_frame_line_pixel_3,
  input               videoIn_payload_frame_line_endOfLine,
  input               videoIn_payload_frame_endOfFrame,
  input               videoIn_payload_endOfPack,
  output              videoOut_valid,
  input               videoOut_ready,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_3,
  output              videoOut_payload_frame_line_endOfLine,
  output              videoOut_payload_frame_endOfFrame,
  output              videoOut_payload_endOfPack,
  input               clk,
  input               reset
);

  reg                 line_videoOut_ready;
  reg                 pixel_videoOut_ready;
  wire                line_videoIn_ready;
  wire                line_videoOut_valid;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_0_0;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_0_1;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_0_2;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_0_3;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_1_0;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_1_1;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_1_2;
  wire       [7:0]    line_videoOut_payload_frame_line_pixel_1_3;
  wire                line_videoOut_payload_frame_line_endOfLine;
  wire                line_videoOut_payload_frame_endOfFrame;
  wire                line_videoOut_payload_endOfPack;
  wire                pixel_videoIn_ready;
  wire                pixel_videoOut_valid;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_0_0;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_0_1;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_0_2;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_0_3;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_1_0;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_1_1;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_1_2;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_0_1_3;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_0_0;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_0_1;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_0_2;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_0_3;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_1_0;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_1_1;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_1_2;
  wire       [7:0]    pixel_videoOut_payload_frame_line_pixel_1_1_3;
  wire                pixel_videoOut_payload_frame_line_endOfLine;
  wire                pixel_videoOut_payload_frame_endOfFrame;
  wire                pixel_videoOut_payload_endOfPack;
  wire                pixelOut_valid;
  wire                pixelOut_ready;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_0_0;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_0_1;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_0_2;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_0_3;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_1_0;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_1_1;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_1_2;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_0_1_3;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_0_0;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_0_1;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_0_2;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_0_3;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_1_0;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_1_1;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_1_2;
  wire       [7:0]    pixelOut_payload_frame_line_pixel_1_1_3;
  wire                pixelOut_payload_frame_line_endOfLine;
  wire                pixelOut_payload_frame_endOfFrame;
  wire                pixelOut_payload_endOfPack;
  reg                 pixel_videoOut_rValid;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_0_0;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_0_1;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_0_2;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_0_3;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_1_0;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_1_1;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_1_2;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_0_1_3;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_0_0;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_0_1;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_0_2;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_0_3;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_1_0;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_1_1;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_1_2;
  reg        [7:0]    pixel_videoOut_rData_frame_line_pixel_1_1_3;
  reg                 pixel_videoOut_rData_frame_line_endOfLine;
  reg                 pixel_videoOut_rData_frame_endOfFrame;
  reg                 pixel_videoOut_rData_endOfPack;
  wire                when_Stream_l342;
  wire                line_videoOut_m2sPipe_valid;
  wire                line_videoOut_m2sPipe_ready;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_0_0;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_0_1;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_0_2;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_0_3;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_1_0;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_1_1;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_1_2;
  wire       [7:0]    line_videoOut_m2sPipe_payload_frame_line_pixel_1_3;
  wire                line_videoOut_m2sPipe_payload_frame_line_endOfLine;
  wire                line_videoOut_m2sPipe_payload_frame_endOfFrame;
  wire                line_videoOut_m2sPipe_payload_endOfPack;
  reg                 line_videoOut_rValid;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_0_0;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_0_1;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_0_2;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_0_3;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_1_0;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_1_1;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_1_2;
  reg        [7:0]    line_videoOut_rData_frame_line_pixel_1_3;
  reg                 line_videoOut_rData_frame_line_endOfLine;
  reg                 line_videoOut_rData_frame_endOfFrame;
  reg                 line_videoOut_rData_endOfPack;
  wire                when_Stream_l342_1;

  LineBufferValid line (
    .videoIn_valid                            (videoIn_valid                                    ), //i
    .videoIn_ready                            (line_videoIn_ready                               ), //o
    .videoIn_payload_frame_line_pixel_0       (videoIn_payload_frame_line_pixel_0[7:0]          ), //i
    .videoIn_payload_frame_line_pixel_1       (videoIn_payload_frame_line_pixel_1[7:0]          ), //i
    .videoIn_payload_frame_line_pixel_2       (videoIn_payload_frame_line_pixel_2[7:0]          ), //i
    .videoIn_payload_frame_line_pixel_3       (videoIn_payload_frame_line_pixel_3[7:0]          ), //i
    .videoIn_payload_frame_line_endOfLine     (videoIn_payload_frame_line_endOfLine             ), //i
    .videoIn_payload_frame_endOfFrame         (videoIn_payload_frame_endOfFrame                 ), //i
    .videoIn_payload_endOfPack                (videoIn_payload_endOfPack                        ), //i
    .videoOut_valid                           (line_videoOut_valid                              ), //o
    .videoOut_ready                           (line_videoOut_ready                              ), //i
    .videoOut_payload_frame_line_pixel_0_0    (line_videoOut_payload_frame_line_pixel_0_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_1    (line_videoOut_payload_frame_line_pixel_0_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_2    (line_videoOut_payload_frame_line_pixel_0_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_0_3    (line_videoOut_payload_frame_line_pixel_0_3[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_0    (line_videoOut_payload_frame_line_pixel_1_0[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_1    (line_videoOut_payload_frame_line_pixel_1_1[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_2    (line_videoOut_payload_frame_line_pixel_1_2[7:0]  ), //o
    .videoOut_payload_frame_line_pixel_1_3    (line_videoOut_payload_frame_line_pixel_1_3[7:0]  ), //o
    .videoOut_payload_frame_line_endOfLine    (line_videoOut_payload_frame_line_endOfLine       ), //o
    .videoOut_payload_frame_endOfFrame        (line_videoOut_payload_frame_endOfFrame           ), //o
    .videoOut_payload_endOfPack               (line_videoOut_payload_endOfPack                  ), //o
    .clk                                      (clk                                              ), //i
    .reset                                    (reset                                            )  //i
  );
  PixelBufferValid pixel (
    .videoIn_valid                              (line_videoOut_m2sPipe_valid                              ), //i
    .videoIn_ready                              (pixel_videoIn_ready                                      ), //o
    .videoIn_payload_frame_line_pixel_0_0       (line_videoOut_m2sPipe_payload_frame_line_pixel_0_0[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_0_1       (line_videoOut_m2sPipe_payload_frame_line_pixel_0_1[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_0_2       (line_videoOut_m2sPipe_payload_frame_line_pixel_0_2[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_0_3       (line_videoOut_m2sPipe_payload_frame_line_pixel_0_3[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_1_0       (line_videoOut_m2sPipe_payload_frame_line_pixel_1_0[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_1_1       (line_videoOut_m2sPipe_payload_frame_line_pixel_1_1[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_1_2       (line_videoOut_m2sPipe_payload_frame_line_pixel_1_2[7:0]  ), //i
    .videoIn_payload_frame_line_pixel_1_3       (line_videoOut_m2sPipe_payload_frame_line_pixel_1_3[7:0]  ), //i
    .videoIn_payload_frame_line_endOfLine       (line_videoOut_m2sPipe_payload_frame_line_endOfLine       ), //i
    .videoIn_payload_frame_endOfFrame           (line_videoOut_m2sPipe_payload_frame_endOfFrame           ), //i
    .videoIn_payload_endOfPack                  (line_videoOut_m2sPipe_payload_endOfPack                  ), //i
    .videoOut_valid                             (pixel_videoOut_valid                                     ), //o
    .videoOut_ready                             (pixel_videoOut_ready                                     ), //i
    .videoOut_payload_frame_line_pixel_0_0_0    (pixel_videoOut_payload_frame_line_pixel_0_0_0[7:0]       ), //o
    .videoOut_payload_frame_line_pixel_0_0_1    (pixel_videoOut_payload_frame_line_pixel_0_0_1[7:0]       ), //o
    .videoOut_payload_frame_line_pixel_0_0_2    (pixel_videoOut_payload_frame_line_pixel_0_0_2[7:0]       ), //o
    .videoOut_payload_frame_line_pixel_0_0_3    (pixel_videoOut_payload_frame_line_pixel_0_0_3[7:0]       ), //o
    .videoOut_payload_frame_line_pixel_0_1_0    (pixel_videoOut_payload_frame_line_pixel_0_1_0[7:0]       ), //o
    .videoOut_payload_frame_line_pixel_0_1_1    (pixel_videoOut_payload_frame_line_pixel_0_1_1[7:0]       ), //o
    .videoOut_payload_frame_line_pixel_0_1_2    (pixel_videoOut_payload_frame_line_pixel_0_1_2[7:0]       ), //o
    .videoOut_payload_frame_line_pixel_0_1_3    (pixel_videoOut_payload_frame_line_pixel_0_1_3[7:0]       ), //o
    .videoOut_payload_frame_line_pixel_1_0_0    (pixel_videoOut_payload_frame_line_pixel_1_0_0[7:0]       ), //o
    .videoOut_payload_frame_line_pixel_1_0_1    (pixel_videoOut_payload_frame_line_pixel_1_0_1[7:0]       ), //o
    .videoOut_payload_frame_line_pixel_1_0_2    (pixel_videoOut_payload_frame_line_pixel_1_0_2[7:0]       ), //o
    .videoOut_payload_frame_line_pixel_1_0_3    (pixel_videoOut_payload_frame_line_pixel_1_0_3[7:0]       ), //o
    .videoOut_payload_frame_line_pixel_1_1_0    (pixel_videoOut_payload_frame_line_pixel_1_1_0[7:0]       ), //o
    .videoOut_payload_frame_line_pixel_1_1_1    (pixel_videoOut_payload_frame_line_pixel_1_1_1[7:0]       ), //o
    .videoOut_payload_frame_line_pixel_1_1_2    (pixel_videoOut_payload_frame_line_pixel_1_1_2[7:0]       ), //o
    .videoOut_payload_frame_line_pixel_1_1_3    (pixel_videoOut_payload_frame_line_pixel_1_1_3[7:0]       ), //o
    .videoOut_payload_frame_line_endOfLine      (pixel_videoOut_payload_frame_line_endOfLine              ), //o
    .videoOut_payload_frame_endOfFrame          (pixel_videoOut_payload_frame_endOfFrame                  ), //o
    .videoOut_payload_endOfPack                 (pixel_videoOut_payload_endOfPack                         ), //o
    .clk                                        (clk                                                      ), //i
    .reset                                      (reset                                                    )  //i
  );
  always @(*) begin
    pixel_videoOut_ready = pixelOut_ready;
    if(when_Stream_l342) begin
      pixel_videoOut_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! pixelOut_valid);
  assign pixelOut_valid = pixel_videoOut_rValid;
  assign pixelOut_payload_frame_line_pixel_0_0_0 = pixel_videoOut_rData_frame_line_pixel_0_0_0;
  assign pixelOut_payload_frame_line_pixel_0_0_1 = pixel_videoOut_rData_frame_line_pixel_0_0_1;
  assign pixelOut_payload_frame_line_pixel_0_0_2 = pixel_videoOut_rData_frame_line_pixel_0_0_2;
  assign pixelOut_payload_frame_line_pixel_0_0_3 = pixel_videoOut_rData_frame_line_pixel_0_0_3;
  assign pixelOut_payload_frame_line_pixel_0_1_0 = pixel_videoOut_rData_frame_line_pixel_0_1_0;
  assign pixelOut_payload_frame_line_pixel_0_1_1 = pixel_videoOut_rData_frame_line_pixel_0_1_1;
  assign pixelOut_payload_frame_line_pixel_0_1_2 = pixel_videoOut_rData_frame_line_pixel_0_1_2;
  assign pixelOut_payload_frame_line_pixel_0_1_3 = pixel_videoOut_rData_frame_line_pixel_0_1_3;
  assign pixelOut_payload_frame_line_pixel_1_0_0 = pixel_videoOut_rData_frame_line_pixel_1_0_0;
  assign pixelOut_payload_frame_line_pixel_1_0_1 = pixel_videoOut_rData_frame_line_pixel_1_0_1;
  assign pixelOut_payload_frame_line_pixel_1_0_2 = pixel_videoOut_rData_frame_line_pixel_1_0_2;
  assign pixelOut_payload_frame_line_pixel_1_0_3 = pixel_videoOut_rData_frame_line_pixel_1_0_3;
  assign pixelOut_payload_frame_line_pixel_1_1_0 = pixel_videoOut_rData_frame_line_pixel_1_1_0;
  assign pixelOut_payload_frame_line_pixel_1_1_1 = pixel_videoOut_rData_frame_line_pixel_1_1_1;
  assign pixelOut_payload_frame_line_pixel_1_1_2 = pixel_videoOut_rData_frame_line_pixel_1_1_2;
  assign pixelOut_payload_frame_line_pixel_1_1_3 = pixel_videoOut_rData_frame_line_pixel_1_1_3;
  assign pixelOut_payload_frame_line_endOfLine = pixel_videoOut_rData_frame_line_endOfLine;
  assign pixelOut_payload_frame_endOfFrame = pixel_videoOut_rData_frame_endOfFrame;
  assign pixelOut_payload_endOfPack = pixel_videoOut_rData_endOfPack;
  assign videoIn_ready = line_videoIn_ready;
  always @(*) begin
    line_videoOut_ready = line_videoOut_m2sPipe_ready;
    if(when_Stream_l342_1) begin
      line_videoOut_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! line_videoOut_m2sPipe_valid);
  assign line_videoOut_m2sPipe_valid = line_videoOut_rValid;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_0_0 = line_videoOut_rData_frame_line_pixel_0_0;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_0_1 = line_videoOut_rData_frame_line_pixel_0_1;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_0_2 = line_videoOut_rData_frame_line_pixel_0_2;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_0_3 = line_videoOut_rData_frame_line_pixel_0_3;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_1_0 = line_videoOut_rData_frame_line_pixel_1_0;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_1_1 = line_videoOut_rData_frame_line_pixel_1_1;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_1_2 = line_videoOut_rData_frame_line_pixel_1_2;
  assign line_videoOut_m2sPipe_payload_frame_line_pixel_1_3 = line_videoOut_rData_frame_line_pixel_1_3;
  assign line_videoOut_m2sPipe_payload_frame_line_endOfLine = line_videoOut_rData_frame_line_endOfLine;
  assign line_videoOut_m2sPipe_payload_frame_endOfFrame = line_videoOut_rData_frame_endOfFrame;
  assign line_videoOut_m2sPipe_payload_endOfPack = line_videoOut_rData_endOfPack;
  assign line_videoOut_m2sPipe_ready = pixel_videoIn_ready;
  assign videoOut_valid = pixelOut_valid;
  assign pixelOut_ready = videoOut_ready;
  assign videoOut_payload_endOfPack = pixelOut_payload_endOfPack;
  assign videoOut_payload_frame_endOfFrame = pixelOut_payload_frame_endOfFrame;
  assign videoOut_payload_frame_line_endOfLine = pixelOut_payload_frame_line_endOfLine;
  assign videoOut_payload_frame_line_pixel_0_0_0 = pixelOut_payload_frame_line_pixel_0_0_0;
  assign videoOut_payload_frame_line_pixel_0_0_1 = pixelOut_payload_frame_line_pixel_0_0_1;
  assign videoOut_payload_frame_line_pixel_0_0_2 = pixelOut_payload_frame_line_pixel_0_0_2;
  assign videoOut_payload_frame_line_pixel_0_0_3 = pixelOut_payload_frame_line_pixel_0_0_3;
  assign videoOut_payload_frame_line_pixel_0_1_0 = pixelOut_payload_frame_line_pixel_1_0_0;
  assign videoOut_payload_frame_line_pixel_0_1_1 = pixelOut_payload_frame_line_pixel_1_0_1;
  assign videoOut_payload_frame_line_pixel_0_1_2 = pixelOut_payload_frame_line_pixel_1_0_2;
  assign videoOut_payload_frame_line_pixel_0_1_3 = pixelOut_payload_frame_line_pixel_1_0_3;
  assign videoOut_payload_frame_line_pixel_1_0_0 = pixelOut_payload_frame_line_pixel_0_1_0;
  assign videoOut_payload_frame_line_pixel_1_0_1 = pixelOut_payload_frame_line_pixel_0_1_1;
  assign videoOut_payload_frame_line_pixel_1_0_2 = pixelOut_payload_frame_line_pixel_0_1_2;
  assign videoOut_payload_frame_line_pixel_1_0_3 = pixelOut_payload_frame_line_pixel_0_1_3;
  assign videoOut_payload_frame_line_pixel_1_1_0 = pixelOut_payload_frame_line_pixel_1_1_0;
  assign videoOut_payload_frame_line_pixel_1_1_1 = pixelOut_payload_frame_line_pixel_1_1_1;
  assign videoOut_payload_frame_line_pixel_1_1_2 = pixelOut_payload_frame_line_pixel_1_1_2;
  assign videoOut_payload_frame_line_pixel_1_1_3 = pixelOut_payload_frame_line_pixel_1_1_3;
  always @(posedge clk) begin
    if(reset) begin
      pixel_videoOut_rValid <= 1'b0;
      line_videoOut_rValid <= 1'b0;
    end else begin
      if(pixel_videoOut_ready) begin
        pixel_videoOut_rValid <= pixel_videoOut_valid;
      end
      if(line_videoOut_ready) begin
        line_videoOut_rValid <= line_videoOut_valid;
      end
    end
  end

  always @(posedge clk) begin
    if(pixel_videoOut_ready) begin
      pixel_videoOut_rData_frame_line_pixel_0_0_0 <= pixel_videoOut_payload_frame_line_pixel_0_0_0;
      pixel_videoOut_rData_frame_line_pixel_0_0_1 <= pixel_videoOut_payload_frame_line_pixel_0_0_1;
      pixel_videoOut_rData_frame_line_pixel_0_0_2 <= pixel_videoOut_payload_frame_line_pixel_0_0_2;
      pixel_videoOut_rData_frame_line_pixel_0_0_3 <= pixel_videoOut_payload_frame_line_pixel_0_0_3;
      pixel_videoOut_rData_frame_line_pixel_0_1_0 <= pixel_videoOut_payload_frame_line_pixel_0_1_0;
      pixel_videoOut_rData_frame_line_pixel_0_1_1 <= pixel_videoOut_payload_frame_line_pixel_0_1_1;
      pixel_videoOut_rData_frame_line_pixel_0_1_2 <= pixel_videoOut_payload_frame_line_pixel_0_1_2;
      pixel_videoOut_rData_frame_line_pixel_0_1_3 <= pixel_videoOut_payload_frame_line_pixel_0_1_3;
      pixel_videoOut_rData_frame_line_pixel_1_0_0 <= pixel_videoOut_payload_frame_line_pixel_1_0_0;
      pixel_videoOut_rData_frame_line_pixel_1_0_1 <= pixel_videoOut_payload_frame_line_pixel_1_0_1;
      pixel_videoOut_rData_frame_line_pixel_1_0_2 <= pixel_videoOut_payload_frame_line_pixel_1_0_2;
      pixel_videoOut_rData_frame_line_pixel_1_0_3 <= pixel_videoOut_payload_frame_line_pixel_1_0_3;
      pixel_videoOut_rData_frame_line_pixel_1_1_0 <= pixel_videoOut_payload_frame_line_pixel_1_1_0;
      pixel_videoOut_rData_frame_line_pixel_1_1_1 <= pixel_videoOut_payload_frame_line_pixel_1_1_1;
      pixel_videoOut_rData_frame_line_pixel_1_1_2 <= pixel_videoOut_payload_frame_line_pixel_1_1_2;
      pixel_videoOut_rData_frame_line_pixel_1_1_3 <= pixel_videoOut_payload_frame_line_pixel_1_1_3;
      pixel_videoOut_rData_frame_line_endOfLine <= pixel_videoOut_payload_frame_line_endOfLine;
      pixel_videoOut_rData_frame_endOfFrame <= pixel_videoOut_payload_frame_endOfFrame;
      pixel_videoOut_rData_endOfPack <= pixel_videoOut_payload_endOfPack;
    end
    if(line_videoOut_ready) begin
      line_videoOut_rData_frame_line_pixel_0_0 <= line_videoOut_payload_frame_line_pixel_0_0;
      line_videoOut_rData_frame_line_pixel_0_1 <= line_videoOut_payload_frame_line_pixel_0_1;
      line_videoOut_rData_frame_line_pixel_0_2 <= line_videoOut_payload_frame_line_pixel_0_2;
      line_videoOut_rData_frame_line_pixel_0_3 <= line_videoOut_payload_frame_line_pixel_0_3;
      line_videoOut_rData_frame_line_pixel_1_0 <= line_videoOut_payload_frame_line_pixel_1_0;
      line_videoOut_rData_frame_line_pixel_1_1 <= line_videoOut_payload_frame_line_pixel_1_1;
      line_videoOut_rData_frame_line_pixel_1_2 <= line_videoOut_payload_frame_line_pixel_1_2;
      line_videoOut_rData_frame_line_pixel_1_3 <= line_videoOut_payload_frame_line_pixel_1_3;
      line_videoOut_rData_frame_line_endOfLine <= line_videoOut_payload_frame_line_endOfLine;
      line_videoOut_rData_frame_endOfFrame <= line_videoOut_payload_frame_endOfFrame;
      line_videoOut_rData_endOfPack <= line_videoOut_payload_endOfPack;
    end
  end


endmodule

//VideoFrameHistory replaced by VideoFrameHistory

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//EventM2sPipes replaced by EventM2sPipes

module VideoFrameHistory (
  input      [7:0]    numberOfInputFrames,
  input      [7:0]    numberOfOutputFrames,
  input               videoIn_valid,
  output reg          videoIn_ready,
  input      [15:0]   videoIn_payload_frame_line_pixel_0,
  input      [15:0]   videoIn_payload_frame_line_pixel_1,
  input               videoIn_payload_frame_line_endOfLine,
  input               videoIn_payload_frame_endOfFrame,
  input               videoIn_payload_endOfPack,
  output              videoOut_valid,
  input               videoOut_ready,
  output     [23:0]   videoOut_payload_frame_line_pixel_0,
  output     [23:0]   videoOut_payload_frame_line_pixel_1,
  output              videoOut_payload_frame_line_endOfLine,
  output              videoOut_payload_frame_endOfFrame,
  output              videoOut_payload_endOfPack,
  input               clk,
  input               reset
);

  reg        [47:0]   tmp_ram_port0;
  wire       [13:0]   tmp_inPixelCnt_valueNext;
  wire       [0:0]    tmp_inPixelCnt_valueNext_1;
  wire       [23:0]   tmp_prevData_0_1;
  wire       [23:0]   tmp_prevData_1;
  wire       [23:0]   tmp_postData_0;
  wire       [23:0]   tmp_postData_1;
  wire       [7:0]    tmp_frameCnt_valueNext;
  wire       [0:0]    tmp_frameCnt_valueNext_1;
  wire       [13:0]   tmp_outPixelCnt_valueNext;
  wire       [0:0]    tmp_outPixelCnt_valueNext_1;
  wire       [47:0]   tmp_ram_port;
  wire       [7:0]    tmp_packCnt_valueNext;
  wire       [0:0]    tmp_packCnt_valueNext_1;
  wire       [15:0]   inZero_0;
  wire       [15:0]   inZero_1;
  wire       [23:0]   outZero_0;
  wire       [23:0]   outZero_1;
  wire                videoInPipe_valid;
  wire                videoInPipe_ready;
  wire       [15:0]   videoInPipe_payload_frame_line_pixel_0;
  wire       [15:0]   videoInPipe_payload_frame_line_pixel_1;
  wire                videoInPipe_payload_frame_line_endOfLine;
  wire                videoInPipe_payload_frame_endOfFrame;
  wire                videoInPipe_payload_endOfPack;
  reg                 videoIn_rValid;
  reg        [15:0]   videoIn_rData_frame_line_pixel_0;
  reg        [15:0]   videoIn_rData_frame_line_pixel_1;
  reg                 videoIn_rData_frame_line_endOfLine;
  reg                 videoIn_rData_frame_endOfFrame;
  reg                 videoIn_rData_endOfPack;
  wire                when_Stream_l342;
  reg                 inPixelCnt_willIncrement;
  reg                 inPixelCnt_willClear;
  reg        [13:0]   inPixelCnt_valueNext;
  reg        [13:0]   inPixelCnt_value;
  wire                inPixelCnt_willOverflowIfInc;
  wire                inPixelCnt_willOverflow;
  wire                videoIn_fire;
  wire                when_VideoFrameHistory_l39;
  reg                 firstFrame;
  wire                videoInPipeFire;
  wire                when_VideoFrameHistory_l43;
  wire                when_VideoFrameHistory_l44;
  wire       [47:0]   tmp_prevData_0;
  wire       [23:0]   prevData_0;
  wire       [23:0]   prevData_1;
  wire       [23:0]   postData_0;
  wire       [23:0]   postData_1;
  wire                bridge_valid;
  reg                 bridge_ready;
  wire       [23:0]   bridge_payload_frame_line_pixel_0;
  wire       [23:0]   bridge_payload_frame_line_pixel_1;
  wire                bridge_payload_frame_line_endOfLine;
  wire                bridge_payload_frame_endOfFrame;
  wire                bridge_payload_endOfPack;
  wire                bridgePipe_valid;
  reg                 bridgePipe_ready;
  wire       [23:0]   bridgePipe_payload_frame_line_pixel_0;
  wire       [23:0]   bridgePipe_payload_frame_line_pixel_1;
  wire                bridgePipe_payload_frame_line_endOfLine;
  wire                bridgePipe_payload_frame_endOfFrame;
  wire                bridgePipe_payload_endOfPack;
  reg                 bridge_rValid;
  reg        [23:0]   bridge_rData_frame_line_pixel_0;
  reg        [23:0]   bridge_rData_frame_line_pixel_1;
  reg                 bridge_rData_frame_line_endOfLine;
  reg                 bridge_rData_frame_endOfFrame;
  reg                 bridge_rData_endOfPack;
  wire                when_Stream_l342_1;
  wire                bridgePipeFire;
  reg                 frameCnt_willIncrement;
  reg                 frameCnt_willClear;
  reg        [7:0]    frameCnt_valueNext;
  reg        [7:0]    frameCnt_value;
  wire                frameCnt_willOverflowIfInc;
  wire                frameCnt_willOverflow;
  wire                lastFrame;
  wire                when_VideoFrameHistory_l61;
  wire                when_VideoFrameHistory_l62;
  reg                 outPixelCnt_willIncrement;
  reg                 outPixelCnt_willClear;
  reg        [13:0]   outPixelCnt_valueNext;
  reg        [13:0]   outPixelCnt_value;
  wire                outPixelCnt_willOverflowIfInc;
  wire                outPixelCnt_willOverflow;
  wire                when_VideoFrameHistory_l66;
  reg                 packCnt_willIncrement;
  reg                 packCnt_willClear;
  reg        [7:0]    packCnt_valueNext;
  reg        [7:0]    packCnt_value;
  wire                packCnt_willOverflowIfInc;
  wire                packCnt_willOverflow;
  wire                lastPack;
  wire                when_VideoFrameHistory_l71;
  wire                when_VideoFrameHistory_l72;
  wire                when_Stream_l408;
  reg                 bridgePipe_thrown_valid;
  wire                bridgePipe_thrown_ready;
  wire       [23:0]   bridgePipe_thrown_payload_frame_line_pixel_0;
  wire       [23:0]   bridgePipe_thrown_payload_frame_line_pixel_1;
  wire                bridgePipe_thrown_payload_frame_line_endOfLine;
  wire                bridgePipe_thrown_payload_frame_endOfFrame;
  wire                bridgePipe_thrown_payload_endOfPack;
  reg [47:0] ram [0:16383];

  assign tmp_inPixelCnt_valueNext_1 = inPixelCnt_willIncrement;
  assign tmp_inPixelCnt_valueNext = {13'd0, tmp_inPixelCnt_valueNext_1};
  assign tmp_prevData_0_1 = tmp_prevData_0[23 : 0];
  assign tmp_prevData_1 = tmp_prevData_0[47 : 24];
  assign tmp_postData_0 = {{8{videoInPipe_payload_frame_line_pixel_0[15]}}, videoInPipe_payload_frame_line_pixel_0};
  assign tmp_postData_1 = {{8{videoInPipe_payload_frame_line_pixel_1[15]}}, videoInPipe_payload_frame_line_pixel_1};
  assign tmp_frameCnt_valueNext_1 = frameCnt_willIncrement;
  assign tmp_frameCnt_valueNext = {7'd0, tmp_frameCnt_valueNext_1};
  assign tmp_outPixelCnt_valueNext_1 = outPixelCnt_willIncrement;
  assign tmp_outPixelCnt_valueNext = {13'd0, tmp_outPixelCnt_valueNext_1};
  assign tmp_packCnt_valueNext_1 = packCnt_willIncrement;
  assign tmp_packCnt_valueNext = {7'd0, tmp_packCnt_valueNext_1};
  assign tmp_ram_port = {bridgePipe_payload_frame_line_pixel_1,bridgePipe_payload_frame_line_pixel_0};
  always @(posedge clk) begin
    if(videoIn_ready) begin
      tmp_ram_port0 <= ram[inPixelCnt_value];
    end
  end

  always @(posedge clk) begin
    if(bridgePipeFire) begin
      ram[outPixelCnt_value] <= tmp_ram_port;
    end
  end

  assign inZero_0 = 16'h0;
  assign inZero_1 = 16'h0;
  assign outZero_0 = 24'h0;
  assign outZero_1 = 24'h0;
  always @(*) begin
    videoIn_ready = videoInPipe_ready;
    if(when_Stream_l342) begin
      videoIn_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! videoInPipe_valid);
  assign videoInPipe_valid = videoIn_rValid;
  assign videoInPipe_payload_frame_line_pixel_0 = videoIn_rData_frame_line_pixel_0;
  assign videoInPipe_payload_frame_line_pixel_1 = videoIn_rData_frame_line_pixel_1;
  assign videoInPipe_payload_frame_line_endOfLine = videoIn_rData_frame_line_endOfLine;
  assign videoInPipe_payload_frame_endOfFrame = videoIn_rData_frame_endOfFrame;
  assign videoInPipe_payload_endOfPack = videoIn_rData_endOfPack;
  always @(*) begin
    inPixelCnt_willIncrement = 1'b0;
    if(videoIn_fire) begin
      inPixelCnt_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    inPixelCnt_willClear = 1'b0;
    if(when_VideoFrameHistory_l39) begin
      inPixelCnt_willClear = 1'b1;
    end
  end

  assign inPixelCnt_willOverflowIfInc = (inPixelCnt_value == 14'h3fff);
  assign inPixelCnt_willOverflow = (inPixelCnt_willOverflowIfInc && inPixelCnt_willIncrement);
  always @(*) begin
    inPixelCnt_valueNext = (inPixelCnt_value + tmp_inPixelCnt_valueNext);
    if(inPixelCnt_willClear) begin
      inPixelCnt_valueNext = 14'h0;
    end
  end

  assign videoIn_fire = (videoIn_valid && videoIn_ready);
  assign when_VideoFrameHistory_l39 = (inPixelCnt_willIncrement && videoIn_payload_frame_endOfFrame);
  assign videoInPipeFire = (videoInPipe_valid && videoInPipe_ready);
  assign when_VideoFrameHistory_l43 = (videoInPipe_payload_frame_endOfFrame && videoInPipeFire);
  assign when_VideoFrameHistory_l44 = (videoInPipe_payload_endOfPack && videoInPipeFire);
  assign tmp_prevData_0 = tmp_ram_port0;
  assign prevData_0 = (firstFrame ? outZero_0 : tmp_prevData_0_1);
  assign prevData_1 = (firstFrame ? outZero_1 : tmp_prevData_1);
  assign postData_0 = ($signed(tmp_postData_0) + $signed(prevData_0));
  assign postData_1 = ($signed(tmp_postData_1) + $signed(prevData_1));
  always @(*) begin
    bridge_ready = bridgePipe_ready;
    if(when_Stream_l342_1) begin
      bridge_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! bridgePipe_valid);
  assign bridgePipe_valid = bridge_rValid;
  assign bridgePipe_payload_frame_line_pixel_0 = bridge_rData_frame_line_pixel_0;
  assign bridgePipe_payload_frame_line_pixel_1 = bridge_rData_frame_line_pixel_1;
  assign bridgePipe_payload_frame_line_endOfLine = bridge_rData_frame_line_endOfLine;
  assign bridgePipe_payload_frame_endOfFrame = bridge_rData_frame_endOfFrame;
  assign bridgePipe_payload_endOfPack = bridge_rData_endOfPack;
  assign bridgePipeFire = (bridgePipe_valid && bridgePipe_ready);
  assign bridge_valid = videoInPipe_valid;
  assign videoInPipe_ready = bridge_ready;
  assign bridge_payload_endOfPack = videoInPipe_payload_endOfPack;
  assign bridge_payload_frame_endOfFrame = videoInPipe_payload_frame_endOfFrame;
  assign bridge_payload_frame_line_endOfLine = videoInPipe_payload_frame_line_endOfLine;
  assign bridge_payload_frame_line_pixel_0 = postData_0;
  assign bridge_payload_frame_line_pixel_1 = postData_1;
  always @(*) begin
    frameCnt_willIncrement = 1'b0;
    if(when_VideoFrameHistory_l61) begin
      frameCnt_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    frameCnt_willClear = 1'b0;
    if(when_VideoFrameHistory_l62) begin
      frameCnt_willClear = 1'b1;
    end
  end

  assign frameCnt_willOverflowIfInc = (frameCnt_value == 8'hff);
  assign frameCnt_willOverflow = (frameCnt_willOverflowIfInc && frameCnt_willIncrement);
  always @(*) begin
    frameCnt_valueNext = (frameCnt_value + tmp_frameCnt_valueNext);
    if(frameCnt_willClear) begin
      frameCnt_valueNext = 8'h0;
    end
  end

  assign lastFrame = (frameCnt_value == numberOfInputFrames);
  assign when_VideoFrameHistory_l61 = (bridgePipeFire && bridgePipe_payload_frame_endOfFrame);
  assign when_VideoFrameHistory_l62 = (frameCnt_willIncrement && lastFrame);
  always @(*) begin
    outPixelCnt_willIncrement = 1'b0;
    if(bridgePipeFire) begin
      outPixelCnt_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    outPixelCnt_willClear = 1'b0;
    if(when_VideoFrameHistory_l66) begin
      outPixelCnt_willClear = 1'b1;
    end
  end

  assign outPixelCnt_willOverflowIfInc = (outPixelCnt_value == 14'h3fff);
  assign outPixelCnt_willOverflow = (outPixelCnt_willOverflowIfInc && outPixelCnt_willIncrement);
  always @(*) begin
    outPixelCnt_valueNext = (outPixelCnt_value + tmp_outPixelCnt_valueNext);
    if(outPixelCnt_willClear) begin
      outPixelCnt_valueNext = 14'h0;
    end
  end

  assign when_VideoFrameHistory_l66 = (outPixelCnt_willIncrement && bridgePipe_payload_frame_endOfFrame);
  always @(*) begin
    packCnt_willIncrement = 1'b0;
    if(when_VideoFrameHistory_l71) begin
      packCnt_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    packCnt_willClear = 1'b0;
    if(when_VideoFrameHistory_l72) begin
      packCnt_willClear = 1'b1;
    end
  end

  assign packCnt_willOverflowIfInc = (packCnt_value == 8'hff);
  assign packCnt_willOverflow = (packCnt_willOverflowIfInc && packCnt_willIncrement);
  always @(*) begin
    packCnt_valueNext = (packCnt_value + tmp_packCnt_valueNext);
    if(packCnt_willClear) begin
      packCnt_valueNext = 8'h0;
    end
  end

  assign lastPack = (packCnt_value == numberOfOutputFrames);
  assign when_VideoFrameHistory_l71 = (bridgePipeFire && bridgePipe_payload_endOfPack);
  assign when_VideoFrameHistory_l72 = (packCnt_willIncrement && lastPack);
  assign when_Stream_l408 = (! lastFrame);
  always @(*) begin
    bridgePipe_thrown_valid = bridgePipe_valid;
    if(when_Stream_l408) begin
      bridgePipe_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    bridgePipe_ready = bridgePipe_thrown_ready;
    if(when_Stream_l408) begin
      bridgePipe_ready = 1'b1;
    end
  end

  assign bridgePipe_thrown_payload_frame_line_pixel_0 = bridgePipe_payload_frame_line_pixel_0;
  assign bridgePipe_thrown_payload_frame_line_pixel_1 = bridgePipe_payload_frame_line_pixel_1;
  assign bridgePipe_thrown_payload_frame_line_endOfLine = bridgePipe_payload_frame_line_endOfLine;
  assign bridgePipe_thrown_payload_frame_endOfFrame = bridgePipe_payload_frame_endOfFrame;
  assign bridgePipe_thrown_payload_endOfPack = bridgePipe_payload_endOfPack;
  assign videoOut_valid = bridgePipe_thrown_valid;
  assign bridgePipe_thrown_ready = videoOut_ready;
  assign videoOut_payload_endOfPack = (bridgePipe_payload_endOfPack && lastPack);
  assign videoOut_payload_frame_endOfFrame = bridgePipe_payload_frame_endOfFrame;
  assign videoOut_payload_frame_line_endOfLine = bridgePipe_payload_frame_line_endOfLine;
  assign videoOut_payload_frame_line_pixel_0 = bridgePipe_payload_frame_line_pixel_0;
  assign videoOut_payload_frame_line_pixel_1 = bridgePipe_payload_frame_line_pixel_1;
  always @(posedge clk) begin
    if(reset) begin
      videoIn_rValid <= 1'b0;
      inPixelCnt_value <= 14'h0;
      firstFrame <= 1'b1;
      bridge_rValid <= 1'b0;
      frameCnt_value <= 8'h0;
      outPixelCnt_value <= 14'h0;
      packCnt_value <= 8'h0;
    end else begin
      if(videoIn_ready) begin
        videoIn_rValid <= videoIn_valid;
      end
      inPixelCnt_value <= inPixelCnt_valueNext;
      if(when_VideoFrameHistory_l43) begin
        firstFrame <= 1'b0;
      end
      if(when_VideoFrameHistory_l44) begin
        firstFrame <= 1'b1;
      end
      if(bridge_ready) begin
        bridge_rValid <= bridge_valid;
      end
      frameCnt_value <= frameCnt_valueNext;
      outPixelCnt_value <= outPixelCnt_valueNext;
      packCnt_value <= packCnt_valueNext;
    end
  end

  always @(posedge clk) begin
    if(videoIn_ready) begin
      videoIn_rData_frame_line_pixel_0 <= videoIn_payload_frame_line_pixel_0;
      videoIn_rData_frame_line_pixel_1 <= videoIn_payload_frame_line_pixel_1;
      videoIn_rData_frame_line_endOfLine <= videoIn_payload_frame_line_endOfLine;
      videoIn_rData_frame_endOfFrame <= videoIn_payload_frame_endOfFrame;
      videoIn_rData_endOfPack <= videoIn_payload_endOfPack;
    end
    if(bridge_ready) begin
      bridge_rData_frame_line_pixel_0 <= bridge_payload_frame_line_pixel_0;
      bridge_rData_frame_line_pixel_1 <= bridge_payload_frame_line_pixel_1;
      bridge_rData_frame_line_endOfLine <= bridge_payload_frame_line_endOfLine;
      bridge_rData_frame_endOfFrame <= bridge_payload_frame_endOfFrame;
      bridge_rData_endOfPack <= bridge_payload_endOfPack;
    end
  end


endmodule

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

//SIMD2INT8 replaced by SIMD2INT8

module SIMD2INT8 (
  input      [7:0]    a,
  input      [7:0]    b,
  input      [7:0]    c,
  output     [15:0]   ab,
  output     [15:0]   ac,
  input               CEs_0,
  input               CEs_1,
  input               CEs_2,
  input               CEs_3,
  input               clk
);

  wire       [29:0]   mult_A;
  wire       [17:0]   mult_B;
  wire       [24:0]   mult_D;
  wire       [47:0]   mult_P;
  wire       [29:0]   tmp_A;
  wire       [17:0]   tmp_B;
  wire       [30:0]   tmp_ac_1;
  wire       [15:0]   tmp_ac;
  wire       [15:0]   tmp_ac_2;
  wire       [15:0]   ab_1;
  wire       [15:0]   ac_1;

  assign tmp_A = {{22{b[7]}}, b};
  assign tmp_B = {{10{a[7]}}, a};
  assign tmp_ac_1 = mult_P[47 : 17];
  assign tmp_ac = ($signed(ac_1) + $signed(tmp_ac_2));
  assign tmp_ac_2 = 16'h0001;
  APlusDMultB mult (
    .A        (mult_A[29:0]  ), //i
    .B        (mult_B[17:0]  ), //i
    .D        (mult_D[24:0]  ), //i
    .P        (mult_P[47:0]  ), //o
    .CEs_0    (CEs_0         ), //i
    .CEs_1    (CEs_1         ), //i
    .CEs_2    (CEs_2         ), //i
    .CEs_3    (CEs_3         ), //i
    .clk      (clk           )  //i
  );
  assign mult_A = tmp_A;
  assign mult_D = {c,17'h0};
  assign mult_B = tmp_B;
  assign ab_1 = mult_P[15 : 0];
  assign ac_1 = tmp_ac_1[15 : 0];
  assign ab = ab_1;
  assign ac = (ab_1[15] ? tmp_ac : ac_1);

endmodule

module EventM2sPipes (
  input               eventIn_valid,
  output              eventIn_ready,
  output              eventOut_valid,
  input               eventOut_ready,
  output              CEs_0,
  output              CEs_1,
  output              CEs_2,
  output              CEs_3,
  output              CEs_4,
  output              CEs_5,
  output              CEs_6,
  output              CEs_7,
  input               clk,
  input               reset
);

  wire                events_0_valid;
  reg                 events_0_ready;
  wire                events_1_valid;
  reg                 events_1_ready;
  wire                events_2_valid;
  reg                 events_2_ready;
  wire                events_3_valid;
  reg                 events_3_ready;
  wire                events_4_valid;
  reg                 events_4_ready;
  wire                events_5_valid;
  reg                 events_5_ready;
  wire                events_6_valid;
  reg                 events_6_ready;
  wire                events_7_valid;
  reg                 events_7_ready;
  wire                events_0_m2sPipe_valid;
  wire                events_0_m2sPipe_ready;
  reg                 events_0_rValid;
  wire                when_Stream_l342;
  wire                events_1_m2sPipe_valid;
  wire                events_1_m2sPipe_ready;
  reg                 events_1_rValid;
  wire                when_Stream_l342_1;
  wire                events_2_m2sPipe_valid;
  wire                events_2_m2sPipe_ready;
  reg                 events_2_rValid;
  wire                when_Stream_l342_2;
  wire                events_3_m2sPipe_valid;
  wire                events_3_m2sPipe_ready;
  reg                 events_3_rValid;
  wire                when_Stream_l342_3;
  wire                events_4_m2sPipe_valid;
  wire                events_4_m2sPipe_ready;
  reg                 events_4_rValid;
  wire                when_Stream_l342_4;
  wire                events_5_m2sPipe_valid;
  wire                events_5_m2sPipe_ready;
  reg                 events_5_rValid;
  wire                when_Stream_l342_5;
  wire                events_6_m2sPipe_valid;
  wire                events_6_m2sPipe_ready;
  reg                 events_6_rValid;
  wire                when_Stream_l342_6;
  wire                events_7_m2sPipe_valid;
  wire                events_7_m2sPipe_ready;
  reg                 events_7_rValid;
  wire                when_Stream_l342_7;

  assign CEs_0 = events_0_ready;
  assign CEs_1 = events_1_ready;
  assign CEs_2 = events_2_ready;
  assign CEs_3 = events_3_ready;
  assign CEs_4 = events_4_ready;
  assign CEs_5 = events_5_ready;
  assign CEs_6 = events_6_ready;
  assign CEs_7 = events_7_ready;
  assign events_0_valid = eventIn_valid;
  assign eventIn_ready = events_0_ready;
  always @(*) begin
    events_0_ready = events_0_m2sPipe_ready;
    if(when_Stream_l342) begin
      events_0_ready = 1'b1;
    end
  end

  assign when_Stream_l342 = (! events_0_m2sPipe_valid);
  assign events_0_m2sPipe_valid = events_0_rValid;
  assign events_1_valid = events_0_m2sPipe_valid;
  assign events_0_m2sPipe_ready = events_1_ready;
  always @(*) begin
    events_1_ready = events_1_m2sPipe_ready;
    if(when_Stream_l342_1) begin
      events_1_ready = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! events_1_m2sPipe_valid);
  assign events_1_m2sPipe_valid = events_1_rValid;
  assign events_2_valid = events_1_m2sPipe_valid;
  assign events_1_m2sPipe_ready = events_2_ready;
  always @(*) begin
    events_2_ready = events_2_m2sPipe_ready;
    if(when_Stream_l342_2) begin
      events_2_ready = 1'b1;
    end
  end

  assign when_Stream_l342_2 = (! events_2_m2sPipe_valid);
  assign events_2_m2sPipe_valid = events_2_rValid;
  assign events_3_valid = events_2_m2sPipe_valid;
  assign events_2_m2sPipe_ready = events_3_ready;
  always @(*) begin
    events_3_ready = events_3_m2sPipe_ready;
    if(when_Stream_l342_3) begin
      events_3_ready = 1'b1;
    end
  end

  assign when_Stream_l342_3 = (! events_3_m2sPipe_valid);
  assign events_3_m2sPipe_valid = events_3_rValid;
  assign events_4_valid = events_3_m2sPipe_valid;
  assign events_3_m2sPipe_ready = events_4_ready;
  always @(*) begin
    events_4_ready = events_4_m2sPipe_ready;
    if(when_Stream_l342_4) begin
      events_4_ready = 1'b1;
    end
  end

  assign when_Stream_l342_4 = (! events_4_m2sPipe_valid);
  assign events_4_m2sPipe_valid = events_4_rValid;
  assign events_5_valid = events_4_m2sPipe_valid;
  assign events_4_m2sPipe_ready = events_5_ready;
  always @(*) begin
    events_5_ready = events_5_m2sPipe_ready;
    if(when_Stream_l342_5) begin
      events_5_ready = 1'b1;
    end
  end

  assign when_Stream_l342_5 = (! events_5_m2sPipe_valid);
  assign events_5_m2sPipe_valid = events_5_rValid;
  assign events_6_valid = events_5_m2sPipe_valid;
  assign events_5_m2sPipe_ready = events_6_ready;
  always @(*) begin
    events_6_ready = events_6_m2sPipe_ready;
    if(when_Stream_l342_6) begin
      events_6_ready = 1'b1;
    end
  end

  assign when_Stream_l342_6 = (! events_6_m2sPipe_valid);
  assign events_6_m2sPipe_valid = events_6_rValid;
  assign events_7_valid = events_6_m2sPipe_valid;
  assign events_6_m2sPipe_ready = events_7_ready;
  always @(*) begin
    events_7_ready = events_7_m2sPipe_ready;
    if(when_Stream_l342_7) begin
      events_7_ready = 1'b1;
    end
  end

  assign when_Stream_l342_7 = (! events_7_m2sPipe_valid);
  assign events_7_m2sPipe_valid = events_7_rValid;
  assign eventOut_valid = events_7_m2sPipe_valid;
  assign events_7_m2sPipe_ready = eventOut_ready;
  always @(posedge clk) begin
    if(reset) begin
      events_0_rValid <= 1'b0;
      events_1_rValid <= 1'b0;
      events_2_rValid <= 1'b0;
      events_3_rValid <= 1'b0;
      events_4_rValid <= 1'b0;
      events_5_rValid <= 1'b0;
      events_6_rValid <= 1'b0;
      events_7_rValid <= 1'b0;
    end else begin
      if(events_0_ready) begin
        events_0_rValid <= events_0_valid;
      end
      if(events_1_ready) begin
        events_1_rValid <= events_1_valid;
      end
      if(events_2_ready) begin
        events_2_rValid <= events_2_valid;
      end
      if(events_3_ready) begin
        events_3_rValid <= events_3_valid;
      end
      if(events_4_ready) begin
        events_4_rValid <= events_4_valid;
      end
      if(events_5_ready) begin
        events_5_rValid <= events_5_valid;
      end
      if(events_6_ready) begin
        events_6_rValid <= events_6_valid;
      end
      if(events_7_ready) begin
        events_7_rValid <= events_7_valid;
      end
    end
  end


endmodule

module PixelBufferSame (
  input               videoIn_valid,
  output reg          videoIn_ready,
  input      [7:0]    videoIn_payload_frame_line_pixel_0_0,
  input      [7:0]    videoIn_payload_frame_line_pixel_0_1,
  input      [7:0]    videoIn_payload_frame_line_pixel_0_2,
  input      [7:0]    videoIn_payload_frame_line_pixel_0_3,
  input      [7:0]    videoIn_payload_frame_line_pixel_1_0,
  input      [7:0]    videoIn_payload_frame_line_pixel_1_1,
  input      [7:0]    videoIn_payload_frame_line_pixel_1_2,
  input      [7:0]    videoIn_payload_frame_line_pixel_1_3,
  input      [7:0]    videoIn_payload_frame_line_pixel_2_0,
  input      [7:0]    videoIn_payload_frame_line_pixel_2_1,
  input      [7:0]    videoIn_payload_frame_line_pixel_2_2,
  input      [7:0]    videoIn_payload_frame_line_pixel_2_3,
  input               videoIn_payload_frame_line_endOfLine,
  input               videoIn_payload_frame_endOfFrame,
  input               videoIn_payload_endOfPack,
  output              videoOut_valid,
  input               videoOut_ready,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_2_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_2_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_2_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_2_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_2_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_2_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_2_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_2_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_0_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_0_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_0_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_0_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_1_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_1_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_1_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_1_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_2_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_2_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_2_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_2_3,
  output              videoOut_payload_frame_line_endOfLine,
  output              videoOut_payload_frame_endOfFrame,
  output              videoOut_payload_endOfPack,
  input               clk,
  input               reset
);

  wire       [95:0]   tmp_pixelBuffer;
  wire       [7:0]    zero_0_0;
  wire       [7:0]    zero_0_1;
  wire       [7:0]    zero_0_2;
  wire       [7:0]    zero_0_3;
  wire       [7:0]    zero_1_0;
  wire       [7:0]    zero_1_1;
  wire       [7:0]    zero_1_2;
  wire       [7:0]    zero_1_3;
  wire       [7:0]    zero_2_0;
  wire       [7:0]    zero_2_1;
  wire       [7:0]    zero_2_2;
  wire       [7:0]    zero_2_3;
  wire       [95:0]   tmp_zero_0_0;
  wire       [31:0]   tmp_zero_0_0_1;
  wire       [31:0]   tmp_zero_1_0;
  wire       [31:0]   tmp_zero_2_0;
  wire                padded_valid;
  wire                padded_ready;
  wire       [7:0]    padded_payload_frame_line_pixel_0_0;
  wire       [7:0]    padded_payload_frame_line_pixel_0_1;
  wire       [7:0]    padded_payload_frame_line_pixel_0_2;
  wire       [7:0]    padded_payload_frame_line_pixel_0_3;
  wire       [7:0]    padded_payload_frame_line_pixel_1_0;
  wire       [7:0]    padded_payload_frame_line_pixel_1_1;
  wire       [7:0]    padded_payload_frame_line_pixel_1_2;
  wire       [7:0]    padded_payload_frame_line_pixel_1_3;
  wire       [7:0]    padded_payload_frame_line_pixel_2_0;
  wire       [7:0]    padded_payload_frame_line_pixel_2_1;
  wire       [7:0]    padded_payload_frame_line_pixel_2_2;
  wire       [7:0]    padded_payload_frame_line_pixel_2_3;
  wire                padded_payload_frame_line_endOfLine;
  wire                padded_payload_frame_endOfFrame;
  wire                padded_payload_endOfPack;
  wire                videoInFire;
  wire                videoOutFire;
  wire                paddedFire;
  wire                when_PixelBufferSame_l46;
  reg                 tmp_bridge_payload_endOfPack;
  wire                tmp_bridge_payload_endOfPack_1;
  wire                tmp_bridge_payload_endOfPack_2;
  reg                 paddedCond;
  wire                when_PixelBufferSame_l48;
  reg                 tmp_padded_valid;
  reg        [191:0]  pixelBuffer;
  wire                bridge_valid;
  reg                 bridge_ready;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_0_0;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_0_1;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_0_2;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_0_3;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_1_0;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_1_1;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_1_2;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_1_3;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_2_0;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_2_1;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_2_2;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_2_3;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_0_0;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_0_1;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_0_2;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_0_3;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_1_0;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_1_1;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_1_2;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_1_3;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_2_0;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_2_1;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_2_2;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_2_3;
  wire       [7:0]    bridge_payload_frame_line_pixel_2_0_0;
  wire       [7:0]    bridge_payload_frame_line_pixel_2_0_1;
  wire       [7:0]    bridge_payload_frame_line_pixel_2_0_2;
  wire       [7:0]    bridge_payload_frame_line_pixel_2_0_3;
  wire       [7:0]    bridge_payload_frame_line_pixel_2_1_0;
  wire       [7:0]    bridge_payload_frame_line_pixel_2_1_1;
  wire       [7:0]    bridge_payload_frame_line_pixel_2_1_2;
  wire       [7:0]    bridge_payload_frame_line_pixel_2_1_3;
  wire       [7:0]    bridge_payload_frame_line_pixel_2_2_0;
  wire       [7:0]    bridge_payload_frame_line_pixel_2_2_1;
  wire       [7:0]    bridge_payload_frame_line_pixel_2_2_2;
  wire       [7:0]    bridge_payload_frame_line_pixel_2_2_3;
  wire                bridge_payload_frame_line_endOfLine;
  wire                bridge_payload_frame_endOfFrame;
  wire                bridge_payload_endOfPack;
  wire                bridgeFire;
  reg        [1:0]    cntPrev;
  reg        [1:0]    cntPost;
  wire                cntPrevStable;
  wire                cntPostStable;
  wire                cntPrevEqualVec_0;
  wire                cntPostEqualVec_0;
  wire                when_PixelBufferSame_l74;
  wire                when_PixelBufferSame_l75;
  wire                when_PixelBufferSame_l76;
  wire                when_PixelBufferSame_l77;
  wire       [7:0]    pixelVec_0_0_0;
  wire       [7:0]    pixelVec_0_0_1;
  wire       [7:0]    pixelVec_0_0_2;
  wire       [7:0]    pixelVec_0_0_3;
  wire       [7:0]    pixelVec_0_1_0;
  wire       [7:0]    pixelVec_0_1_1;
  wire       [7:0]    pixelVec_0_1_2;
  wire       [7:0]    pixelVec_0_1_3;
  wire       [7:0]    pixelVec_0_2_0;
  wire       [7:0]    pixelVec_0_2_1;
  wire       [7:0]    pixelVec_0_2_2;
  wire       [7:0]    pixelVec_0_2_3;
  wire       [7:0]    pixelVec_1_0_0;
  wire       [7:0]    pixelVec_1_0_1;
  wire       [7:0]    pixelVec_1_0_2;
  wire       [7:0]    pixelVec_1_0_3;
  wire       [7:0]    pixelVec_1_1_0;
  wire       [7:0]    pixelVec_1_1_1;
  wire       [7:0]    pixelVec_1_1_2;
  wire       [7:0]    pixelVec_1_1_3;
  wire       [7:0]    pixelVec_1_2_0;
  wire       [7:0]    pixelVec_1_2_1;
  wire       [7:0]    pixelVec_1_2_2;
  wire       [7:0]    pixelVec_1_2_3;
  wire       [7:0]    pixelVec_2_0_0;
  wire       [7:0]    pixelVec_2_0_1;
  wire       [7:0]    pixelVec_2_0_2;
  wire       [7:0]    pixelVec_2_0_3;
  wire       [7:0]    pixelVec_2_1_0;
  wire       [7:0]    pixelVec_2_1_1;
  wire       [7:0]    pixelVec_2_1_2;
  wire       [7:0]    pixelVec_2_1_3;
  wire       [7:0]    pixelVec_2_2_0;
  wire       [7:0]    pixelVec_2_2_1;
  wire       [7:0]    pixelVec_2_2_2;
  wire       [7:0]    pixelVec_2_2_3;
  wire       [287:0]  tmp_pixelVec_0_0_0;
  wire       [95:0]   tmp_pixelVec_0_0_0_1;
  wire       [31:0]   tmp_pixelVec_0_0_0_2;
  wire       [31:0]   tmp_pixelVec_0_1_0;
  wire       [31:0]   tmp_pixelVec_0_2_0;
  wire       [95:0]   tmp_pixelVec_1_0_0;
  wire       [31:0]   tmp_pixelVec_1_0_0_1;
  wire       [31:0]   tmp_pixelVec_1_1_0;
  wire       [31:0]   tmp_pixelVec_1_2_0;
  wire       [95:0]   tmp_pixelVec_2_0_0;
  wire       [31:0]   tmp_pixelVec_2_0_0_1;
  wire       [31:0]   tmp_pixelVec_2_1_0;
  wire       [31:0]   tmp_pixelVec_2_2_0;
  wire       [7:0]    up_0_0_0;
  wire       [7:0]    up_0_0_1;
  wire       [7:0]    up_0_0_2;
  wire       [7:0]    up_0_0_3;
  wire       [7:0]    up_0_1_0;
  wire       [7:0]    up_0_1_1;
  wire       [7:0]    up_0_1_2;
  wire       [7:0]    up_0_1_3;
  wire       [7:0]    up_0_2_0;
  wire       [7:0]    up_0_2_1;
  wire       [7:0]    up_0_2_2;
  wire       [7:0]    up_0_2_3;
  wire       [7:0]    down_0_0_0;
  wire       [7:0]    down_0_0_1;
  wire       [7:0]    down_0_0_2;
  wire       [7:0]    down_0_0_3;
  wire       [7:0]    down_0_1_0;
  wire       [7:0]    down_0_1_1;
  wire       [7:0]    down_0_1_2;
  wire       [7:0]    down_0_1_3;
  wire       [7:0]    down_0_2_0;
  wire       [7:0]    down_0_2_1;
  wire       [7:0]    down_0_2_2;
  wire       [7:0]    down_0_2_3;
  reg                 padded_payload_frame_endOfFrame_delay_1;
  reg                 padded_payload_frame_line_endOfLine_delay_1;
  reg                 cnt_willIncrement;
  reg                 cnt_willClear;
  reg        [0:0]    cnt_valueNext;
  reg        [0:0]    cnt_value;
  wire                cnt_willOverflowIfInc;
  wire                cnt_willOverflow;
  wire                cntWontOverflowIfInc;
  wire                when_PixelBufferSame_l92;
  wire                when_PixelBufferSame_l93;
  reg                 tmp_videoOut_valid;

  assign tmp_pixelBuffer = (pixelBuffer >>> 96);
  assign tmp_zero_0_0 = 96'h0;
  assign tmp_zero_0_0_1 = tmp_zero_0_0[31 : 0];
  assign zero_0_0 = tmp_zero_0_0_1[7 : 0];
  assign zero_0_1 = tmp_zero_0_0_1[15 : 8];
  assign zero_0_2 = tmp_zero_0_0_1[23 : 16];
  assign zero_0_3 = tmp_zero_0_0_1[31 : 24];
  assign tmp_zero_1_0 = tmp_zero_0_0[63 : 32];
  assign zero_1_0 = tmp_zero_1_0[7 : 0];
  assign zero_1_1 = tmp_zero_1_0[15 : 8];
  assign zero_1_2 = tmp_zero_1_0[23 : 16];
  assign zero_1_3 = tmp_zero_1_0[31 : 24];
  assign tmp_zero_2_0 = tmp_zero_0_0[95 : 64];
  assign zero_2_0 = tmp_zero_2_0[7 : 0];
  assign zero_2_1 = tmp_zero_2_0[15 : 8];
  assign zero_2_2 = tmp_zero_2_0[23 : 16];
  assign zero_2_3 = tmp_zero_2_0[31 : 24];
  assign videoInFire = (videoIn_valid && videoIn_ready);
  assign videoOutFire = (videoOut_valid && videoOut_ready);
  assign paddedFire = (padded_valid && padded_ready);
  assign when_PixelBufferSame_l46 = (videoInFire && videoIn_payload_endOfPack);
  always @(*) begin
    tmp_bridge_payload_endOfPack = 1'b0;
    if(when_PixelBufferSame_l48) begin
      tmp_bridge_payload_endOfPack = 1'b1;
    end
  end

  assign tmp_bridge_payload_endOfPack_1 = 1'b1;
  assign tmp_bridge_payload_endOfPack_2 = (tmp_bridge_payload_endOfPack_1 && tmp_bridge_payload_endOfPack);
  assign when_PixelBufferSame_l48 = (paddedFire && paddedCond);
  always @(*) begin
    tmp_padded_valid = videoIn_valid;
    if(paddedCond) begin
      tmp_padded_valid = 1'b1;
    end
  end

  always @(*) begin
    videoIn_ready = padded_ready;
    if(paddedCond) begin
      videoIn_ready = 1'b0;
    end
  end

  assign padded_valid = tmp_padded_valid;
  assign padded_payload_frame_line_pixel_0_0 = videoIn_payload_frame_line_pixel_0_0;
  assign padded_payload_frame_line_pixel_0_1 = videoIn_payload_frame_line_pixel_0_1;
  assign padded_payload_frame_line_pixel_0_2 = videoIn_payload_frame_line_pixel_0_2;
  assign padded_payload_frame_line_pixel_0_3 = videoIn_payload_frame_line_pixel_0_3;
  assign padded_payload_frame_line_pixel_1_0 = videoIn_payload_frame_line_pixel_1_0;
  assign padded_payload_frame_line_pixel_1_1 = videoIn_payload_frame_line_pixel_1_1;
  assign padded_payload_frame_line_pixel_1_2 = videoIn_payload_frame_line_pixel_1_2;
  assign padded_payload_frame_line_pixel_1_3 = videoIn_payload_frame_line_pixel_1_3;
  assign padded_payload_frame_line_pixel_2_0 = videoIn_payload_frame_line_pixel_2_0;
  assign padded_payload_frame_line_pixel_2_1 = videoIn_payload_frame_line_pixel_2_1;
  assign padded_payload_frame_line_pixel_2_2 = videoIn_payload_frame_line_pixel_2_2;
  assign padded_payload_frame_line_pixel_2_3 = videoIn_payload_frame_line_pixel_2_3;
  assign padded_payload_frame_line_endOfLine = videoIn_payload_frame_line_endOfLine;
  assign padded_payload_frame_endOfFrame = videoIn_payload_frame_endOfFrame;
  assign padded_payload_endOfPack = videoIn_payload_endOfPack;
  assign bridgeFire = (bridge_valid && bridge_ready);
  assign bridge_valid = padded_valid;
  assign padded_ready = bridge_ready;
  assign cntPrevStable = (cntPrev == 2'b01);
  assign cntPostStable = (cntPost == 2'b01);
  assign cntPrevEqualVec_0 = ((2'b00 <= cntPrev) && (cntPrev < 2'b01));
  assign cntPostEqualVec_0 = (cntPost <= 2'b00);
  assign when_PixelBufferSame_l74 = (videoInFire && videoIn_payload_frame_line_endOfLine);
  assign when_PixelBufferSame_l75 = (videoOutFire && videoOut_payload_frame_line_endOfLine);
  assign when_PixelBufferSame_l76 = (videoOutFire && (! cntPrevStable));
  assign when_PixelBufferSame_l77 = (videoOutFire && (! cntPostStable));
  assign tmp_pixelVec_0_0_0 = {{{videoIn_payload_frame_line_pixel_2_3,{videoIn_payload_frame_line_pixel_2_2,{videoIn_payload_frame_line_pixel_2_1,videoIn_payload_frame_line_pixel_2_0}}},{{videoIn_payload_frame_line_pixel_1_3,{videoIn_payload_frame_line_pixel_1_2,{videoIn_payload_frame_line_pixel_1_1,videoIn_payload_frame_line_pixel_1_0}}},{videoIn_payload_frame_line_pixel_0_3,{videoIn_payload_frame_line_pixel_0_2,{videoIn_payload_frame_line_pixel_0_1,videoIn_payload_frame_line_pixel_0_0}}}}},pixelBuffer};
  assign tmp_pixelVec_0_0_0_1 = tmp_pixelVec_0_0_0[95 : 0];
  assign tmp_pixelVec_0_0_0_2 = tmp_pixelVec_0_0_0_1[31 : 0];
  assign pixelVec_0_0_0 = tmp_pixelVec_0_0_0_2[7 : 0];
  assign pixelVec_0_0_1 = tmp_pixelVec_0_0_0_2[15 : 8];
  assign pixelVec_0_0_2 = tmp_pixelVec_0_0_0_2[23 : 16];
  assign pixelVec_0_0_3 = tmp_pixelVec_0_0_0_2[31 : 24];
  assign tmp_pixelVec_0_1_0 = tmp_pixelVec_0_0_0_1[63 : 32];
  assign pixelVec_0_1_0 = tmp_pixelVec_0_1_0[7 : 0];
  assign pixelVec_0_1_1 = tmp_pixelVec_0_1_0[15 : 8];
  assign pixelVec_0_1_2 = tmp_pixelVec_0_1_0[23 : 16];
  assign pixelVec_0_1_3 = tmp_pixelVec_0_1_0[31 : 24];
  assign tmp_pixelVec_0_2_0 = tmp_pixelVec_0_0_0_1[95 : 64];
  assign pixelVec_0_2_0 = tmp_pixelVec_0_2_0[7 : 0];
  assign pixelVec_0_2_1 = tmp_pixelVec_0_2_0[15 : 8];
  assign pixelVec_0_2_2 = tmp_pixelVec_0_2_0[23 : 16];
  assign pixelVec_0_2_3 = tmp_pixelVec_0_2_0[31 : 24];
  assign tmp_pixelVec_1_0_0 = tmp_pixelVec_0_0_0[191 : 96];
  assign tmp_pixelVec_1_0_0_1 = tmp_pixelVec_1_0_0[31 : 0];
  assign pixelVec_1_0_0 = tmp_pixelVec_1_0_0_1[7 : 0];
  assign pixelVec_1_0_1 = tmp_pixelVec_1_0_0_1[15 : 8];
  assign pixelVec_1_0_2 = tmp_pixelVec_1_0_0_1[23 : 16];
  assign pixelVec_1_0_3 = tmp_pixelVec_1_0_0_1[31 : 24];
  assign tmp_pixelVec_1_1_0 = tmp_pixelVec_1_0_0[63 : 32];
  assign pixelVec_1_1_0 = tmp_pixelVec_1_1_0[7 : 0];
  assign pixelVec_1_1_1 = tmp_pixelVec_1_1_0[15 : 8];
  assign pixelVec_1_1_2 = tmp_pixelVec_1_1_0[23 : 16];
  assign pixelVec_1_1_3 = tmp_pixelVec_1_1_0[31 : 24];
  assign tmp_pixelVec_1_2_0 = tmp_pixelVec_1_0_0[95 : 64];
  assign pixelVec_1_2_0 = tmp_pixelVec_1_2_0[7 : 0];
  assign pixelVec_1_2_1 = tmp_pixelVec_1_2_0[15 : 8];
  assign pixelVec_1_2_2 = tmp_pixelVec_1_2_0[23 : 16];
  assign pixelVec_1_2_3 = tmp_pixelVec_1_2_0[31 : 24];
  assign tmp_pixelVec_2_0_0 = tmp_pixelVec_0_0_0[287 : 192];
  assign tmp_pixelVec_2_0_0_1 = tmp_pixelVec_2_0_0[31 : 0];
  assign pixelVec_2_0_0 = tmp_pixelVec_2_0_0_1[7 : 0];
  assign pixelVec_2_0_1 = tmp_pixelVec_2_0_0_1[15 : 8];
  assign pixelVec_2_0_2 = tmp_pixelVec_2_0_0_1[23 : 16];
  assign pixelVec_2_0_3 = tmp_pixelVec_2_0_0_1[31 : 24];
  assign tmp_pixelVec_2_1_0 = tmp_pixelVec_2_0_0[63 : 32];
  assign pixelVec_2_1_0 = tmp_pixelVec_2_1_0[7 : 0];
  assign pixelVec_2_1_1 = tmp_pixelVec_2_1_0[15 : 8];
  assign pixelVec_2_1_2 = tmp_pixelVec_2_1_0[23 : 16];
  assign pixelVec_2_1_3 = tmp_pixelVec_2_1_0[31 : 24];
  assign tmp_pixelVec_2_2_0 = tmp_pixelVec_2_0_0[95 : 64];
  assign pixelVec_2_2_0 = tmp_pixelVec_2_2_0[7 : 0];
  assign pixelVec_2_2_1 = tmp_pixelVec_2_2_0[15 : 8];
  assign pixelVec_2_2_2 = tmp_pixelVec_2_2_0[23 : 16];
  assign pixelVec_2_2_3 = tmp_pixelVec_2_2_0[31 : 24];
  assign up_0_0_0 = (cntPostEqualVec_0 ? zero_0_0 : pixelVec_0_0_0);
  assign up_0_0_1 = (cntPostEqualVec_0 ? zero_0_1 : pixelVec_0_0_1);
  assign up_0_0_2 = (cntPostEqualVec_0 ? zero_0_2 : pixelVec_0_0_2);
  assign up_0_0_3 = (cntPostEqualVec_0 ? zero_0_3 : pixelVec_0_0_3);
  assign up_0_1_0 = (cntPostEqualVec_0 ? zero_1_0 : pixelVec_0_1_0);
  assign up_0_1_1 = (cntPostEqualVec_0 ? zero_1_1 : pixelVec_0_1_1);
  assign up_0_1_2 = (cntPostEqualVec_0 ? zero_1_2 : pixelVec_0_1_2);
  assign up_0_1_3 = (cntPostEqualVec_0 ? zero_1_3 : pixelVec_0_1_3);
  assign up_0_2_0 = (cntPostEqualVec_0 ? zero_2_0 : pixelVec_0_2_0);
  assign up_0_2_1 = (cntPostEqualVec_0 ? zero_2_1 : pixelVec_0_2_1);
  assign up_0_2_2 = (cntPostEqualVec_0 ? zero_2_2 : pixelVec_0_2_2);
  assign up_0_2_3 = (cntPostEqualVec_0 ? zero_2_3 : pixelVec_0_2_3);
  assign down_0_0_0 = (cntPrevEqualVec_0 ? zero_0_0 : pixelVec_2_0_0);
  assign down_0_0_1 = (cntPrevEqualVec_0 ? zero_0_1 : pixelVec_2_0_1);
  assign down_0_0_2 = (cntPrevEqualVec_0 ? zero_0_2 : pixelVec_2_0_2);
  assign down_0_0_3 = (cntPrevEqualVec_0 ? zero_0_3 : pixelVec_2_0_3);
  assign down_0_1_0 = (cntPrevEqualVec_0 ? zero_1_0 : pixelVec_2_1_0);
  assign down_0_1_1 = (cntPrevEqualVec_0 ? zero_1_1 : pixelVec_2_1_1);
  assign down_0_1_2 = (cntPrevEqualVec_0 ? zero_1_2 : pixelVec_2_1_2);
  assign down_0_1_3 = (cntPrevEqualVec_0 ? zero_1_3 : pixelVec_2_1_3);
  assign down_0_2_0 = (cntPrevEqualVec_0 ? zero_2_0 : pixelVec_2_2_0);
  assign down_0_2_1 = (cntPrevEqualVec_0 ? zero_2_1 : pixelVec_2_2_1);
  assign down_0_2_2 = (cntPrevEqualVec_0 ? zero_2_2 : pixelVec_2_2_2);
  assign down_0_2_3 = (cntPrevEqualVec_0 ? zero_2_3 : pixelVec_2_2_3);
  assign bridge_payload_endOfPack = tmp_bridge_payload_endOfPack_2;
  assign bridge_payload_frame_endOfFrame = padded_payload_frame_endOfFrame_delay_1;
  assign bridge_payload_frame_line_endOfLine = padded_payload_frame_line_endOfLine_delay_1;
  assign bridge_payload_frame_line_pixel_0_0_0 = up_0_0_0;
  assign bridge_payload_frame_line_pixel_0_0_1 = up_0_0_1;
  assign bridge_payload_frame_line_pixel_0_0_2 = up_0_0_2;
  assign bridge_payload_frame_line_pixel_0_0_3 = up_0_0_3;
  assign bridge_payload_frame_line_pixel_0_1_0 = up_0_1_0;
  assign bridge_payload_frame_line_pixel_0_1_1 = up_0_1_1;
  assign bridge_payload_frame_line_pixel_0_1_2 = up_0_1_2;
  assign bridge_payload_frame_line_pixel_0_1_3 = up_0_1_3;
  assign bridge_payload_frame_line_pixel_0_2_0 = up_0_2_0;
  assign bridge_payload_frame_line_pixel_0_2_1 = up_0_2_1;
  assign bridge_payload_frame_line_pixel_0_2_2 = up_0_2_2;
  assign bridge_payload_frame_line_pixel_0_2_3 = up_0_2_3;
  assign bridge_payload_frame_line_pixel_1_0_0 = pixelVec_1_0_0;
  assign bridge_payload_frame_line_pixel_1_0_1 = pixelVec_1_0_1;
  assign bridge_payload_frame_line_pixel_1_0_2 = pixelVec_1_0_2;
  assign bridge_payload_frame_line_pixel_1_0_3 = pixelVec_1_0_3;
  assign bridge_payload_frame_line_pixel_1_1_0 = pixelVec_1_1_0;
  assign bridge_payload_frame_line_pixel_1_1_1 = pixelVec_1_1_1;
  assign bridge_payload_frame_line_pixel_1_1_2 = pixelVec_1_1_2;
  assign bridge_payload_frame_line_pixel_1_1_3 = pixelVec_1_1_3;
  assign bridge_payload_frame_line_pixel_1_2_0 = pixelVec_1_2_0;
  assign bridge_payload_frame_line_pixel_1_2_1 = pixelVec_1_2_1;
  assign bridge_payload_frame_line_pixel_1_2_2 = pixelVec_1_2_2;
  assign bridge_payload_frame_line_pixel_1_2_3 = pixelVec_1_2_3;
  assign bridge_payload_frame_line_pixel_2_0_0 = down_0_0_0;
  assign bridge_payload_frame_line_pixel_2_0_1 = down_0_0_1;
  assign bridge_payload_frame_line_pixel_2_0_2 = down_0_0_2;
  assign bridge_payload_frame_line_pixel_2_0_3 = down_0_0_3;
  assign bridge_payload_frame_line_pixel_2_1_0 = down_0_1_0;
  assign bridge_payload_frame_line_pixel_2_1_1 = down_0_1_1;
  assign bridge_payload_frame_line_pixel_2_1_2 = down_0_1_2;
  assign bridge_payload_frame_line_pixel_2_1_3 = down_0_1_3;
  assign bridge_payload_frame_line_pixel_2_2_0 = down_0_2_0;
  assign bridge_payload_frame_line_pixel_2_2_1 = down_0_2_1;
  assign bridge_payload_frame_line_pixel_2_2_2 = down_0_2_2;
  assign bridge_payload_frame_line_pixel_2_2_3 = down_0_2_3;
  always @(*) begin
    cnt_willIncrement = 1'b0;
    if(when_PixelBufferSame_l93) begin
      cnt_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    cnt_willClear = 1'b0;
    if(when_PixelBufferSame_l92) begin
      cnt_willClear = 1'b1;
    end
  end

  assign cnt_willOverflowIfInc = (cnt_value == 1'b1);
  assign cnt_willOverflow = (cnt_willOverflowIfInc && cnt_willIncrement);
  always @(*) begin
    cnt_valueNext = (cnt_value + cnt_willIncrement);
    if(cnt_willClear) begin
      cnt_valueNext = 1'b0;
    end
  end

  assign cntWontOverflowIfInc = (! cnt_willOverflowIfInc);
  assign when_PixelBufferSame_l92 = (bridgeFire && bridge_payload_endOfPack);
  assign when_PixelBufferSame_l93 = (bridgeFire && cntWontOverflowIfInc);
  always @(*) begin
    tmp_videoOut_valid = bridge_valid;
    if(cntWontOverflowIfInc) begin
      tmp_videoOut_valid = 1'b0;
    end
  end

  always @(*) begin
    bridge_ready = videoOut_ready;
    if(cntWontOverflowIfInc) begin
      bridge_ready = 1'b1;
    end
  end

  assign videoOut_valid = tmp_videoOut_valid;
  assign videoOut_payload_frame_line_pixel_0_0_0 = bridge_payload_frame_line_pixel_0_0_0;
  assign videoOut_payload_frame_line_pixel_0_0_1 = bridge_payload_frame_line_pixel_0_0_1;
  assign videoOut_payload_frame_line_pixel_0_0_2 = bridge_payload_frame_line_pixel_0_0_2;
  assign videoOut_payload_frame_line_pixel_0_0_3 = bridge_payload_frame_line_pixel_0_0_3;
  assign videoOut_payload_frame_line_pixel_0_1_0 = bridge_payload_frame_line_pixel_0_1_0;
  assign videoOut_payload_frame_line_pixel_0_1_1 = bridge_payload_frame_line_pixel_0_1_1;
  assign videoOut_payload_frame_line_pixel_0_1_2 = bridge_payload_frame_line_pixel_0_1_2;
  assign videoOut_payload_frame_line_pixel_0_1_3 = bridge_payload_frame_line_pixel_0_1_3;
  assign videoOut_payload_frame_line_pixel_0_2_0 = bridge_payload_frame_line_pixel_0_2_0;
  assign videoOut_payload_frame_line_pixel_0_2_1 = bridge_payload_frame_line_pixel_0_2_1;
  assign videoOut_payload_frame_line_pixel_0_2_2 = bridge_payload_frame_line_pixel_0_2_2;
  assign videoOut_payload_frame_line_pixel_0_2_3 = bridge_payload_frame_line_pixel_0_2_3;
  assign videoOut_payload_frame_line_pixel_1_0_0 = bridge_payload_frame_line_pixel_1_0_0;
  assign videoOut_payload_frame_line_pixel_1_0_1 = bridge_payload_frame_line_pixel_1_0_1;
  assign videoOut_payload_frame_line_pixel_1_0_2 = bridge_payload_frame_line_pixel_1_0_2;
  assign videoOut_payload_frame_line_pixel_1_0_3 = bridge_payload_frame_line_pixel_1_0_3;
  assign videoOut_payload_frame_line_pixel_1_1_0 = bridge_payload_frame_line_pixel_1_1_0;
  assign videoOut_payload_frame_line_pixel_1_1_1 = bridge_payload_frame_line_pixel_1_1_1;
  assign videoOut_payload_frame_line_pixel_1_1_2 = bridge_payload_frame_line_pixel_1_1_2;
  assign videoOut_payload_frame_line_pixel_1_1_3 = bridge_payload_frame_line_pixel_1_1_3;
  assign videoOut_payload_frame_line_pixel_1_2_0 = bridge_payload_frame_line_pixel_1_2_0;
  assign videoOut_payload_frame_line_pixel_1_2_1 = bridge_payload_frame_line_pixel_1_2_1;
  assign videoOut_payload_frame_line_pixel_1_2_2 = bridge_payload_frame_line_pixel_1_2_2;
  assign videoOut_payload_frame_line_pixel_1_2_3 = bridge_payload_frame_line_pixel_1_2_3;
  assign videoOut_payload_frame_line_pixel_2_0_0 = bridge_payload_frame_line_pixel_2_0_0;
  assign videoOut_payload_frame_line_pixel_2_0_1 = bridge_payload_frame_line_pixel_2_0_1;
  assign videoOut_payload_frame_line_pixel_2_0_2 = bridge_payload_frame_line_pixel_2_0_2;
  assign videoOut_payload_frame_line_pixel_2_0_3 = bridge_payload_frame_line_pixel_2_0_3;
  assign videoOut_payload_frame_line_pixel_2_1_0 = bridge_payload_frame_line_pixel_2_1_0;
  assign videoOut_payload_frame_line_pixel_2_1_1 = bridge_payload_frame_line_pixel_2_1_1;
  assign videoOut_payload_frame_line_pixel_2_1_2 = bridge_payload_frame_line_pixel_2_1_2;
  assign videoOut_payload_frame_line_pixel_2_1_3 = bridge_payload_frame_line_pixel_2_1_3;
  assign videoOut_payload_frame_line_pixel_2_2_0 = bridge_payload_frame_line_pixel_2_2_0;
  assign videoOut_payload_frame_line_pixel_2_2_1 = bridge_payload_frame_line_pixel_2_2_1;
  assign videoOut_payload_frame_line_pixel_2_2_2 = bridge_payload_frame_line_pixel_2_2_2;
  assign videoOut_payload_frame_line_pixel_2_2_3 = bridge_payload_frame_line_pixel_2_2_3;
  assign videoOut_payload_frame_line_endOfLine = bridge_payload_frame_line_endOfLine;
  assign videoOut_payload_frame_endOfFrame = bridge_payload_frame_endOfFrame;
  assign videoOut_payload_endOfPack = bridge_payload_endOfPack;
  always @(posedge clk) begin
    if(reset) begin
      paddedCond <= 1'b0;
      cntPrev <= 2'b01;
      cntPost <= 2'b00;
      padded_payload_frame_endOfFrame_delay_1 <= 1'b0;
      padded_payload_frame_line_endOfLine_delay_1 <= 1'b0;
      cnt_value <= 1'b0;
    end else begin
      if(when_PixelBufferSame_l46) begin
        paddedCond <= 1'b1;
      end
      if(tmp_bridge_payload_endOfPack_2) begin
        paddedCond <= 1'b0;
      end
      if(when_PixelBufferSame_l74) begin
        cntPrev <= 2'b00;
      end
      if(when_PixelBufferSame_l75) begin
        cntPost <= 2'b00;
      end
      if(when_PixelBufferSame_l76) begin
        cntPrev <= (cntPrev + 2'b01);
      end
      if(when_PixelBufferSame_l77) begin
        cntPost <= (cntPost + 2'b01);
      end
      if(paddedFire) begin
        padded_payload_frame_endOfFrame_delay_1 <= padded_payload_frame_endOfFrame;
      end
      if(paddedFire) begin
        padded_payload_frame_line_endOfLine_delay_1 <= padded_payload_frame_line_endOfLine;
      end
      cnt_value <= cnt_valueNext;
    end
  end

  always @(posedge clk) begin
    if(paddedFire) begin
      pixelBuffer <= {{{padded_payload_frame_line_pixel_2_3,{padded_payload_frame_line_pixel_2_2,{padded_payload_frame_line_pixel_2_1,padded_payload_frame_line_pixel_2_0}}},{{padded_payload_frame_line_pixel_1_3,{padded_payload_frame_line_pixel_1_2,{padded_payload_frame_line_pixel_1_1,padded_payload_frame_line_pixel_1_0}}},{padded_payload_frame_line_pixel_0_3,{padded_payload_frame_line_pixel_0_2,{padded_payload_frame_line_pixel_0_1,padded_payload_frame_line_pixel_0_0}}}}},tmp_pixelBuffer};
    end
  end


endmodule

module LineBufferSame (
  input               videoIn_valid,
  output              videoIn_ready,
  input      [7:0]    videoIn_payload_frame_line_pixel_0,
  input      [7:0]    videoIn_payload_frame_line_pixel_1,
  input      [7:0]    videoIn_payload_frame_line_pixel_2,
  input      [7:0]    videoIn_payload_frame_line_pixel_3,
  input               videoIn_payload_frame_line_endOfLine,
  input               videoIn_payload_frame_endOfFrame,
  input               videoIn_payload_endOfPack,
  output              videoOut_valid,
  input               videoOut_ready,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_2_3,
  output              videoOut_payload_frame_line_endOfLine,
  output              videoOut_payload_frame_endOfFrame,
  output              videoOut_payload_endOfPack,
  input               clk,
  input               reset
);

  reg                 videoIn_fork_io_outputs_0_ready;
  reg                 videoIn_fork_io_outputs_1_ready;
  reg                 fifo_pop_fork_io_outputs_0_ready;
  reg                 fifo_pop_fork_io_outputs_1_ready;
  wire                fifo_push_ready;
  wire                fifo_pop_valid;
  wire       [7:0]    fifo_pop_payload_0_pixel_0;
  wire       [7:0]    fifo_pop_payload_0_pixel_1;
  wire       [7:0]    fifo_pop_payload_0_pixel_2;
  wire       [7:0]    fifo_pop_payload_0_pixel_3;
  wire                fifo_pop_payload_0_endOfLine;
  wire       [7:0]    fifo_pop_payload_1_pixel_0;
  wire       [7:0]    fifo_pop_payload_1_pixel_1;
  wire       [7:0]    fifo_pop_payload_1_pixel_2;
  wire       [7:0]    fifo_pop_payload_1_pixel_3;
  wire                fifo_pop_payload_1_endOfLine;
  wire                videoIn_fork_io_input_ready;
  wire                videoIn_fork_io_outputs_0_valid;
  wire       [7:0]    videoIn_fork_io_outputs_0_payload_frame_line_pixel_0;
  wire       [7:0]    videoIn_fork_io_outputs_0_payload_frame_line_pixel_1;
  wire       [7:0]    videoIn_fork_io_outputs_0_payload_frame_line_pixel_2;
  wire       [7:0]    videoIn_fork_io_outputs_0_payload_frame_line_pixel_3;
  wire                videoIn_fork_io_outputs_0_payload_frame_line_endOfLine;
  wire                videoIn_fork_io_outputs_0_payload_frame_endOfFrame;
  wire                videoIn_fork_io_outputs_0_payload_endOfPack;
  wire                videoIn_fork_io_outputs_1_valid;
  wire       [7:0]    videoIn_fork_io_outputs_1_payload_frame_line_pixel_0;
  wire       [7:0]    videoIn_fork_io_outputs_1_payload_frame_line_pixel_1;
  wire       [7:0]    videoIn_fork_io_outputs_1_payload_frame_line_pixel_2;
  wire       [7:0]    videoIn_fork_io_outputs_1_payload_frame_line_pixel_3;
  wire                videoIn_fork_io_outputs_1_payload_frame_line_endOfLine;
  wire                videoIn_fork_io_outputs_1_payload_frame_endOfFrame;
  wire                videoIn_fork_io_outputs_1_payload_endOfPack;
  wire                fifo_pop_fork_io_input_ready;
  wire                fifo_pop_fork_io_outputs_0_valid;
  wire       [7:0]    fifo_pop_fork_io_outputs_0_payload_0_pixel_0;
  wire       [7:0]    fifo_pop_fork_io_outputs_0_payload_0_pixel_1;
  wire       [7:0]    fifo_pop_fork_io_outputs_0_payload_0_pixel_2;
  wire       [7:0]    fifo_pop_fork_io_outputs_0_payload_0_pixel_3;
  wire                fifo_pop_fork_io_outputs_0_payload_0_endOfLine;
  wire       [7:0]    fifo_pop_fork_io_outputs_0_payload_1_pixel_0;
  wire       [7:0]    fifo_pop_fork_io_outputs_0_payload_1_pixel_1;
  wire       [7:0]    fifo_pop_fork_io_outputs_0_payload_1_pixel_2;
  wire       [7:0]    fifo_pop_fork_io_outputs_0_payload_1_pixel_3;
  wire                fifo_pop_fork_io_outputs_0_payload_1_endOfLine;
  wire                fifo_pop_fork_io_outputs_1_valid;
  wire       [7:0]    fifo_pop_fork_io_outputs_1_payload_0_pixel_0;
  wire       [7:0]    fifo_pop_fork_io_outputs_1_payload_0_pixel_1;
  wire       [7:0]    fifo_pop_fork_io_outputs_1_payload_0_pixel_2;
  wire       [7:0]    fifo_pop_fork_io_outputs_1_payload_0_pixel_3;
  wire                fifo_pop_fork_io_outputs_1_payload_0_endOfLine;
  wire       [7:0]    fifo_pop_fork_io_outputs_1_payload_1_pixel_0;
  wire       [7:0]    fifo_pop_fork_io_outputs_1_payload_1_pixel_1;
  wire       [7:0]    fifo_pop_fork_io_outputs_1_payload_1_pixel_2;
  wire       [7:0]    fifo_pop_fork_io_outputs_1_payload_1_pixel_3;
  wire                fifo_pop_fork_io_outputs_1_payload_1_endOfLine;
  wire       [7:0]    zero_0;
  wire       [7:0]    zero_1;
  wire       [7:0]    zero_2;
  wire       [7:0]    zero_3;
  wire       [31:0]   tmp_zero_0;
  wire                in2outThrowCond;
  wire                in2outAddCond;
  wire                in2fifoAddCond;
  wire                fifo2outThrowCond;
  wire                feedbackThrowCond;
  wire                feedbackAddCond;
  reg                 tmp_in2outThrownAdded_valid;
  reg                 tmp_io_outputs_1_ready;
  reg                 in2outThrownAdded_valid;
  wire                in2outThrownAdded_ready;
  wire       [7:0]    in2outThrownAdded_payload_frame_line_pixel_0;
  wire       [7:0]    in2outThrownAdded_payload_frame_line_pixel_1;
  wire       [7:0]    in2outThrownAdded_payload_frame_line_pixel_2;
  wire       [7:0]    in2outThrownAdded_payload_frame_line_pixel_3;
  wire                in2outThrownAdded_payload_frame_line_endOfLine;
  wire                in2outThrownAdded_payload_frame_endOfFrame;
  wire                in2outThrownAdded_payload_endOfPack;
  reg                 in2fifoAdded_valid;
  wire                in2fifoAdded_ready;
  wire       [7:0]    in2fifoAdded_payload_frame_line_pixel_0;
  wire       [7:0]    in2fifoAdded_payload_frame_line_pixel_1;
  wire       [7:0]    in2fifoAdded_payload_frame_line_pixel_2;
  wire       [7:0]    in2fifoAdded_payload_frame_line_pixel_3;
  wire                in2fifoAdded_payload_frame_line_endOfLine;
  wire                in2fifoAdded_payload_frame_endOfFrame;
  wire                in2fifoAdded_payload_endOfPack;
  reg                 fifo2outThrown_valid;
  wire                fifo2outThrown_ready;
  wire       [7:0]    fifo2outThrown_payload_0_pixel_0;
  wire       [7:0]    fifo2outThrown_payload_0_pixel_1;
  wire       [7:0]    fifo2outThrown_payload_0_pixel_2;
  wire       [7:0]    fifo2outThrown_payload_0_pixel_3;
  wire                fifo2outThrown_payload_0_endOfLine;
  wire       [7:0]    fifo2outThrown_payload_1_pixel_0;
  wire       [7:0]    fifo2outThrown_payload_1_pixel_1;
  wire       [7:0]    fifo2outThrown_payload_1_pixel_2;
  wire       [7:0]    fifo2outThrown_payload_1_pixel_3;
  wire                fifo2outThrown_payload_1_endOfLine;
  reg                 tmp_feedbackThrownAdded_valid;
  reg                 tmp_io_outputs_0_ready;
  reg                 feedbackThrownAdded_valid;
  wire                feedbackThrownAdded_ready;
  wire       [7:0]    feedbackThrownAdded_payload_0_pixel_0;
  wire       [7:0]    feedbackThrownAdded_payload_0_pixel_1;
  wire       [7:0]    feedbackThrownAdded_payload_0_pixel_2;
  wire       [7:0]    feedbackThrownAdded_payload_0_pixel_3;
  wire                feedbackThrownAdded_payload_0_endOfLine;
  wire       [7:0]    feedbackThrownAdded_payload_1_pixel_0;
  wire       [7:0]    feedbackThrownAdded_payload_1_pixel_1;
  wire       [7:0]    feedbackThrownAdded_payload_1_pixel_2;
  wire       [7:0]    feedbackThrownAdded_payload_1_pixel_3;
  wire                feedbackThrownAdded_payload_1_endOfLine;
  wire                in2fifoJoinFeedback_valid;
  wire                in2fifoJoinFeedback_ready;
  wire       [7:0]    in2fifoJoinFeedback_payload__1_frame_line_pixel_0;
  wire       [7:0]    in2fifoJoinFeedback_payload__1_frame_line_pixel_1;
  wire       [7:0]    in2fifoJoinFeedback_payload__1_frame_line_pixel_2;
  wire       [7:0]    in2fifoJoinFeedback_payload__1_frame_line_pixel_3;
  wire                in2fifoJoinFeedback_payload__1_frame_line_endOfLine;
  wire                in2fifoJoinFeedback_payload__1_frame_endOfFrame;
  wire                in2fifoJoinFeedback_payload__1_endOfPack;
  wire       [7:0]    in2fifoJoinFeedback_payload__2_0_pixel_0;
  wire       [7:0]    in2fifoJoinFeedback_payload__2_0_pixel_1;
  wire       [7:0]    in2fifoJoinFeedback_payload__2_0_pixel_2;
  wire       [7:0]    in2fifoJoinFeedback_payload__2_0_pixel_3;
  wire                in2fifoJoinFeedback_payload__2_0_endOfLine;
  wire       [7:0]    in2fifoJoinFeedback_payload__2_1_pixel_0;
  wire       [7:0]    in2fifoJoinFeedback_payload__2_1_pixel_1;
  wire       [7:0]    in2fifoJoinFeedback_payload__2_1_pixel_2;
  wire       [7:0]    in2fifoJoinFeedback_payload__2_1_pixel_3;
  wire                in2fifoJoinFeedback_payload__2_1_endOfLine;
  wire                in2fifoJoinFeedback_fire;
  wire                in2fifoJoinFeedback_fire_1;
  wire                in2outJoinFifo2out_valid;
  wire                in2outJoinFifo2out_ready;
  wire       [7:0]    in2outJoinFifo2out_payload__1_frame_line_pixel_0;
  wire       [7:0]    in2outJoinFifo2out_payload__1_frame_line_pixel_1;
  wire       [7:0]    in2outJoinFifo2out_payload__1_frame_line_pixel_2;
  wire       [7:0]    in2outJoinFifo2out_payload__1_frame_line_pixel_3;
  wire                in2outJoinFifo2out_payload__1_frame_line_endOfLine;
  wire                in2outJoinFifo2out_payload__1_frame_endOfFrame;
  wire                in2outJoinFifo2out_payload__1_endOfPack;
  wire       [7:0]    in2outJoinFifo2out_payload__2_0_pixel_0;
  wire       [7:0]    in2outJoinFifo2out_payload__2_0_pixel_1;
  wire       [7:0]    in2outJoinFifo2out_payload__2_0_pixel_2;
  wire       [7:0]    in2outJoinFifo2out_payload__2_0_pixel_3;
  wire                in2outJoinFifo2out_payload__2_0_endOfLine;
  wire       [7:0]    in2outJoinFifo2out_payload__2_1_pixel_0;
  wire       [7:0]    in2outJoinFifo2out_payload__2_1_pixel_1;
  wire       [7:0]    in2outJoinFifo2out_payload__2_1_pixel_2;
  wire       [7:0]    in2outJoinFifo2out_payload__2_1_pixel_3;
  wire                in2outJoinFifo2out_payload__2_1_endOfLine;
  wire                in2outJoinFifo2out_fire;
  wire                in2outJoinFifo2out_fire_1;
  reg                 firstFewLines_willIncrement;
  reg                 firstFewLines_willClear;
  reg        [0:0]    firstFewLines_valueNext;
  reg        [0:0]    firstFewLines_value;
  wire                firstFewLines_willOverflowIfInc;
  wire                firstFewLines_willOverflow;
  wire                ioVideoInFire;
  wire                firstLine;
  wire                firstFewLinesWontOverflowIfInc;
  wire                when_LineBufferSame_l71;
  wire                when_LineBufferSame_l72;
  reg                 lastFewLines_willIncrement;
  reg                 lastFewLines_willClear;
  wire                lastFewLines_willOverflowIfInc;
  wire                lastFewLines_willOverflow;
  wire                ioVideoOutFire;
  wire                lastFewLinesWontOverflowIfInc;
  wire                when_LineBufferSame_l77;
  wire                when_LineBufferSame_l78;
  reg                 endOfFrameGap;
  wire                when_LineBufferSame_l81;
  wire                when_LineBufferSame_l81_1;
  reg                 endOfPackGap;
  wire                when_LineBufferSame_l83;
  wire                when_LineBufferSame_l83_1;
  wire                endOfPackGapInv;
  reg        [1:0]    cntPrev;
  reg        [1:0]    cntPost;
  wire                cntPrevStable;
  wire                cntPostStable;
  wire                cntPrevEqualVec_0;
  wire                cntPostEqualVec_0;
  wire                when_LineBufferSame_l103;
  wire                when_LineBufferSame_l104;
  wire                when_LineBufferSame_l105;
  wire                when_LineBufferSame_l106;
  wire       [7:0]    up_0_0;
  wire       [7:0]    up_0_1;
  wire       [7:0]    up_0_2;
  wire       [7:0]    up_0_3;
  wire       [7:0]    down_0_0;
  wire       [7:0]    down_0_1;
  wire       [7:0]    down_0_2;
  wire       [7:0]    down_0_3;

  StreamFifoHighPerf_1 fifo (
    .push_valid                  (in2fifoJoinFeedback_valid                               ), //i
    .push_ready                  (fifo_push_ready                                         ), //o
    .push_payload_0_pixel_0      (in2fifoJoinFeedback_payload__2_1_pixel_0[7:0]           ), //i
    .push_payload_0_pixel_1      (in2fifoJoinFeedback_payload__2_1_pixel_1[7:0]           ), //i
    .push_payload_0_pixel_2      (in2fifoJoinFeedback_payload__2_1_pixel_2[7:0]           ), //i
    .push_payload_0_pixel_3      (in2fifoJoinFeedback_payload__2_1_pixel_3[7:0]           ), //i
    .push_payload_0_endOfLine    (in2fifoJoinFeedback_payload__2_1_endOfLine              ), //i
    .push_payload_1_pixel_0      (in2fifoJoinFeedback_payload__1_frame_line_pixel_0[7:0]  ), //i
    .push_payload_1_pixel_1      (in2fifoJoinFeedback_payload__1_frame_line_pixel_1[7:0]  ), //i
    .push_payload_1_pixel_2      (in2fifoJoinFeedback_payload__1_frame_line_pixel_2[7:0]  ), //i
    .push_payload_1_pixel_3      (in2fifoJoinFeedback_payload__1_frame_line_pixel_3[7:0]  ), //i
    .push_payload_1_endOfLine    (in2fifoJoinFeedback_payload__1_frame_line_endOfLine     ), //i
    .pop_valid                   (fifo_pop_valid                                          ), //o
    .pop_ready                   (fifo_pop_fork_io_input_ready                            ), //i
    .pop_payload_0_pixel_0       (fifo_pop_payload_0_pixel_0[7:0]                         ), //o
    .pop_payload_0_pixel_1       (fifo_pop_payload_0_pixel_1[7:0]                         ), //o
    .pop_payload_0_pixel_2       (fifo_pop_payload_0_pixel_2[7:0]                         ), //o
    .pop_payload_0_pixel_3       (fifo_pop_payload_0_pixel_3[7:0]                         ), //o
    .pop_payload_0_endOfLine     (fifo_pop_payload_0_endOfLine                            ), //o
    .pop_payload_1_pixel_0       (fifo_pop_payload_1_pixel_0[7:0]                         ), //o
    .pop_payload_1_pixel_1       (fifo_pop_payload_1_pixel_1[7:0]                         ), //o
    .pop_payload_1_pixel_2       (fifo_pop_payload_1_pixel_2[7:0]                         ), //o
    .pop_payload_1_pixel_3       (fifo_pop_payload_1_pixel_3[7:0]                         ), //o
    .pop_payload_1_endOfLine     (fifo_pop_payload_1_endOfLine                            ), //o
    .flush                       (1'b0                                                    ), //i
    .clk                         (clk                                                     ), //i
    .reset                       (reset                                                   )  //i
  );
  StreamFork videoIn_fork (
    .io_input_valid                               (videoIn_valid                                              ), //i
    .io_input_ready                               (videoIn_fork_io_input_ready                                ), //o
    .io_input_payload_frame_line_pixel_0          (videoIn_payload_frame_line_pixel_0[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_1          (videoIn_payload_frame_line_pixel_1[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_2          (videoIn_payload_frame_line_pixel_2[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_3          (videoIn_payload_frame_line_pixel_3[7:0]                    ), //i
    .io_input_payload_frame_line_endOfLine        (videoIn_payload_frame_line_endOfLine                       ), //i
    .io_input_payload_frame_endOfFrame            (videoIn_payload_frame_endOfFrame                           ), //i
    .io_input_payload_endOfPack                   (videoIn_payload_endOfPack                                  ), //i
    .io_outputs_0_valid                           (videoIn_fork_io_outputs_0_valid                            ), //o
    .io_outputs_0_ready                           (videoIn_fork_io_outputs_0_ready                            ), //i
    .io_outputs_0_payload_frame_line_pixel_0      (videoIn_fork_io_outputs_0_payload_frame_line_pixel_0[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_1      (videoIn_fork_io_outputs_0_payload_frame_line_pixel_1[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_2      (videoIn_fork_io_outputs_0_payload_frame_line_pixel_2[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_3      (videoIn_fork_io_outputs_0_payload_frame_line_pixel_3[7:0]  ), //o
    .io_outputs_0_payload_frame_line_endOfLine    (videoIn_fork_io_outputs_0_payload_frame_line_endOfLine     ), //o
    .io_outputs_0_payload_frame_endOfFrame        (videoIn_fork_io_outputs_0_payload_frame_endOfFrame         ), //o
    .io_outputs_0_payload_endOfPack               (videoIn_fork_io_outputs_0_payload_endOfPack                ), //o
    .io_outputs_1_valid                           (videoIn_fork_io_outputs_1_valid                            ), //o
    .io_outputs_1_ready                           (videoIn_fork_io_outputs_1_ready                            ), //i
    .io_outputs_1_payload_frame_line_pixel_0      (videoIn_fork_io_outputs_1_payload_frame_line_pixel_0[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_1      (videoIn_fork_io_outputs_1_payload_frame_line_pixel_1[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_2      (videoIn_fork_io_outputs_1_payload_frame_line_pixel_2[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_3      (videoIn_fork_io_outputs_1_payload_frame_line_pixel_3[7:0]  ), //o
    .io_outputs_1_payload_frame_line_endOfLine    (videoIn_fork_io_outputs_1_payload_frame_line_endOfLine     ), //o
    .io_outputs_1_payload_frame_endOfFrame        (videoIn_fork_io_outputs_1_payload_frame_endOfFrame         ), //o
    .io_outputs_1_payload_endOfPack               (videoIn_fork_io_outputs_1_payload_endOfPack                ), //o
    .clk                                          (clk                                                        ), //i
    .reset                                        (reset                                                      )  //i
  );
  StreamFork_3 fifo_pop_fork (
    .io_input_valid                      (fifo_pop_valid                                     ), //i
    .io_input_ready                      (fifo_pop_fork_io_input_ready                       ), //o
    .io_input_payload_0_pixel_0          (fifo_pop_payload_0_pixel_0[7:0]                    ), //i
    .io_input_payload_0_pixel_1          (fifo_pop_payload_0_pixel_1[7:0]                    ), //i
    .io_input_payload_0_pixel_2          (fifo_pop_payload_0_pixel_2[7:0]                    ), //i
    .io_input_payload_0_pixel_3          (fifo_pop_payload_0_pixel_3[7:0]                    ), //i
    .io_input_payload_0_endOfLine        (fifo_pop_payload_0_endOfLine                       ), //i
    .io_input_payload_1_pixel_0          (fifo_pop_payload_1_pixel_0[7:0]                    ), //i
    .io_input_payload_1_pixel_1          (fifo_pop_payload_1_pixel_1[7:0]                    ), //i
    .io_input_payload_1_pixel_2          (fifo_pop_payload_1_pixel_2[7:0]                    ), //i
    .io_input_payload_1_pixel_3          (fifo_pop_payload_1_pixel_3[7:0]                    ), //i
    .io_input_payload_1_endOfLine        (fifo_pop_payload_1_endOfLine                       ), //i
    .io_outputs_0_valid                  (fifo_pop_fork_io_outputs_0_valid                   ), //o
    .io_outputs_0_ready                  (fifo_pop_fork_io_outputs_0_ready                   ), //i
    .io_outputs_0_payload_0_pixel_0      (fifo_pop_fork_io_outputs_0_payload_0_pixel_0[7:0]  ), //o
    .io_outputs_0_payload_0_pixel_1      (fifo_pop_fork_io_outputs_0_payload_0_pixel_1[7:0]  ), //o
    .io_outputs_0_payload_0_pixel_2      (fifo_pop_fork_io_outputs_0_payload_0_pixel_2[7:0]  ), //o
    .io_outputs_0_payload_0_pixel_3      (fifo_pop_fork_io_outputs_0_payload_0_pixel_3[7:0]  ), //o
    .io_outputs_0_payload_0_endOfLine    (fifo_pop_fork_io_outputs_0_payload_0_endOfLine     ), //o
    .io_outputs_0_payload_1_pixel_0      (fifo_pop_fork_io_outputs_0_payload_1_pixel_0[7:0]  ), //o
    .io_outputs_0_payload_1_pixel_1      (fifo_pop_fork_io_outputs_0_payload_1_pixel_1[7:0]  ), //o
    .io_outputs_0_payload_1_pixel_2      (fifo_pop_fork_io_outputs_0_payload_1_pixel_2[7:0]  ), //o
    .io_outputs_0_payload_1_pixel_3      (fifo_pop_fork_io_outputs_0_payload_1_pixel_3[7:0]  ), //o
    .io_outputs_0_payload_1_endOfLine    (fifo_pop_fork_io_outputs_0_payload_1_endOfLine     ), //o
    .io_outputs_1_valid                  (fifo_pop_fork_io_outputs_1_valid                   ), //o
    .io_outputs_1_ready                  (fifo_pop_fork_io_outputs_1_ready                   ), //i
    .io_outputs_1_payload_0_pixel_0      (fifo_pop_fork_io_outputs_1_payload_0_pixel_0[7:0]  ), //o
    .io_outputs_1_payload_0_pixel_1      (fifo_pop_fork_io_outputs_1_payload_0_pixel_1[7:0]  ), //o
    .io_outputs_1_payload_0_pixel_2      (fifo_pop_fork_io_outputs_1_payload_0_pixel_2[7:0]  ), //o
    .io_outputs_1_payload_0_pixel_3      (fifo_pop_fork_io_outputs_1_payload_0_pixel_3[7:0]  ), //o
    .io_outputs_1_payload_0_endOfLine    (fifo_pop_fork_io_outputs_1_payload_0_endOfLine     ), //o
    .io_outputs_1_payload_1_pixel_0      (fifo_pop_fork_io_outputs_1_payload_1_pixel_0[7:0]  ), //o
    .io_outputs_1_payload_1_pixel_1      (fifo_pop_fork_io_outputs_1_payload_1_pixel_1[7:0]  ), //o
    .io_outputs_1_payload_1_pixel_2      (fifo_pop_fork_io_outputs_1_payload_1_pixel_2[7:0]  ), //o
    .io_outputs_1_payload_1_pixel_3      (fifo_pop_fork_io_outputs_1_payload_1_pixel_3[7:0]  ), //o
    .io_outputs_1_payload_1_endOfLine    (fifo_pop_fork_io_outputs_1_payload_1_endOfLine     ), //o
    .clk                                 (clk                                                ), //i
    .reset                               (reset                                              )  //i
  );
  assign tmp_zero_0 = 32'h0;
  assign zero_0 = tmp_zero_0[7 : 0];
  assign zero_1 = tmp_zero_0[15 : 8];
  assign zero_2 = tmp_zero_0[23 : 16];
  assign zero_3 = tmp_zero_0[31 : 24];
  assign videoIn_ready = videoIn_fork_io_input_ready;
  always @(*) begin
    tmp_in2outThrownAdded_valid = videoIn_fork_io_outputs_1_valid;
    if(in2outThrowCond) begin
      tmp_in2outThrownAdded_valid = 1'b0;
    end
  end

  always @(*) begin
    videoIn_fork_io_outputs_1_ready = tmp_io_outputs_1_ready;
    if(in2outThrowCond) begin
      videoIn_fork_io_outputs_1_ready = 1'b1;
    end
  end

  always @(*) begin
    in2outThrownAdded_valid = tmp_in2outThrownAdded_valid;
    if(in2outAddCond) begin
      in2outThrownAdded_valid = 1'b1;
    end
  end

  always @(*) begin
    tmp_io_outputs_1_ready = in2outThrownAdded_ready;
    if(in2outAddCond) begin
      tmp_io_outputs_1_ready = 1'b0;
    end
  end

  assign in2outThrownAdded_payload_frame_line_pixel_0 = videoIn_fork_io_outputs_1_payload_frame_line_pixel_0;
  assign in2outThrownAdded_payload_frame_line_pixel_1 = videoIn_fork_io_outputs_1_payload_frame_line_pixel_1;
  assign in2outThrownAdded_payload_frame_line_pixel_2 = videoIn_fork_io_outputs_1_payload_frame_line_pixel_2;
  assign in2outThrownAdded_payload_frame_line_pixel_3 = videoIn_fork_io_outputs_1_payload_frame_line_pixel_3;
  assign in2outThrownAdded_payload_frame_line_endOfLine = videoIn_fork_io_outputs_1_payload_frame_line_endOfLine;
  assign in2outThrownAdded_payload_frame_endOfFrame = videoIn_fork_io_outputs_1_payload_frame_endOfFrame;
  assign in2outThrownAdded_payload_endOfPack = videoIn_fork_io_outputs_1_payload_endOfPack;
  always @(*) begin
    in2fifoAdded_valid = videoIn_fork_io_outputs_0_valid;
    if(in2fifoAddCond) begin
      in2fifoAdded_valid = 1'b1;
    end
  end

  always @(*) begin
    videoIn_fork_io_outputs_0_ready = in2fifoAdded_ready;
    if(in2fifoAddCond) begin
      videoIn_fork_io_outputs_0_ready = 1'b0;
    end
  end

  assign in2fifoAdded_payload_frame_line_pixel_0 = videoIn_fork_io_outputs_0_payload_frame_line_pixel_0;
  assign in2fifoAdded_payload_frame_line_pixel_1 = videoIn_fork_io_outputs_0_payload_frame_line_pixel_1;
  assign in2fifoAdded_payload_frame_line_pixel_2 = videoIn_fork_io_outputs_0_payload_frame_line_pixel_2;
  assign in2fifoAdded_payload_frame_line_pixel_3 = videoIn_fork_io_outputs_0_payload_frame_line_pixel_3;
  assign in2fifoAdded_payload_frame_line_endOfLine = videoIn_fork_io_outputs_0_payload_frame_line_endOfLine;
  assign in2fifoAdded_payload_frame_endOfFrame = videoIn_fork_io_outputs_0_payload_frame_endOfFrame;
  assign in2fifoAdded_payload_endOfPack = videoIn_fork_io_outputs_0_payload_endOfPack;
  always @(*) begin
    fifo2outThrown_valid = fifo_pop_fork_io_outputs_1_valid;
    if(fifo2outThrowCond) begin
      fifo2outThrown_valid = 1'b0;
    end
  end

  always @(*) begin
    fifo_pop_fork_io_outputs_1_ready = fifo2outThrown_ready;
    if(fifo2outThrowCond) begin
      fifo_pop_fork_io_outputs_1_ready = 1'b1;
    end
  end

  assign fifo2outThrown_payload_0_pixel_0 = fifo_pop_fork_io_outputs_1_payload_0_pixel_0;
  assign fifo2outThrown_payload_0_pixel_1 = fifo_pop_fork_io_outputs_1_payload_0_pixel_1;
  assign fifo2outThrown_payload_0_pixel_2 = fifo_pop_fork_io_outputs_1_payload_0_pixel_2;
  assign fifo2outThrown_payload_0_pixel_3 = fifo_pop_fork_io_outputs_1_payload_0_pixel_3;
  assign fifo2outThrown_payload_0_endOfLine = fifo_pop_fork_io_outputs_1_payload_0_endOfLine;
  assign fifo2outThrown_payload_1_pixel_0 = fifo_pop_fork_io_outputs_1_payload_1_pixel_0;
  assign fifo2outThrown_payload_1_pixel_1 = fifo_pop_fork_io_outputs_1_payload_1_pixel_1;
  assign fifo2outThrown_payload_1_pixel_2 = fifo_pop_fork_io_outputs_1_payload_1_pixel_2;
  assign fifo2outThrown_payload_1_pixel_3 = fifo_pop_fork_io_outputs_1_payload_1_pixel_3;
  assign fifo2outThrown_payload_1_endOfLine = fifo_pop_fork_io_outputs_1_payload_1_endOfLine;
  always @(*) begin
    tmp_feedbackThrownAdded_valid = fifo_pop_fork_io_outputs_0_valid;
    if(feedbackThrowCond) begin
      tmp_feedbackThrownAdded_valid = 1'b0;
    end
  end

  always @(*) begin
    fifo_pop_fork_io_outputs_0_ready = tmp_io_outputs_0_ready;
    if(feedbackThrowCond) begin
      fifo_pop_fork_io_outputs_0_ready = 1'b1;
    end
  end

  always @(*) begin
    feedbackThrownAdded_valid = tmp_feedbackThrownAdded_valid;
    if(feedbackAddCond) begin
      feedbackThrownAdded_valid = 1'b1;
    end
  end

  always @(*) begin
    tmp_io_outputs_0_ready = feedbackThrownAdded_ready;
    if(feedbackAddCond) begin
      tmp_io_outputs_0_ready = 1'b0;
    end
  end

  assign feedbackThrownAdded_payload_0_pixel_0 = fifo_pop_fork_io_outputs_0_payload_0_pixel_0;
  assign feedbackThrownAdded_payload_0_pixel_1 = fifo_pop_fork_io_outputs_0_payload_0_pixel_1;
  assign feedbackThrownAdded_payload_0_pixel_2 = fifo_pop_fork_io_outputs_0_payload_0_pixel_2;
  assign feedbackThrownAdded_payload_0_pixel_3 = fifo_pop_fork_io_outputs_0_payload_0_pixel_3;
  assign feedbackThrownAdded_payload_0_endOfLine = fifo_pop_fork_io_outputs_0_payload_0_endOfLine;
  assign feedbackThrownAdded_payload_1_pixel_0 = fifo_pop_fork_io_outputs_0_payload_1_pixel_0;
  assign feedbackThrownAdded_payload_1_pixel_1 = fifo_pop_fork_io_outputs_0_payload_1_pixel_1;
  assign feedbackThrownAdded_payload_1_pixel_2 = fifo_pop_fork_io_outputs_0_payload_1_pixel_2;
  assign feedbackThrownAdded_payload_1_pixel_3 = fifo_pop_fork_io_outputs_0_payload_1_pixel_3;
  assign feedbackThrownAdded_payload_1_endOfLine = fifo_pop_fork_io_outputs_0_payload_1_endOfLine;
  assign in2fifoJoinFeedback_valid = (in2fifoAdded_valid && feedbackThrownAdded_valid);
  assign in2fifoJoinFeedback_fire = (in2fifoJoinFeedback_valid && in2fifoJoinFeedback_ready);
  assign in2fifoAdded_ready = in2fifoJoinFeedback_fire;
  assign in2fifoJoinFeedback_fire_1 = (in2fifoJoinFeedback_valid && in2fifoJoinFeedback_ready);
  assign feedbackThrownAdded_ready = in2fifoJoinFeedback_fire_1;
  assign in2fifoJoinFeedback_payload__1_frame_line_pixel_0 = in2fifoAdded_payload_frame_line_pixel_0;
  assign in2fifoJoinFeedback_payload__1_frame_line_pixel_1 = in2fifoAdded_payload_frame_line_pixel_1;
  assign in2fifoJoinFeedback_payload__1_frame_line_pixel_2 = in2fifoAdded_payload_frame_line_pixel_2;
  assign in2fifoJoinFeedback_payload__1_frame_line_pixel_3 = in2fifoAdded_payload_frame_line_pixel_3;
  assign in2fifoJoinFeedback_payload__1_frame_line_endOfLine = in2fifoAdded_payload_frame_line_endOfLine;
  assign in2fifoJoinFeedback_payload__1_frame_endOfFrame = in2fifoAdded_payload_frame_endOfFrame;
  assign in2fifoJoinFeedback_payload__1_endOfPack = in2fifoAdded_payload_endOfPack;
  assign in2fifoJoinFeedback_payload__2_0_pixel_0 = feedbackThrownAdded_payload_0_pixel_0;
  assign in2fifoJoinFeedback_payload__2_0_pixel_1 = feedbackThrownAdded_payload_0_pixel_1;
  assign in2fifoJoinFeedback_payload__2_0_pixel_2 = feedbackThrownAdded_payload_0_pixel_2;
  assign in2fifoJoinFeedback_payload__2_0_pixel_3 = feedbackThrownAdded_payload_0_pixel_3;
  assign in2fifoJoinFeedback_payload__2_0_endOfLine = feedbackThrownAdded_payload_0_endOfLine;
  assign in2fifoJoinFeedback_payload__2_1_pixel_0 = feedbackThrownAdded_payload_1_pixel_0;
  assign in2fifoJoinFeedback_payload__2_1_pixel_1 = feedbackThrownAdded_payload_1_pixel_1;
  assign in2fifoJoinFeedback_payload__2_1_pixel_2 = feedbackThrownAdded_payload_1_pixel_2;
  assign in2fifoJoinFeedback_payload__2_1_pixel_3 = feedbackThrownAdded_payload_1_pixel_3;
  assign in2fifoJoinFeedback_payload__2_1_endOfLine = feedbackThrownAdded_payload_1_endOfLine;
  assign in2outJoinFifo2out_valid = (in2outThrownAdded_valid && fifo2outThrown_valid);
  assign in2outJoinFifo2out_fire = (in2outJoinFifo2out_valid && in2outJoinFifo2out_ready);
  assign in2outThrownAdded_ready = in2outJoinFifo2out_fire;
  assign in2outJoinFifo2out_fire_1 = (in2outJoinFifo2out_valid && in2outJoinFifo2out_ready);
  assign fifo2outThrown_ready = in2outJoinFifo2out_fire_1;
  assign in2outJoinFifo2out_payload__1_frame_line_pixel_0 = in2outThrownAdded_payload_frame_line_pixel_0;
  assign in2outJoinFifo2out_payload__1_frame_line_pixel_1 = in2outThrownAdded_payload_frame_line_pixel_1;
  assign in2outJoinFifo2out_payload__1_frame_line_pixel_2 = in2outThrownAdded_payload_frame_line_pixel_2;
  assign in2outJoinFifo2out_payload__1_frame_line_pixel_3 = in2outThrownAdded_payload_frame_line_pixel_3;
  assign in2outJoinFifo2out_payload__1_frame_line_endOfLine = in2outThrownAdded_payload_frame_line_endOfLine;
  assign in2outJoinFifo2out_payload__1_frame_endOfFrame = in2outThrownAdded_payload_frame_endOfFrame;
  assign in2outJoinFifo2out_payload__1_endOfPack = in2outThrownAdded_payload_endOfPack;
  assign in2outJoinFifo2out_payload__2_0_pixel_0 = fifo2outThrown_payload_0_pixel_0;
  assign in2outJoinFifo2out_payload__2_0_pixel_1 = fifo2outThrown_payload_0_pixel_1;
  assign in2outJoinFifo2out_payload__2_0_pixel_2 = fifo2outThrown_payload_0_pixel_2;
  assign in2outJoinFifo2out_payload__2_0_pixel_3 = fifo2outThrown_payload_0_pixel_3;
  assign in2outJoinFifo2out_payload__2_0_endOfLine = fifo2outThrown_payload_0_endOfLine;
  assign in2outJoinFifo2out_payload__2_1_pixel_0 = fifo2outThrown_payload_1_pixel_0;
  assign in2outJoinFifo2out_payload__2_1_pixel_1 = fifo2outThrown_payload_1_pixel_1;
  assign in2outJoinFifo2out_payload__2_1_pixel_2 = fifo2outThrown_payload_1_pixel_2;
  assign in2outJoinFifo2out_payload__2_1_pixel_3 = fifo2outThrown_payload_1_pixel_3;
  assign in2outJoinFifo2out_payload__2_1_endOfLine = fifo2outThrown_payload_1_endOfLine;
  always @(*) begin
    firstFewLines_willIncrement = 1'b0;
    if(when_LineBufferSame_l72) begin
      firstFewLines_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    firstFewLines_willClear = 1'b0;
    if(when_LineBufferSame_l71) begin
      firstFewLines_willClear = 1'b1;
    end
  end

  assign firstFewLines_willOverflowIfInc = (firstFewLines_value == 1'b1);
  assign firstFewLines_willOverflow = (firstFewLines_willOverflowIfInc && firstFewLines_willIncrement);
  always @(*) begin
    firstFewLines_valueNext = (firstFewLines_value + firstFewLines_willIncrement);
    if(firstFewLines_willClear) begin
      firstFewLines_valueNext = 1'b0;
    end
  end

  assign ioVideoInFire = (videoIn_valid && videoIn_ready);
  assign firstLine = (firstFewLines_value == 1'b0);
  assign firstFewLinesWontOverflowIfInc = (! firstFewLines_willOverflowIfInc);
  assign when_LineBufferSame_l71 = (ioVideoInFire && videoIn_payload_endOfPack);
  assign when_LineBufferSame_l72 = ((ioVideoInFire && videoIn_payload_frame_line_endOfLine) && firstFewLinesWontOverflowIfInc);
  always @(*) begin
    lastFewLines_willIncrement = 1'b0;
    if(when_LineBufferSame_l78) begin
      lastFewLines_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    lastFewLines_willClear = 1'b0;
    if(when_LineBufferSame_l77) begin
      lastFewLines_willClear = 1'b1;
    end
  end

  assign lastFewLines_willOverflowIfInc = 1'b1;
  assign lastFewLines_willOverflow = (lastFewLines_willOverflowIfInc && lastFewLines_willIncrement);
  assign ioVideoOutFire = (videoOut_valid && videoOut_ready);
  assign lastFewLinesWontOverflowIfInc = (! lastFewLines_willOverflowIfInc);
  assign when_LineBufferSame_l77 = (ioVideoOutFire && in2outJoinFifo2out_payload__1_frame_endOfFrame);
  assign when_LineBufferSame_l78 = (ioVideoOutFire && in2outJoinFifo2out_payload__2_1_endOfLine);
  assign when_LineBufferSame_l81 = (ioVideoInFire && videoIn_payload_frame_endOfFrame);
  assign when_LineBufferSame_l81_1 = (ioVideoOutFire && videoOut_payload_frame_endOfFrame);
  assign when_LineBufferSame_l83 = (ioVideoInFire && videoIn_payload_endOfPack);
  assign when_LineBufferSame_l83_1 = (ioVideoOutFire && videoOut_payload_endOfPack);
  assign endOfPackGapInv = (! endOfPackGap);
  assign in2outThrowCond = (endOfPackGapInv && firstFewLinesWontOverflowIfInc);
  assign feedbackAddCond = (endOfPackGapInv && firstLine);
  assign fifo2outThrowCond = ((endOfPackGapInv && (! firstLine)) && firstFewLinesWontOverflowIfInc);
  assign in2outAddCond = endOfPackGap;
  assign feedbackThrowCond = (endOfPackGap && lastFewLines_willOverflowIfInc);
  assign in2fifoAddCond = (endOfPackGap && lastFewLinesWontOverflowIfInc);
  assign in2fifoJoinFeedback_ready = fifo_push_ready;
  assign cntPrevStable = (cntPrev == 2'b01);
  assign cntPostStable = (cntPost == 2'b01);
  assign cntPrevEqualVec_0 = ((2'b00 <= cntPrev) && (cntPrev < 2'b01));
  assign cntPostEqualVec_0 = (cntPost <= 2'b00);
  assign when_LineBufferSame_l103 = (ioVideoInFire && videoIn_payload_frame_endOfFrame);
  assign when_LineBufferSame_l104 = (ioVideoOutFire && videoOut_payload_frame_endOfFrame);
  assign when_LineBufferSame_l105 = ((ioVideoOutFire && videoOut_payload_frame_line_endOfLine) && (! cntPrevStable));
  assign when_LineBufferSame_l106 = ((ioVideoOutFire && videoOut_payload_frame_line_endOfLine) && (! cntPostStable));
  assign up_0_0 = (cntPostEqualVec_0 ? zero_0 : in2outJoinFifo2out_payload__2_0_pixel_0);
  assign up_0_1 = (cntPostEqualVec_0 ? zero_1 : in2outJoinFifo2out_payload__2_0_pixel_1);
  assign up_0_2 = (cntPostEqualVec_0 ? zero_2 : in2outJoinFifo2out_payload__2_0_pixel_2);
  assign up_0_3 = (cntPostEqualVec_0 ? zero_3 : in2outJoinFifo2out_payload__2_0_pixel_3);
  assign down_0_0 = (cntPrevEqualVec_0 ? zero_0 : in2outJoinFifo2out_payload__1_frame_line_pixel_0);
  assign down_0_1 = (cntPrevEqualVec_0 ? zero_1 : in2outJoinFifo2out_payload__1_frame_line_pixel_1);
  assign down_0_2 = (cntPrevEqualVec_0 ? zero_2 : in2outJoinFifo2out_payload__1_frame_line_pixel_2);
  assign down_0_3 = (cntPrevEqualVec_0 ? zero_3 : in2outJoinFifo2out_payload__1_frame_line_pixel_3);
  assign videoOut_valid = in2outJoinFifo2out_valid;
  assign in2outJoinFifo2out_ready = videoOut_ready;
  assign videoOut_payload_endOfPack = ((endOfPackGap && videoOut_payload_frame_line_endOfLine) && lastFewLines_willOverflowIfInc);
  assign videoOut_payload_frame_endOfFrame = ((endOfFrameGap && videoOut_payload_frame_line_endOfLine) && lastFewLines_willOverflowIfInc);
  assign videoOut_payload_frame_line_pixel_0_0 = up_0_0;
  assign videoOut_payload_frame_line_pixel_0_1 = up_0_1;
  assign videoOut_payload_frame_line_pixel_0_2 = up_0_2;
  assign videoOut_payload_frame_line_pixel_0_3 = up_0_3;
  assign videoOut_payload_frame_line_pixel_1_0 = in2outJoinFifo2out_payload__2_1_pixel_0;
  assign videoOut_payload_frame_line_pixel_1_1 = in2outJoinFifo2out_payload__2_1_pixel_1;
  assign videoOut_payload_frame_line_pixel_1_2 = in2outJoinFifo2out_payload__2_1_pixel_2;
  assign videoOut_payload_frame_line_pixel_1_3 = in2outJoinFifo2out_payload__2_1_pixel_3;
  assign videoOut_payload_frame_line_pixel_2_0 = down_0_0;
  assign videoOut_payload_frame_line_pixel_2_1 = down_0_1;
  assign videoOut_payload_frame_line_pixel_2_2 = down_0_2;
  assign videoOut_payload_frame_line_pixel_2_3 = down_0_3;
  assign videoOut_payload_frame_line_endOfLine = in2outJoinFifo2out_payload__2_1_endOfLine;
  always @(posedge clk) begin
    if(reset) begin
      firstFewLines_value <= 1'b0;
      endOfFrameGap <= 1'b0;
      endOfPackGap <= 1'b0;
      cntPrev <= 2'b01;
      cntPost <= 2'b00;
    end else begin
      firstFewLines_value <= firstFewLines_valueNext;
      if(when_LineBufferSame_l81) begin
        endOfFrameGap <= 1'b1;
      end
      if(when_LineBufferSame_l81_1) begin
        endOfFrameGap <= 1'b0;
      end
      if(when_LineBufferSame_l83) begin
        endOfPackGap <= 1'b1;
      end
      if(when_LineBufferSame_l83_1) begin
        endOfPackGap <= 1'b0;
      end
      if(when_LineBufferSame_l103) begin
        cntPrev <= 2'b00;
      end
      if(when_LineBufferSame_l104) begin
        cntPost <= 2'b00;
      end
      if(when_LineBufferSame_l105) begin
        cntPrev <= (cntPrev + 2'b01);
      end
      if(when_LineBufferSame_l106) begin
        cntPost <= (cntPost + 2'b01);
      end
    end
  end


endmodule

module PixelBufferValid (
  input               videoIn_valid,
  output              videoIn_ready,
  input      [7:0]    videoIn_payload_frame_line_pixel_0_0,
  input      [7:0]    videoIn_payload_frame_line_pixel_0_1,
  input      [7:0]    videoIn_payload_frame_line_pixel_0_2,
  input      [7:0]    videoIn_payload_frame_line_pixel_0_3,
  input      [7:0]    videoIn_payload_frame_line_pixel_1_0,
  input      [7:0]    videoIn_payload_frame_line_pixel_1_1,
  input      [7:0]    videoIn_payload_frame_line_pixel_1_2,
  input      [7:0]    videoIn_payload_frame_line_pixel_1_3,
  input               videoIn_payload_frame_line_endOfLine,
  input               videoIn_payload_frame_endOfFrame,
  input               videoIn_payload_endOfPack,
  output              videoOut_valid,
  input               videoOut_ready,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1_3,
  output              videoOut_payload_frame_line_endOfLine,
  output              videoOut_payload_frame_endOfFrame,
  output              videoOut_payload_endOfPack,
  input               clk,
  input               reset
);

  wire                videoInFire;
  wire                videoOutFire;
  reg        [63:0]   pixelBuffer;
  wire                bridge_valid;
  reg                 bridge_ready;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_0_0;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_0_1;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_0_2;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_0_3;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_1_0;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_1_1;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_1_2;
  wire       [7:0]    bridge_payload_frame_line_pixel_0_1_3;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_0_0;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_0_1;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_0_2;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_0_3;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_1_0;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_1_1;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_1_2;
  wire       [7:0]    bridge_payload_frame_line_pixel_1_1_3;
  wire                bridge_payload_frame_line_endOfLine;
  wire                bridge_payload_frame_endOfFrame;
  wire                bridge_payload_endOfPack;
  wire                bridgeFire;
  reg                 pixelCnt_willIncrement;
  reg                 pixelCnt_willClear;
  reg        [0:0]    pixelCnt_valueNext;
  reg        [0:0]    pixelCnt_value;
  wire                pixelCnt_willOverflowIfInc;
  wire                pixelCnt_willOverflow;
  wire                pixelCntWontOverflowIfInc;
  wire                when_PixelBufferValid_l32;
  wire                when_PixelBufferValid_l33;
  wire       [7:0]    pixelVec_0_0_0;
  wire       [7:0]    pixelVec_0_0_1;
  wire       [7:0]    pixelVec_0_0_2;
  wire       [7:0]    pixelVec_0_0_3;
  wire       [7:0]    pixelVec_0_1_0;
  wire       [7:0]    pixelVec_0_1_1;
  wire       [7:0]    pixelVec_0_1_2;
  wire       [7:0]    pixelVec_0_1_3;
  wire       [7:0]    pixelVec_1_0_0;
  wire       [7:0]    pixelVec_1_0_1;
  wire       [7:0]    pixelVec_1_0_2;
  wire       [7:0]    pixelVec_1_0_3;
  wire       [7:0]    pixelVec_1_1_0;
  wire       [7:0]    pixelVec_1_1_1;
  wire       [7:0]    pixelVec_1_1_2;
  wire       [7:0]    pixelVec_1_1_3;
  wire       [127:0]  tmp_pixelVec_0_0_0;
  wire       [63:0]   tmp_pixelVec_0_0_0_1;
  wire       [31:0]   tmp_pixelVec_0_0_0_2;
  wire       [31:0]   tmp_pixelVec_0_1_0;
  wire       [63:0]   tmp_pixelVec_1_0_0;
  wire       [31:0]   tmp_pixelVec_1_0_0_1;
  wire       [31:0]   tmp_pixelVec_1_1_0;
  reg                 bridge_thrown_valid;
  wire                bridge_thrown_ready;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_0_0_0;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_0_0_1;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_0_0_2;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_0_0_3;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_0_1_0;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_0_1_1;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_0_1_2;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_0_1_3;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_1_0_0;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_1_0_1;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_1_0_2;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_1_0_3;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_1_1_0;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_1_1_1;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_1_1_2;
  wire       [7:0]    bridge_thrown_payload_frame_line_pixel_1_1_3;
  wire                bridge_thrown_payload_frame_line_endOfLine;
  wire                bridge_thrown_payload_frame_endOfFrame;
  wire                bridge_thrown_payload_endOfPack;

  assign videoInFire = (videoIn_valid && videoIn_ready);
  assign videoOutFire = (videoOut_valid && videoOut_ready);
  assign bridgeFire = (bridge_valid && bridge_ready);
  assign bridge_valid = videoIn_valid;
  assign videoIn_ready = bridge_ready;
  always @(*) begin
    pixelCnt_willIncrement = 1'b0;
    if(when_PixelBufferValid_l33) begin
      pixelCnt_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    pixelCnt_willClear = 1'b0;
    if(when_PixelBufferValid_l32) begin
      pixelCnt_willClear = 1'b1;
    end
  end

  assign pixelCnt_willOverflowIfInc = (pixelCnt_value == 1'b1);
  assign pixelCnt_willOverflow = (pixelCnt_willOverflowIfInc && pixelCnt_willIncrement);
  always @(*) begin
    pixelCnt_valueNext = (pixelCnt_value + pixelCnt_willIncrement);
    if(pixelCnt_willClear) begin
      pixelCnt_valueNext = 1'b0;
    end
  end

  assign pixelCntWontOverflowIfInc = (! pixelCnt_willOverflowIfInc);
  assign when_PixelBufferValid_l32 = (videoInFire && videoIn_payload_frame_line_endOfLine);
  assign when_PixelBufferValid_l33 = (videoInFire && pixelCntWontOverflowIfInc);
  assign tmp_pixelVec_0_0_0 = {{{videoIn_payload_frame_line_pixel_1_3,{videoIn_payload_frame_line_pixel_1_2,{videoIn_payload_frame_line_pixel_1_1,videoIn_payload_frame_line_pixel_1_0}}},{videoIn_payload_frame_line_pixel_0_3,{videoIn_payload_frame_line_pixel_0_2,{videoIn_payload_frame_line_pixel_0_1,videoIn_payload_frame_line_pixel_0_0}}}},pixelBuffer};
  assign tmp_pixelVec_0_0_0_1 = tmp_pixelVec_0_0_0[63 : 0];
  assign tmp_pixelVec_0_0_0_2 = tmp_pixelVec_0_0_0_1[31 : 0];
  assign pixelVec_0_0_0 = tmp_pixelVec_0_0_0_2[7 : 0];
  assign pixelVec_0_0_1 = tmp_pixelVec_0_0_0_2[15 : 8];
  assign pixelVec_0_0_2 = tmp_pixelVec_0_0_0_2[23 : 16];
  assign pixelVec_0_0_3 = tmp_pixelVec_0_0_0_2[31 : 24];
  assign tmp_pixelVec_0_1_0 = tmp_pixelVec_0_0_0_1[63 : 32];
  assign pixelVec_0_1_0 = tmp_pixelVec_0_1_0[7 : 0];
  assign pixelVec_0_1_1 = tmp_pixelVec_0_1_0[15 : 8];
  assign pixelVec_0_1_2 = tmp_pixelVec_0_1_0[23 : 16];
  assign pixelVec_0_1_3 = tmp_pixelVec_0_1_0[31 : 24];
  assign tmp_pixelVec_1_0_0 = tmp_pixelVec_0_0_0[127 : 64];
  assign tmp_pixelVec_1_0_0_1 = tmp_pixelVec_1_0_0[31 : 0];
  assign pixelVec_1_0_0 = tmp_pixelVec_1_0_0_1[7 : 0];
  assign pixelVec_1_0_1 = tmp_pixelVec_1_0_0_1[15 : 8];
  assign pixelVec_1_0_2 = tmp_pixelVec_1_0_0_1[23 : 16];
  assign pixelVec_1_0_3 = tmp_pixelVec_1_0_0_1[31 : 24];
  assign tmp_pixelVec_1_1_0 = tmp_pixelVec_1_0_0[63 : 32];
  assign pixelVec_1_1_0 = tmp_pixelVec_1_1_0[7 : 0];
  assign pixelVec_1_1_1 = tmp_pixelVec_1_1_0[15 : 8];
  assign pixelVec_1_1_2 = tmp_pixelVec_1_1_0[23 : 16];
  assign pixelVec_1_1_3 = tmp_pixelVec_1_1_0[31 : 24];
  assign bridge_payload_endOfPack = videoIn_payload_endOfPack;
  assign bridge_payload_frame_endOfFrame = videoIn_payload_frame_endOfFrame;
  assign bridge_payload_frame_line_endOfLine = videoIn_payload_frame_line_endOfLine;
  assign bridge_payload_frame_line_pixel_0_0_0 = pixelVec_0_0_0;
  assign bridge_payload_frame_line_pixel_0_0_1 = pixelVec_0_0_1;
  assign bridge_payload_frame_line_pixel_0_0_2 = pixelVec_0_0_2;
  assign bridge_payload_frame_line_pixel_0_0_3 = pixelVec_0_0_3;
  assign bridge_payload_frame_line_pixel_0_1_0 = pixelVec_0_1_0;
  assign bridge_payload_frame_line_pixel_0_1_1 = pixelVec_0_1_1;
  assign bridge_payload_frame_line_pixel_0_1_2 = pixelVec_0_1_2;
  assign bridge_payload_frame_line_pixel_0_1_3 = pixelVec_0_1_3;
  assign bridge_payload_frame_line_pixel_1_0_0 = pixelVec_1_0_0;
  assign bridge_payload_frame_line_pixel_1_0_1 = pixelVec_1_0_1;
  assign bridge_payload_frame_line_pixel_1_0_2 = pixelVec_1_0_2;
  assign bridge_payload_frame_line_pixel_1_0_3 = pixelVec_1_0_3;
  assign bridge_payload_frame_line_pixel_1_1_0 = pixelVec_1_1_0;
  assign bridge_payload_frame_line_pixel_1_1_1 = pixelVec_1_1_1;
  assign bridge_payload_frame_line_pixel_1_1_2 = pixelVec_1_1_2;
  assign bridge_payload_frame_line_pixel_1_1_3 = pixelVec_1_1_3;
  always @(*) begin
    bridge_thrown_valid = bridge_valid;
    if(pixelCntWontOverflowIfInc) begin
      bridge_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    bridge_ready = bridge_thrown_ready;
    if(pixelCntWontOverflowIfInc) begin
      bridge_ready = 1'b1;
    end
  end

  assign bridge_thrown_payload_frame_line_pixel_0_0_0 = bridge_payload_frame_line_pixel_0_0_0;
  assign bridge_thrown_payload_frame_line_pixel_0_0_1 = bridge_payload_frame_line_pixel_0_0_1;
  assign bridge_thrown_payload_frame_line_pixel_0_0_2 = bridge_payload_frame_line_pixel_0_0_2;
  assign bridge_thrown_payload_frame_line_pixel_0_0_3 = bridge_payload_frame_line_pixel_0_0_3;
  assign bridge_thrown_payload_frame_line_pixel_0_1_0 = bridge_payload_frame_line_pixel_0_1_0;
  assign bridge_thrown_payload_frame_line_pixel_0_1_1 = bridge_payload_frame_line_pixel_0_1_1;
  assign bridge_thrown_payload_frame_line_pixel_0_1_2 = bridge_payload_frame_line_pixel_0_1_2;
  assign bridge_thrown_payload_frame_line_pixel_0_1_3 = bridge_payload_frame_line_pixel_0_1_3;
  assign bridge_thrown_payload_frame_line_pixel_1_0_0 = bridge_payload_frame_line_pixel_1_0_0;
  assign bridge_thrown_payload_frame_line_pixel_1_0_1 = bridge_payload_frame_line_pixel_1_0_1;
  assign bridge_thrown_payload_frame_line_pixel_1_0_2 = bridge_payload_frame_line_pixel_1_0_2;
  assign bridge_thrown_payload_frame_line_pixel_1_0_3 = bridge_payload_frame_line_pixel_1_0_3;
  assign bridge_thrown_payload_frame_line_pixel_1_1_0 = bridge_payload_frame_line_pixel_1_1_0;
  assign bridge_thrown_payload_frame_line_pixel_1_1_1 = bridge_payload_frame_line_pixel_1_1_1;
  assign bridge_thrown_payload_frame_line_pixel_1_1_2 = bridge_payload_frame_line_pixel_1_1_2;
  assign bridge_thrown_payload_frame_line_pixel_1_1_3 = bridge_payload_frame_line_pixel_1_1_3;
  assign bridge_thrown_payload_frame_line_endOfLine = bridge_payload_frame_line_endOfLine;
  assign bridge_thrown_payload_frame_endOfFrame = bridge_payload_frame_endOfFrame;
  assign bridge_thrown_payload_endOfPack = bridge_payload_endOfPack;
  assign videoOut_valid = bridge_thrown_valid;
  assign bridge_thrown_ready = videoOut_ready;
  assign videoOut_payload_frame_line_pixel_0_0_0 = bridge_thrown_payload_frame_line_pixel_0_0_0;
  assign videoOut_payload_frame_line_pixel_0_0_1 = bridge_thrown_payload_frame_line_pixel_0_0_1;
  assign videoOut_payload_frame_line_pixel_0_0_2 = bridge_thrown_payload_frame_line_pixel_0_0_2;
  assign videoOut_payload_frame_line_pixel_0_0_3 = bridge_thrown_payload_frame_line_pixel_0_0_3;
  assign videoOut_payload_frame_line_pixel_0_1_0 = bridge_thrown_payload_frame_line_pixel_0_1_0;
  assign videoOut_payload_frame_line_pixel_0_1_1 = bridge_thrown_payload_frame_line_pixel_0_1_1;
  assign videoOut_payload_frame_line_pixel_0_1_2 = bridge_thrown_payload_frame_line_pixel_0_1_2;
  assign videoOut_payload_frame_line_pixel_0_1_3 = bridge_thrown_payload_frame_line_pixel_0_1_3;
  assign videoOut_payload_frame_line_pixel_1_0_0 = bridge_thrown_payload_frame_line_pixel_1_0_0;
  assign videoOut_payload_frame_line_pixel_1_0_1 = bridge_thrown_payload_frame_line_pixel_1_0_1;
  assign videoOut_payload_frame_line_pixel_1_0_2 = bridge_thrown_payload_frame_line_pixel_1_0_2;
  assign videoOut_payload_frame_line_pixel_1_0_3 = bridge_thrown_payload_frame_line_pixel_1_0_3;
  assign videoOut_payload_frame_line_pixel_1_1_0 = bridge_thrown_payload_frame_line_pixel_1_1_0;
  assign videoOut_payload_frame_line_pixel_1_1_1 = bridge_thrown_payload_frame_line_pixel_1_1_1;
  assign videoOut_payload_frame_line_pixel_1_1_2 = bridge_thrown_payload_frame_line_pixel_1_1_2;
  assign videoOut_payload_frame_line_pixel_1_1_3 = bridge_thrown_payload_frame_line_pixel_1_1_3;
  assign videoOut_payload_frame_line_endOfLine = bridge_thrown_payload_frame_line_endOfLine;
  assign videoOut_payload_frame_endOfFrame = bridge_thrown_payload_frame_endOfFrame;
  assign videoOut_payload_endOfPack = bridge_thrown_payload_endOfPack;
  always @(posedge clk) begin
    if(videoInFire) begin
      pixelBuffer <= {{videoIn_payload_frame_line_pixel_1_3,{videoIn_payload_frame_line_pixel_1_2,{videoIn_payload_frame_line_pixel_1_1,videoIn_payload_frame_line_pixel_1_0}}},{videoIn_payload_frame_line_pixel_0_3,{videoIn_payload_frame_line_pixel_0_2,{videoIn_payload_frame_line_pixel_0_1,videoIn_payload_frame_line_pixel_0_0}}}};
    end
  end

  always @(posedge clk) begin
    if(reset) begin
      pixelCnt_value <= 1'b0;
    end else begin
      pixelCnt_value <= pixelCnt_valueNext;
    end
  end


endmodule

module LineBufferValid (
  input               videoIn_valid,
  output              videoIn_ready,
  input      [7:0]    videoIn_payload_frame_line_pixel_0,
  input      [7:0]    videoIn_payload_frame_line_pixel_1,
  input      [7:0]    videoIn_payload_frame_line_pixel_2,
  input      [7:0]    videoIn_payload_frame_line_pixel_3,
  input               videoIn_payload_frame_line_endOfLine,
  input               videoIn_payload_frame_endOfFrame,
  input               videoIn_payload_endOfPack,
  output              videoOut_valid,
  input               videoOut_ready,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_0_3,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_0,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_1,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_2,
  output     [7:0]    videoOut_payload_frame_line_pixel_1_3,
  output              videoOut_payload_frame_line_endOfLine,
  output              videoOut_payload_frame_endOfFrame,
  output              videoOut_payload_endOfPack,
  input               clk,
  input               reset
);

  wire                fifo_flush;
  reg                 videoIn_fork_io_outputs_1_ready;
  reg                 fifo_pop_fork_io_outputs_0_ready;
  wire                fifo_push_ready;
  wire                fifo_pop_valid;
  wire       [7:0]    fifo_pop_payload_0_pixel_0;
  wire       [7:0]    fifo_pop_payload_0_pixel_1;
  wire       [7:0]    fifo_pop_payload_0_pixel_2;
  wire       [7:0]    fifo_pop_payload_0_pixel_3;
  wire                fifo_pop_payload_0_endOfLine;
  wire                videoIn_fork_io_input_ready;
  wire                videoIn_fork_io_outputs_0_valid;
  wire       [7:0]    videoIn_fork_io_outputs_0_payload_frame_line_pixel_0;
  wire       [7:0]    videoIn_fork_io_outputs_0_payload_frame_line_pixel_1;
  wire       [7:0]    videoIn_fork_io_outputs_0_payload_frame_line_pixel_2;
  wire       [7:0]    videoIn_fork_io_outputs_0_payload_frame_line_pixel_3;
  wire                videoIn_fork_io_outputs_0_payload_frame_line_endOfLine;
  wire                videoIn_fork_io_outputs_0_payload_frame_endOfFrame;
  wire                videoIn_fork_io_outputs_0_payload_endOfPack;
  wire                videoIn_fork_io_outputs_1_valid;
  wire       [7:0]    videoIn_fork_io_outputs_1_payload_frame_line_pixel_0;
  wire       [7:0]    videoIn_fork_io_outputs_1_payload_frame_line_pixel_1;
  wire       [7:0]    videoIn_fork_io_outputs_1_payload_frame_line_pixel_2;
  wire       [7:0]    videoIn_fork_io_outputs_1_payload_frame_line_pixel_3;
  wire                videoIn_fork_io_outputs_1_payload_frame_line_endOfLine;
  wire                videoIn_fork_io_outputs_1_payload_frame_endOfFrame;
  wire                videoIn_fork_io_outputs_1_payload_endOfPack;
  wire                fifo_pop_fork_io_input_ready;
  wire                fifo_pop_fork_io_outputs_0_valid;
  wire       [7:0]    fifo_pop_fork_io_outputs_0_payload_0_pixel_0;
  wire       [7:0]    fifo_pop_fork_io_outputs_0_payload_0_pixel_1;
  wire       [7:0]    fifo_pop_fork_io_outputs_0_payload_0_pixel_2;
  wire       [7:0]    fifo_pop_fork_io_outputs_0_payload_0_pixel_3;
  wire                fifo_pop_fork_io_outputs_0_payload_0_endOfLine;
  wire                fifo_pop_fork_io_outputs_1_valid;
  wire       [7:0]    fifo_pop_fork_io_outputs_1_payload_0_pixel_0;
  wire       [7:0]    fifo_pop_fork_io_outputs_1_payload_0_pixel_1;
  wire       [7:0]    fifo_pop_fork_io_outputs_1_payload_0_pixel_2;
  wire       [7:0]    fifo_pop_fork_io_outputs_1_payload_0_pixel_3;
  wire                fifo_pop_fork_io_outputs_1_payload_0_endOfLine;
  wire                in2outThrowCond;
  wire                feedbackAddCond;
  reg                 in2outThrown_valid;
  wire                in2outThrown_ready;
  wire       [7:0]    in2outThrown_payload_frame_line_pixel_0;
  wire       [7:0]    in2outThrown_payload_frame_line_pixel_1;
  wire       [7:0]    in2outThrown_payload_frame_line_pixel_2;
  wire       [7:0]    in2outThrown_payload_frame_line_pixel_3;
  wire                in2outThrown_payload_frame_line_endOfLine;
  wire                in2outThrown_payload_frame_endOfFrame;
  wire                in2outThrown_payload_endOfPack;
  reg                 feedbackAdded_valid;
  wire                feedbackAdded_ready;
  wire       [7:0]    feedbackAdded_payload_0_pixel_0;
  wire       [7:0]    feedbackAdded_payload_0_pixel_1;
  wire       [7:0]    feedbackAdded_payload_0_pixel_2;
  wire       [7:0]    feedbackAdded_payload_0_pixel_3;
  wire                feedbackAdded_payload_0_endOfLine;
  wire                in2fifoJoinFeedback_valid;
  wire                in2fifoJoinFeedback_ready;
  wire       [7:0]    in2fifoJoinFeedback_payload__1_frame_line_pixel_0;
  wire       [7:0]    in2fifoJoinFeedback_payload__1_frame_line_pixel_1;
  wire       [7:0]    in2fifoJoinFeedback_payload__1_frame_line_pixel_2;
  wire       [7:0]    in2fifoJoinFeedback_payload__1_frame_line_pixel_3;
  wire                in2fifoJoinFeedback_payload__1_frame_line_endOfLine;
  wire                in2fifoJoinFeedback_payload__1_frame_endOfFrame;
  wire                in2fifoJoinFeedback_payload__1_endOfPack;
  wire       [7:0]    in2fifoJoinFeedback_payload__2_0_pixel_0;
  wire       [7:0]    in2fifoJoinFeedback_payload__2_0_pixel_1;
  wire       [7:0]    in2fifoJoinFeedback_payload__2_0_pixel_2;
  wire       [7:0]    in2fifoJoinFeedback_payload__2_0_pixel_3;
  wire                in2fifoJoinFeedback_payload__2_0_endOfLine;
  wire                in2fifoJoinFeedback_fire;
  wire                in2fifoJoinFeedback_fire_1;
  wire                in2outJoinFifo2out_valid;
  wire                in2outJoinFifo2out_ready;
  wire       [7:0]    in2outJoinFifo2out_payload__1_frame_line_pixel_0;
  wire       [7:0]    in2outJoinFifo2out_payload__1_frame_line_pixel_1;
  wire       [7:0]    in2outJoinFifo2out_payload__1_frame_line_pixel_2;
  wire       [7:0]    in2outJoinFifo2out_payload__1_frame_line_pixel_3;
  wire                in2outJoinFifo2out_payload__1_frame_line_endOfLine;
  wire                in2outJoinFifo2out_payload__1_frame_endOfFrame;
  wire                in2outJoinFifo2out_payload__1_endOfPack;
  wire       [7:0]    in2outJoinFifo2out_payload__2_0_pixel_0;
  wire       [7:0]    in2outJoinFifo2out_payload__2_0_pixel_1;
  wire       [7:0]    in2outJoinFifo2out_payload__2_0_pixel_2;
  wire       [7:0]    in2outJoinFifo2out_payload__2_0_pixel_3;
  wire                in2outJoinFifo2out_payload__2_0_endOfLine;
  wire                in2outJoinFifo2out_fire;
  wire                in2outJoinFifo2out_fire_1;
  wire                ioVideoInFire;
  reg                 lineCnt_willIncrement;
  reg                 lineCnt_willClear;
  reg        [0:0]    lineCnt_valueNext;
  reg        [0:0]    lineCnt_value;
  wire                lineCnt_willOverflowIfInc;
  wire                lineCnt_willOverflow;
  wire                lineCntWontOverflowIfInc;
  wire                when_LineBufferValid_l58;
  wire                when_LineBufferValid_l59;

  StreamFifoHighPerf fifo (
    .push_valid                  (in2fifoJoinFeedback_valid                               ), //i
    .push_ready                  (fifo_push_ready                                         ), //o
    .push_payload_0_pixel_0      (in2fifoJoinFeedback_payload__1_frame_line_pixel_0[7:0]  ), //i
    .push_payload_0_pixel_1      (in2fifoJoinFeedback_payload__1_frame_line_pixel_1[7:0]  ), //i
    .push_payload_0_pixel_2      (in2fifoJoinFeedback_payload__1_frame_line_pixel_2[7:0]  ), //i
    .push_payload_0_pixel_3      (in2fifoJoinFeedback_payload__1_frame_line_pixel_3[7:0]  ), //i
    .push_payload_0_endOfLine    (in2fifoJoinFeedback_payload__1_frame_line_endOfLine     ), //i
    .pop_valid                   (fifo_pop_valid                                          ), //o
    .pop_ready                   (fifo_pop_fork_io_input_ready                            ), //i
    .pop_payload_0_pixel_0       (fifo_pop_payload_0_pixel_0[7:0]                         ), //o
    .pop_payload_0_pixel_1       (fifo_pop_payload_0_pixel_1[7:0]                         ), //o
    .pop_payload_0_pixel_2       (fifo_pop_payload_0_pixel_2[7:0]                         ), //o
    .pop_payload_0_pixel_3       (fifo_pop_payload_0_pixel_3[7:0]                         ), //o
    .pop_payload_0_endOfLine     (fifo_pop_payload_0_endOfLine                            ), //o
    .flush                       (fifo_flush                                              ), //i
    .clk                         (clk                                                     ), //i
    .reset                       (reset                                                   )  //i
  );
  StreamFork videoIn_fork (
    .io_input_valid                               (videoIn_valid                                              ), //i
    .io_input_ready                               (videoIn_fork_io_input_ready                                ), //o
    .io_input_payload_frame_line_pixel_0          (videoIn_payload_frame_line_pixel_0[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_1          (videoIn_payload_frame_line_pixel_1[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_2          (videoIn_payload_frame_line_pixel_2[7:0]                    ), //i
    .io_input_payload_frame_line_pixel_3          (videoIn_payload_frame_line_pixel_3[7:0]                    ), //i
    .io_input_payload_frame_line_endOfLine        (videoIn_payload_frame_line_endOfLine                       ), //i
    .io_input_payload_frame_endOfFrame            (videoIn_payload_frame_endOfFrame                           ), //i
    .io_input_payload_endOfPack                   (videoIn_payload_endOfPack                                  ), //i
    .io_outputs_0_valid                           (videoIn_fork_io_outputs_0_valid                            ), //o
    .io_outputs_0_ready                           (in2fifoJoinFeedback_fire                                   ), //i
    .io_outputs_0_payload_frame_line_pixel_0      (videoIn_fork_io_outputs_0_payload_frame_line_pixel_0[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_1      (videoIn_fork_io_outputs_0_payload_frame_line_pixel_1[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_2      (videoIn_fork_io_outputs_0_payload_frame_line_pixel_2[7:0]  ), //o
    .io_outputs_0_payload_frame_line_pixel_3      (videoIn_fork_io_outputs_0_payload_frame_line_pixel_3[7:0]  ), //o
    .io_outputs_0_payload_frame_line_endOfLine    (videoIn_fork_io_outputs_0_payload_frame_line_endOfLine     ), //o
    .io_outputs_0_payload_frame_endOfFrame        (videoIn_fork_io_outputs_0_payload_frame_endOfFrame         ), //o
    .io_outputs_0_payload_endOfPack               (videoIn_fork_io_outputs_0_payload_endOfPack                ), //o
    .io_outputs_1_valid                           (videoIn_fork_io_outputs_1_valid                            ), //o
    .io_outputs_1_ready                           (videoIn_fork_io_outputs_1_ready                            ), //i
    .io_outputs_1_payload_frame_line_pixel_0      (videoIn_fork_io_outputs_1_payload_frame_line_pixel_0[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_1      (videoIn_fork_io_outputs_1_payload_frame_line_pixel_1[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_2      (videoIn_fork_io_outputs_1_payload_frame_line_pixel_2[7:0]  ), //o
    .io_outputs_1_payload_frame_line_pixel_3      (videoIn_fork_io_outputs_1_payload_frame_line_pixel_3[7:0]  ), //o
    .io_outputs_1_payload_frame_line_endOfLine    (videoIn_fork_io_outputs_1_payload_frame_line_endOfLine     ), //o
    .io_outputs_1_payload_frame_endOfFrame        (videoIn_fork_io_outputs_1_payload_frame_endOfFrame         ), //o
    .io_outputs_1_payload_endOfPack               (videoIn_fork_io_outputs_1_payload_endOfPack                ), //o
    .clk                                          (clk                                                        ), //i
    .reset                                        (reset                                                      )  //i
  );
  StreamFork_1 fifo_pop_fork (
    .io_input_valid                      (fifo_pop_valid                                     ), //i
    .io_input_ready                      (fifo_pop_fork_io_input_ready                       ), //o
    .io_input_payload_0_pixel_0          (fifo_pop_payload_0_pixel_0[7:0]                    ), //i
    .io_input_payload_0_pixel_1          (fifo_pop_payload_0_pixel_1[7:0]                    ), //i
    .io_input_payload_0_pixel_2          (fifo_pop_payload_0_pixel_2[7:0]                    ), //i
    .io_input_payload_0_pixel_3          (fifo_pop_payload_0_pixel_3[7:0]                    ), //i
    .io_input_payload_0_endOfLine        (fifo_pop_payload_0_endOfLine                       ), //i
    .io_outputs_0_valid                  (fifo_pop_fork_io_outputs_0_valid                   ), //o
    .io_outputs_0_ready                  (fifo_pop_fork_io_outputs_0_ready                   ), //i
    .io_outputs_0_payload_0_pixel_0      (fifo_pop_fork_io_outputs_0_payload_0_pixel_0[7:0]  ), //o
    .io_outputs_0_payload_0_pixel_1      (fifo_pop_fork_io_outputs_0_payload_0_pixel_1[7:0]  ), //o
    .io_outputs_0_payload_0_pixel_2      (fifo_pop_fork_io_outputs_0_payload_0_pixel_2[7:0]  ), //o
    .io_outputs_0_payload_0_pixel_3      (fifo_pop_fork_io_outputs_0_payload_0_pixel_3[7:0]  ), //o
    .io_outputs_0_payload_0_endOfLine    (fifo_pop_fork_io_outputs_0_payload_0_endOfLine     ), //o
    .io_outputs_1_valid                  (fifo_pop_fork_io_outputs_1_valid                   ), //o
    .io_outputs_1_ready                  (in2outJoinFifo2out_fire_1                          ), //i
    .io_outputs_1_payload_0_pixel_0      (fifo_pop_fork_io_outputs_1_payload_0_pixel_0[7:0]  ), //o
    .io_outputs_1_payload_0_pixel_1      (fifo_pop_fork_io_outputs_1_payload_0_pixel_1[7:0]  ), //o
    .io_outputs_1_payload_0_pixel_2      (fifo_pop_fork_io_outputs_1_payload_0_pixel_2[7:0]  ), //o
    .io_outputs_1_payload_0_pixel_3      (fifo_pop_fork_io_outputs_1_payload_0_pixel_3[7:0]  ), //o
    .io_outputs_1_payload_0_endOfLine    (fifo_pop_fork_io_outputs_1_payload_0_endOfLine     ), //o
    .clk                                 (clk                                                ), //i
    .reset                               (reset                                              )  //i
  );
  assign videoIn_ready = videoIn_fork_io_input_ready;
  always @(*) begin
    in2outThrown_valid = videoIn_fork_io_outputs_1_valid;
    if(in2outThrowCond) begin
      in2outThrown_valid = 1'b0;
    end
  end

  always @(*) begin
    videoIn_fork_io_outputs_1_ready = in2outThrown_ready;
    if(in2outThrowCond) begin
      videoIn_fork_io_outputs_1_ready = 1'b1;
    end
  end

  assign in2outThrown_payload_frame_line_pixel_0 = videoIn_fork_io_outputs_1_payload_frame_line_pixel_0;
  assign in2outThrown_payload_frame_line_pixel_1 = videoIn_fork_io_outputs_1_payload_frame_line_pixel_1;
  assign in2outThrown_payload_frame_line_pixel_2 = videoIn_fork_io_outputs_1_payload_frame_line_pixel_2;
  assign in2outThrown_payload_frame_line_pixel_3 = videoIn_fork_io_outputs_1_payload_frame_line_pixel_3;
  assign in2outThrown_payload_frame_line_endOfLine = videoIn_fork_io_outputs_1_payload_frame_line_endOfLine;
  assign in2outThrown_payload_frame_endOfFrame = videoIn_fork_io_outputs_1_payload_frame_endOfFrame;
  assign in2outThrown_payload_endOfPack = videoIn_fork_io_outputs_1_payload_endOfPack;
  always @(*) begin
    feedbackAdded_valid = fifo_pop_fork_io_outputs_0_valid;
    if(feedbackAddCond) begin
      feedbackAdded_valid = 1'b1;
    end
  end

  always @(*) begin
    fifo_pop_fork_io_outputs_0_ready = feedbackAdded_ready;
    if(feedbackAddCond) begin
      fifo_pop_fork_io_outputs_0_ready = 1'b0;
    end
  end

  assign feedbackAdded_payload_0_pixel_0 = fifo_pop_fork_io_outputs_0_payload_0_pixel_0;
  assign feedbackAdded_payload_0_pixel_1 = fifo_pop_fork_io_outputs_0_payload_0_pixel_1;
  assign feedbackAdded_payload_0_pixel_2 = fifo_pop_fork_io_outputs_0_payload_0_pixel_2;
  assign feedbackAdded_payload_0_pixel_3 = fifo_pop_fork_io_outputs_0_payload_0_pixel_3;
  assign feedbackAdded_payload_0_endOfLine = fifo_pop_fork_io_outputs_0_payload_0_endOfLine;
  assign in2fifoJoinFeedback_valid = (videoIn_fork_io_outputs_0_valid && feedbackAdded_valid);
  assign in2fifoJoinFeedback_fire = (in2fifoJoinFeedback_valid && in2fifoJoinFeedback_ready);
  assign in2fifoJoinFeedback_fire_1 = (in2fifoJoinFeedback_valid && in2fifoJoinFeedback_ready);
  assign feedbackAdded_ready = in2fifoJoinFeedback_fire_1;
  assign in2fifoJoinFeedback_payload__1_frame_line_pixel_0 = videoIn_fork_io_outputs_0_payload_frame_line_pixel_0;
  assign in2fifoJoinFeedback_payload__1_frame_line_pixel_1 = videoIn_fork_io_outputs_0_payload_frame_line_pixel_1;
  assign in2fifoJoinFeedback_payload__1_frame_line_pixel_2 = videoIn_fork_io_outputs_0_payload_frame_line_pixel_2;
  assign in2fifoJoinFeedback_payload__1_frame_line_pixel_3 = videoIn_fork_io_outputs_0_payload_frame_line_pixel_3;
  assign in2fifoJoinFeedback_payload__1_frame_line_endOfLine = videoIn_fork_io_outputs_0_payload_frame_line_endOfLine;
  assign in2fifoJoinFeedback_payload__1_frame_endOfFrame = videoIn_fork_io_outputs_0_payload_frame_endOfFrame;
  assign in2fifoJoinFeedback_payload__1_endOfPack = videoIn_fork_io_outputs_0_payload_endOfPack;
  assign in2fifoJoinFeedback_payload__2_0_pixel_0 = feedbackAdded_payload_0_pixel_0;
  assign in2fifoJoinFeedback_payload__2_0_pixel_1 = feedbackAdded_payload_0_pixel_1;
  assign in2fifoJoinFeedback_payload__2_0_pixel_2 = feedbackAdded_payload_0_pixel_2;
  assign in2fifoJoinFeedback_payload__2_0_pixel_3 = feedbackAdded_payload_0_pixel_3;
  assign in2fifoJoinFeedback_payload__2_0_endOfLine = feedbackAdded_payload_0_endOfLine;
  assign in2outJoinFifo2out_valid = (in2outThrown_valid && fifo_pop_fork_io_outputs_1_valid);
  assign in2outJoinFifo2out_fire = (in2outJoinFifo2out_valid && in2outJoinFifo2out_ready);
  assign in2outThrown_ready = in2outJoinFifo2out_fire;
  assign in2outJoinFifo2out_fire_1 = (in2outJoinFifo2out_valid && in2outJoinFifo2out_ready);
  assign in2outJoinFifo2out_payload__1_frame_line_pixel_0 = in2outThrown_payload_frame_line_pixel_0;
  assign in2outJoinFifo2out_payload__1_frame_line_pixel_1 = in2outThrown_payload_frame_line_pixel_1;
  assign in2outJoinFifo2out_payload__1_frame_line_pixel_2 = in2outThrown_payload_frame_line_pixel_2;
  assign in2outJoinFifo2out_payload__1_frame_line_pixel_3 = in2outThrown_payload_frame_line_pixel_3;
  assign in2outJoinFifo2out_payload__1_frame_line_endOfLine = in2outThrown_payload_frame_line_endOfLine;
  assign in2outJoinFifo2out_payload__1_frame_endOfFrame = in2outThrown_payload_frame_endOfFrame;
  assign in2outJoinFifo2out_payload__1_endOfPack = in2outThrown_payload_endOfPack;
  assign in2outJoinFifo2out_payload__2_0_pixel_0 = fifo_pop_fork_io_outputs_1_payload_0_pixel_0;
  assign in2outJoinFifo2out_payload__2_0_pixel_1 = fifo_pop_fork_io_outputs_1_payload_0_pixel_1;
  assign in2outJoinFifo2out_payload__2_0_pixel_2 = fifo_pop_fork_io_outputs_1_payload_0_pixel_2;
  assign in2outJoinFifo2out_payload__2_0_pixel_3 = fifo_pop_fork_io_outputs_1_payload_0_pixel_3;
  assign in2outJoinFifo2out_payload__2_0_endOfLine = fifo_pop_fork_io_outputs_1_payload_0_endOfLine;
  assign ioVideoInFire = (videoIn_valid && videoIn_ready);
  always @(*) begin
    lineCnt_willIncrement = 1'b0;
    if(when_LineBufferValid_l59) begin
      lineCnt_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    lineCnt_willClear = 1'b0;
    if(when_LineBufferValid_l58) begin
      lineCnt_willClear = 1'b1;
    end
  end

  assign lineCnt_willOverflowIfInc = (lineCnt_value == 1'b1);
  assign lineCnt_willOverflow = (lineCnt_willOverflowIfInc && lineCnt_willIncrement);
  always @(*) begin
    lineCnt_valueNext = (lineCnt_value + lineCnt_willIncrement);
    if(lineCnt_willClear) begin
      lineCnt_valueNext = 1'b0;
    end
  end

  assign lineCntWontOverflowIfInc = (! lineCnt_willOverflowIfInc);
  assign when_LineBufferValid_l58 = (ioVideoInFire && videoIn_payload_frame_endOfFrame);
  assign when_LineBufferValid_l59 = ((ioVideoInFire && videoIn_payload_frame_line_endOfLine) && lineCntWontOverflowIfInc);
  assign in2outThrowCond = lineCntWontOverflowIfInc;
  assign feedbackAddCond = (lineCnt_value == 1'b0);
  assign in2fifoJoinFeedback_ready = fifo_push_ready;
  assign fifo_flush = (ioVideoInFire && videoIn_payload_frame_endOfFrame);
  assign videoOut_valid = in2outJoinFifo2out_valid;
  assign in2outJoinFifo2out_ready = videoOut_ready;
  assign videoOut_payload_endOfPack = videoIn_payload_endOfPack;
  assign videoOut_payload_frame_endOfFrame = videoIn_payload_frame_endOfFrame;
  assign videoOut_payload_frame_line_pixel_0_0 = in2outJoinFifo2out_payload__2_0_pixel_0;
  assign videoOut_payload_frame_line_pixel_0_1 = in2outJoinFifo2out_payload__2_0_pixel_1;
  assign videoOut_payload_frame_line_pixel_0_2 = in2outJoinFifo2out_payload__2_0_pixel_2;
  assign videoOut_payload_frame_line_pixel_0_3 = in2outJoinFifo2out_payload__2_0_pixel_3;
  assign videoOut_payload_frame_line_pixel_1_0 = in2outJoinFifo2out_payload__1_frame_line_pixel_0;
  assign videoOut_payload_frame_line_pixel_1_1 = in2outJoinFifo2out_payload__1_frame_line_pixel_1;
  assign videoOut_payload_frame_line_pixel_1_2 = in2outJoinFifo2out_payload__1_frame_line_pixel_2;
  assign videoOut_payload_frame_line_pixel_1_3 = in2outJoinFifo2out_payload__1_frame_line_pixel_3;
  assign videoOut_payload_frame_line_endOfLine = videoIn_payload_frame_line_endOfLine;
  always @(posedge clk) begin
    if(reset) begin
      lineCnt_value <= 1'b0;
    end else begin
      lineCnt_value <= lineCnt_valueNext;
    end
  end


endmodule

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

//APlusDMultB replaced by APlusDMultB

module APlusDMultB (
  input      [29:0]   A,
  input      [17:0]   B,
  input      [24:0]   D,
  output     [47:0]   P,
  input               CEs_0,
  input               CEs_1,
  input               CEs_2,
  input               CEs_3,
  input               clk
);

  wire       [29:0]   dSP48E1_1_ACOUT;
  wire       [17:0]   dSP48E1_1_BCOUT;
  wire       [47:0]   dSP48E1_1_PCOUT;
  wire       [0:0]    dSP48E1_1_CARRYCASCOUT;
  wire       [0:0]    dSP48E1_1_MULTSIGNOUT;
  wire       [47:0]   dSP48E1_1_P;
  wire       [3:0]    dSP48E1_1_CARRYOUT;

  DSP48E1 #(
    .A_INPUT("DIRECT"),
    .B_INPUT("DIRECT"),
    .USE_DPORT("TRUE"),
    .USE_MULT("MULTIPLY"),
    .USE_SIMD("ONE48"),
    .AREG(1),
    .BREG(2),
    .CREG(1),
    .DREG(1),
    .ADREG(1),
    .MREG(1),
    .PREG(1),
    .ACASCREG(1),
    .BCASCREG(1),
    .CARRYINREG(1),
    .CARRYINSELREG(1),
    .INMODEREG(1),
    .OPMODEREG(1),
    .ALUMODEREG(1) 
  ) dSP48E1_1 (
    .CLK              (clk                      ), //i
    .ALUMODE          (4'b0000                  ), //i
    .INMODE           (5'h05                    ), //i
    .OPMODE           (7'h05                    ), //i
    .CARRYINSEL       (3'b000                   ), //i
    .ACIN             (30'h0                    ), //i
    .BCIN             (18'h0                    ), //i
    .PCIN             (48'h0                    ), //i
    .CARRYCASCIN      (1'b0                     ), //i
    .MULTSIGNIN       (1'b0                     ), //i
    .ACOUT            (dSP48E1_1_ACOUT[29:0]    ), //o
    .BCOUT            (dSP48E1_1_BCOUT[17:0]    ), //o
    .PCOUT            (dSP48E1_1_PCOUT[47:0]    ), //o
    .CARRYCASCOUT     (dSP48E1_1_CARRYCASCOUT   ), //o
    .MULTSIGNOUT      (dSP48E1_1_MULTSIGNOUT    ), //o
    .CEA1             (CEs_0                    ), //i
    .CEA2             (1'b0                     ), //i
    .CEB1             (CEs_0                    ), //i
    .CEB2             (CEs_1                    ), //i
    .CEC              (1'b0                     ), //i
    .CED              (CEs_0                    ), //i
    .CEAD             (CEs_1                    ), //i
    .CEM              (CEs_2                    ), //i
    .CEP              (CEs_3                    ), //i
    .CECARRYIN        (1'b0                     ), //i
    .CECTRL           (1'b0                     ), //i
    .CEINMODE         (1'b0                     ), //i
    .CEALUMODE        (1'b0                     ), //i
    .RSTA             (1'b0                     ), //i
    .RSTB             (1'b0                     ), //i
    .RSTC             (1'b0                     ), //i
    .RSTD             (1'b0                     ), //i
    .RSTM             (1'b0                     ), //i
    .RSTP             (1'b0                     ), //i
    .RSTALLCARRYIN    (1'b0                     ), //i
    .RSTCTRL          (1'b0                     ), //i
    .RSTINMODE        (1'b0                     ), //i
    .RSTALUMODE       (1'b0                     ), //i
    .A                (A[29:0]                  ), //i
    .B                (B[17:0]                  ), //i
    .C                (48'h0                    ), //i
    .D                (D[24:0]                  ), //i
    .CARRYIN          (1'b0                     ), //i
    .P                (dSP48E1_1_P[47:0]        ), //o
    .CARRYOUT         (dSP48E1_1_CARRYOUT[3:0]  )  //o
  );
  assign P = dSP48E1_1_P;

endmodule

module StreamFork_3 (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [7:0]    io_input_payload_0_pixel_0,
  input      [7:0]    io_input_payload_0_pixel_1,
  input      [7:0]    io_input_payload_0_pixel_2,
  input      [7:0]    io_input_payload_0_pixel_3,
  input               io_input_payload_0_endOfLine,
  input      [7:0]    io_input_payload_1_pixel_0,
  input      [7:0]    io_input_payload_1_pixel_1,
  input      [7:0]    io_input_payload_1_pixel_2,
  input      [7:0]    io_input_payload_1_pixel_3,
  input               io_input_payload_1_endOfLine,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [7:0]    io_outputs_0_payload_0_pixel_0,
  output     [7:0]    io_outputs_0_payload_0_pixel_1,
  output     [7:0]    io_outputs_0_payload_0_pixel_2,
  output     [7:0]    io_outputs_0_payload_0_pixel_3,
  output              io_outputs_0_payload_0_endOfLine,
  output     [7:0]    io_outputs_0_payload_1_pixel_0,
  output     [7:0]    io_outputs_0_payload_1_pixel_1,
  output     [7:0]    io_outputs_0_payload_1_pixel_2,
  output     [7:0]    io_outputs_0_payload_1_pixel_3,
  output              io_outputs_0_payload_1_endOfLine,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [7:0]    io_outputs_1_payload_0_pixel_0,
  output     [7:0]    io_outputs_1_payload_0_pixel_1,
  output     [7:0]    io_outputs_1_payload_0_pixel_2,
  output     [7:0]    io_outputs_1_payload_0_pixel_3,
  output              io_outputs_1_payload_0_endOfLine,
  output     [7:0]    io_outputs_1_payload_1_pixel_0,
  output     [7:0]    io_outputs_1_payload_1_pixel_1,
  output     [7:0]    io_outputs_1_payload_1_pixel_2,
  output     [7:0]    io_outputs_1_payload_1_pixel_3,
  output              io_outputs_1_payload_1_endOfLine,
  input               clk,
  input               reset
);

  reg                 tmp_io_outputs_0_valid;
  reg                 tmp_io_outputs_1_valid;
  wire                when_Stream_l825;
  wire                when_Stream_l825_1;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(when_Stream_l825) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l825_1) begin
      io_input_ready = 1'b0;
    end
  end

  assign when_Stream_l825 = ((! io_outputs_0_ready) && tmp_io_outputs_0_valid);
  assign when_Stream_l825_1 = ((! io_outputs_1_ready) && tmp_io_outputs_1_valid);
  assign io_outputs_0_valid = (io_input_valid && tmp_io_outputs_0_valid);
  assign io_outputs_0_payload_0_pixel_0 = io_input_payload_0_pixel_0;
  assign io_outputs_0_payload_0_pixel_1 = io_input_payload_0_pixel_1;
  assign io_outputs_0_payload_0_pixel_2 = io_input_payload_0_pixel_2;
  assign io_outputs_0_payload_0_pixel_3 = io_input_payload_0_pixel_3;
  assign io_outputs_0_payload_0_endOfLine = io_input_payload_0_endOfLine;
  assign io_outputs_0_payload_1_pixel_0 = io_input_payload_1_pixel_0;
  assign io_outputs_0_payload_1_pixel_1 = io_input_payload_1_pixel_1;
  assign io_outputs_0_payload_1_pixel_2 = io_input_payload_1_pixel_2;
  assign io_outputs_0_payload_1_pixel_3 = io_input_payload_1_pixel_3;
  assign io_outputs_0_payload_1_endOfLine = io_input_payload_1_endOfLine;
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && tmp_io_outputs_1_valid);
  assign io_outputs_1_payload_0_pixel_0 = io_input_payload_0_pixel_0;
  assign io_outputs_1_payload_0_pixel_1 = io_input_payload_0_pixel_1;
  assign io_outputs_1_payload_0_pixel_2 = io_input_payload_0_pixel_2;
  assign io_outputs_1_payload_0_pixel_3 = io_input_payload_0_pixel_3;
  assign io_outputs_1_payload_0_endOfLine = io_input_payload_0_endOfLine;
  assign io_outputs_1_payload_1_pixel_0 = io_input_payload_1_pixel_0;
  assign io_outputs_1_payload_1_pixel_1 = io_input_payload_1_pixel_1;
  assign io_outputs_1_payload_1_pixel_2 = io_input_payload_1_pixel_2;
  assign io_outputs_1_payload_1_pixel_3 = io_input_payload_1_pixel_3;
  assign io_outputs_1_payload_1_endOfLine = io_input_payload_1_endOfLine;
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  always @(posedge clk) begin
    if(reset) begin
      tmp_io_outputs_0_valid <= 1'b1;
      tmp_io_outputs_1_valid <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        tmp_io_outputs_0_valid <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        tmp_io_outputs_1_valid <= 1'b0;
      end
      if(io_input_ready) begin
        tmp_io_outputs_0_valid <= 1'b1;
        tmp_io_outputs_1_valid <= 1'b1;
      end
    end
  end


endmodule

//StreamFork replaced by StreamFork

module StreamFifoHighPerf_1 (
  input               push_valid,
  output              push_ready,
  input      [7:0]    push_payload_0_pixel_0,
  input      [7:0]    push_payload_0_pixel_1,
  input      [7:0]    push_payload_0_pixel_2,
  input      [7:0]    push_payload_0_pixel_3,
  input               push_payload_0_endOfLine,
  input      [7:0]    push_payload_1_pixel_0,
  input      [7:0]    push_payload_1_pixel_1,
  input      [7:0]    push_payload_1_pixel_2,
  input      [7:0]    push_payload_1_pixel_3,
  input               push_payload_1_endOfLine,
  output              pop_valid,
  input               pop_ready,
  output     [7:0]    pop_payload_0_pixel_0,
  output     [7:0]    pop_payload_0_pixel_1,
  output     [7:0]    pop_payload_0_pixel_2,
  output     [7:0]    pop_payload_0_pixel_3,
  output              pop_payload_0_endOfLine,
  output     [7:0]    pop_payload_1_pixel_0,
  output     [7:0]    pop_payload_1_pixel_1,
  output     [7:0]    pop_payload_1_pixel_2,
  output     [7:0]    pop_payload_1_pixel_3,
  output              pop_payload_1_endOfLine,
  input               flush,
  input               clk,
  input               reset
);

  reg        [65:0]   tmp_ram_port0;
  wire       [8:0]    tmp_pushPtr_valueNext;
  wire       [0:0]    tmp_pushPtr_valueNext_1;
  wire       [8:0]    tmp_popPtr_valueNext;
  wire       [0:0]    tmp_popPtr_valueNext_1;
  wire       [65:0]   tmp_ram_port;
  reg                 tmp_1;
  wire                popEvent_valid;
  reg                 popEvent_ready;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  reg        [8:0]    pushPtr_valueNext;
  reg        [8:0]    pushPtr_value;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  reg        [8:0]    popPtr_valueNext;
  reg        [8:0]    popPtr_value;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                pushing;
  wire                popping;
  wire                empty;
  wire                full;
  reg                 tmp_popEvent_valid;
  reg                 rValid;
  wire       [7:0]    rData_0_pixel_0;
  wire       [7:0]    rData_0_pixel_1;
  wire       [7:0]    rData_0_pixel_2;
  wire       [7:0]    rData_0_pixel_3;
  wire                rData_0_endOfLine;
  wire       [7:0]    rData_1_pixel_0;
  wire       [7:0]    rData_1_pixel_1;
  wire       [7:0]    rData_1_pixel_2;
  wire       [7:0]    rData_1_pixel_3;
  wire                rData_1_endOfLine;
  wire       [65:0]   tmp_rData_0_pixel_0;
  wire       [32:0]   tmp_rData_0_pixel_0_1;
  wire       [31:0]   tmp_rData_0_pixel_0_2;
  wire       [32:0]   tmp_rData_1_pixel_0;
  wire       [31:0]   tmp_rData_1_pixel_0_1;
  wire                when_StreamFifoHighPerf_l38;
  wire                when_StreamFifoHighPerf_l42;
  reg [65:0] ram [0:511];

  assign tmp_pushPtr_valueNext_1 = pushPtr_willIncrement;
  assign tmp_pushPtr_valueNext = {8'd0, tmp_pushPtr_valueNext_1};
  assign tmp_popPtr_valueNext_1 = popPtr_willIncrement;
  assign tmp_popPtr_valueNext = {8'd0, tmp_popPtr_valueNext_1};
  assign tmp_ram_port = {{push_payload_1_endOfLine,{push_payload_1_pixel_3,{push_payload_1_pixel_2,{push_payload_1_pixel_1,push_payload_1_pixel_0}}}},{push_payload_0_endOfLine,{push_payload_0_pixel_3,{push_payload_0_pixel_2,{push_payload_0_pixel_1,push_payload_0_pixel_0}}}}};
  always @(posedge clk) begin
    if(popEvent_ready) begin
      tmp_ram_port0 <= ram[popPtr_value];
    end
  end

  always @(posedge clk) begin
    if(tmp_1) begin
      ram[pushPtr_value] <= tmp_ram_port;
    end
  end

  always @(*) begin
    tmp_1 = 1'b0;
    if(pushing) begin
      tmp_1 = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing) begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willClear = 1'b0;
    if(flush) begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = (pushPtr_value == 9'h1ff);
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @(*) begin
    pushPtr_valueNext = (pushPtr_value + tmp_pushPtr_valueNext);
    if(pushPtr_willClear) begin
      pushPtr_valueNext = 9'h0;
    end
  end

  always @(*) begin
    popPtr_willIncrement = 1'b0;
    if(popping) begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    popPtr_willClear = 1'b0;
    if(flush) begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = (popPtr_value == 9'h1ff);
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  always @(*) begin
    popPtr_valueNext = (popPtr_value + tmp_popPtr_valueNext);
    if(popPtr_willClear) begin
      popPtr_valueNext = 9'h0;
    end
  end

  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign pushing = (push_valid && push_ready);
  assign popping = (popEvent_valid && popEvent_ready);
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign push_ready = (! full);
  assign popEvent_valid = ((! empty) && (! (tmp_popEvent_valid && (! full))));
  assign tmp_rData_0_pixel_0 = tmp_ram_port0;
  assign tmp_rData_0_pixel_0_1 = tmp_rData_0_pixel_0[32 : 0];
  assign tmp_rData_0_pixel_0_2 = tmp_rData_0_pixel_0_1[31 : 0];
  assign rData_0_pixel_0 = tmp_rData_0_pixel_0_2[7 : 0];
  assign rData_0_pixel_1 = tmp_rData_0_pixel_0_2[15 : 8];
  assign rData_0_pixel_2 = tmp_rData_0_pixel_0_2[23 : 16];
  assign rData_0_pixel_3 = tmp_rData_0_pixel_0_2[31 : 24];
  assign rData_0_endOfLine = tmp_rData_0_pixel_0_1[32];
  assign tmp_rData_1_pixel_0 = tmp_rData_0_pixel_0[65 : 33];
  assign tmp_rData_1_pixel_0_1 = tmp_rData_1_pixel_0[31 : 0];
  assign rData_1_pixel_0 = tmp_rData_1_pixel_0_1[7 : 0];
  assign rData_1_pixel_1 = tmp_rData_1_pixel_0_1[15 : 8];
  assign rData_1_pixel_2 = tmp_rData_1_pixel_0_1[23 : 16];
  assign rData_1_pixel_3 = tmp_rData_1_pixel_0_1[31 : 24];
  assign rData_1_endOfLine = tmp_rData_1_pixel_0[32];
  always @(*) begin
    popEvent_ready = pop_ready;
    if(when_StreamFifoHighPerf_l38) begin
      popEvent_ready = 1'b1;
    end
  end

  assign when_StreamFifoHighPerf_l38 = (! rValid);
  assign pop_valid = rValid;
  assign pop_payload_0_pixel_0 = rData_0_pixel_0;
  assign pop_payload_0_pixel_1 = rData_0_pixel_1;
  assign pop_payload_0_pixel_2 = rData_0_pixel_2;
  assign pop_payload_0_pixel_3 = rData_0_pixel_3;
  assign pop_payload_0_endOfLine = rData_0_endOfLine;
  assign pop_payload_1_pixel_0 = rData_1_pixel_0;
  assign pop_payload_1_pixel_1 = rData_1_pixel_1;
  assign pop_payload_1_pixel_2 = rData_1_pixel_2;
  assign pop_payload_1_pixel_3 = rData_1_pixel_3;
  assign pop_payload_1_endOfLine = rData_1_endOfLine;
  assign when_StreamFifoHighPerf_l42 = (pushing != popping);
  always @(posedge clk) begin
    if(reset) begin
      pushPtr_value <= 9'h0;
      popPtr_value <= 9'h0;
      risingOccupancy <= 1'b0;
      tmp_popEvent_valid <= 1'b0;
      rValid <= 1'b0;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value <= popPtr_valueNext;
      tmp_popEvent_valid <= (popPtr_valueNext == pushPtr_value);
      if(popEvent_ready) begin
        rValid <= popEvent_valid;
      end
      if(when_StreamFifoHighPerf_l42) begin
        risingOccupancy <= pushing;
      end
      if(flush) begin
        rValid <= 1'b0;
        risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module StreamFork_1 (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [7:0]    io_input_payload_0_pixel_0,
  input      [7:0]    io_input_payload_0_pixel_1,
  input      [7:0]    io_input_payload_0_pixel_2,
  input      [7:0]    io_input_payload_0_pixel_3,
  input               io_input_payload_0_endOfLine,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [7:0]    io_outputs_0_payload_0_pixel_0,
  output     [7:0]    io_outputs_0_payload_0_pixel_1,
  output     [7:0]    io_outputs_0_payload_0_pixel_2,
  output     [7:0]    io_outputs_0_payload_0_pixel_3,
  output              io_outputs_0_payload_0_endOfLine,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [7:0]    io_outputs_1_payload_0_pixel_0,
  output     [7:0]    io_outputs_1_payload_0_pixel_1,
  output     [7:0]    io_outputs_1_payload_0_pixel_2,
  output     [7:0]    io_outputs_1_payload_0_pixel_3,
  output              io_outputs_1_payload_0_endOfLine,
  input               clk,
  input               reset
);

  reg                 tmp_io_outputs_0_valid;
  reg                 tmp_io_outputs_1_valid;
  wire                when_Stream_l825;
  wire                when_Stream_l825_1;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(when_Stream_l825) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l825_1) begin
      io_input_ready = 1'b0;
    end
  end

  assign when_Stream_l825 = ((! io_outputs_0_ready) && tmp_io_outputs_0_valid);
  assign when_Stream_l825_1 = ((! io_outputs_1_ready) && tmp_io_outputs_1_valid);
  assign io_outputs_0_valid = (io_input_valid && tmp_io_outputs_0_valid);
  assign io_outputs_0_payload_0_pixel_0 = io_input_payload_0_pixel_0;
  assign io_outputs_0_payload_0_pixel_1 = io_input_payload_0_pixel_1;
  assign io_outputs_0_payload_0_pixel_2 = io_input_payload_0_pixel_2;
  assign io_outputs_0_payload_0_pixel_3 = io_input_payload_0_pixel_3;
  assign io_outputs_0_payload_0_endOfLine = io_input_payload_0_endOfLine;
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && tmp_io_outputs_1_valid);
  assign io_outputs_1_payload_0_pixel_0 = io_input_payload_0_pixel_0;
  assign io_outputs_1_payload_0_pixel_1 = io_input_payload_0_pixel_1;
  assign io_outputs_1_payload_0_pixel_2 = io_input_payload_0_pixel_2;
  assign io_outputs_1_payload_0_pixel_3 = io_input_payload_0_pixel_3;
  assign io_outputs_1_payload_0_endOfLine = io_input_payload_0_endOfLine;
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  always @(posedge clk) begin
    if(reset) begin
      tmp_io_outputs_0_valid <= 1'b1;
      tmp_io_outputs_1_valid <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        tmp_io_outputs_0_valid <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        tmp_io_outputs_1_valid <= 1'b0;
      end
      if(io_input_ready) begin
        tmp_io_outputs_0_valid <= 1'b1;
        tmp_io_outputs_1_valid <= 1'b1;
      end
    end
  end


endmodule

module StreamFork (
  input               io_input_valid,
  output reg          io_input_ready,
  input      [7:0]    io_input_payload_frame_line_pixel_0,
  input      [7:0]    io_input_payload_frame_line_pixel_1,
  input      [7:0]    io_input_payload_frame_line_pixel_2,
  input      [7:0]    io_input_payload_frame_line_pixel_3,
  input               io_input_payload_frame_line_endOfLine,
  input               io_input_payload_frame_endOfFrame,
  input               io_input_payload_endOfPack,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_0,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_1,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_2,
  output     [7:0]    io_outputs_0_payload_frame_line_pixel_3,
  output              io_outputs_0_payload_frame_line_endOfLine,
  output              io_outputs_0_payload_frame_endOfFrame,
  output              io_outputs_0_payload_endOfPack,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_0,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_1,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_2,
  output     [7:0]    io_outputs_1_payload_frame_line_pixel_3,
  output              io_outputs_1_payload_frame_line_endOfLine,
  output              io_outputs_1_payload_frame_endOfFrame,
  output              io_outputs_1_payload_endOfPack,
  input               clk,
  input               reset
);

  reg                 tmp_io_outputs_0_valid;
  reg                 tmp_io_outputs_1_valid;
  wire                when_Stream_l825;
  wire                when_Stream_l825_1;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(when_Stream_l825) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l825_1) begin
      io_input_ready = 1'b0;
    end
  end

  assign when_Stream_l825 = ((! io_outputs_0_ready) && tmp_io_outputs_0_valid);
  assign when_Stream_l825_1 = ((! io_outputs_1_ready) && tmp_io_outputs_1_valid);
  assign io_outputs_0_valid = (io_input_valid && tmp_io_outputs_0_valid);
  assign io_outputs_0_payload_frame_line_pixel_0 = io_input_payload_frame_line_pixel_0;
  assign io_outputs_0_payload_frame_line_pixel_1 = io_input_payload_frame_line_pixel_1;
  assign io_outputs_0_payload_frame_line_pixel_2 = io_input_payload_frame_line_pixel_2;
  assign io_outputs_0_payload_frame_line_pixel_3 = io_input_payload_frame_line_pixel_3;
  assign io_outputs_0_payload_frame_line_endOfLine = io_input_payload_frame_line_endOfLine;
  assign io_outputs_0_payload_frame_endOfFrame = io_input_payload_frame_endOfFrame;
  assign io_outputs_0_payload_endOfPack = io_input_payload_endOfPack;
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && tmp_io_outputs_1_valid);
  assign io_outputs_1_payload_frame_line_pixel_0 = io_input_payload_frame_line_pixel_0;
  assign io_outputs_1_payload_frame_line_pixel_1 = io_input_payload_frame_line_pixel_1;
  assign io_outputs_1_payload_frame_line_pixel_2 = io_input_payload_frame_line_pixel_2;
  assign io_outputs_1_payload_frame_line_pixel_3 = io_input_payload_frame_line_pixel_3;
  assign io_outputs_1_payload_frame_line_endOfLine = io_input_payload_frame_line_endOfLine;
  assign io_outputs_1_payload_frame_endOfFrame = io_input_payload_frame_endOfFrame;
  assign io_outputs_1_payload_endOfPack = io_input_payload_endOfPack;
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  always @(posedge clk) begin
    if(reset) begin
      tmp_io_outputs_0_valid <= 1'b1;
      tmp_io_outputs_1_valid <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        tmp_io_outputs_0_valid <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        tmp_io_outputs_1_valid <= 1'b0;
      end
      if(io_input_ready) begin
        tmp_io_outputs_0_valid <= 1'b1;
        tmp_io_outputs_1_valid <= 1'b1;
      end
    end
  end


endmodule

module StreamFifoHighPerf (
  input               push_valid,
  output              push_ready,
  input      [7:0]    push_payload_0_pixel_0,
  input      [7:0]    push_payload_0_pixel_1,
  input      [7:0]    push_payload_0_pixel_2,
  input      [7:0]    push_payload_0_pixel_3,
  input               push_payload_0_endOfLine,
  output              pop_valid,
  input               pop_ready,
  output     [7:0]    pop_payload_0_pixel_0,
  output     [7:0]    pop_payload_0_pixel_1,
  output     [7:0]    pop_payload_0_pixel_2,
  output     [7:0]    pop_payload_0_pixel_3,
  output              pop_payload_0_endOfLine,
  input               flush,
  input               clk,
  input               reset
);

  reg        [32:0]   tmp_ram_port0;
  wire       [8:0]    tmp_pushPtr_valueNext;
  wire       [0:0]    tmp_pushPtr_valueNext_1;
  wire       [8:0]    tmp_popPtr_valueNext;
  wire       [0:0]    tmp_popPtr_valueNext_1;
  wire       [32:0]   tmp_ram_port;
  reg                 tmp_1;
  wire                popEvent_valid;
  reg                 popEvent_ready;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  reg        [8:0]    pushPtr_valueNext;
  reg        [8:0]    pushPtr_value;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  reg        [8:0]    popPtr_valueNext;
  reg        [8:0]    popPtr_value;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                pushing;
  wire                popping;
  wire                empty;
  wire                full;
  reg                 tmp_popEvent_valid;
  reg                 rValid;
  wire       [7:0]    rData_0_pixel_0;
  wire       [7:0]    rData_0_pixel_1;
  wire       [7:0]    rData_0_pixel_2;
  wire       [7:0]    rData_0_pixel_3;
  wire                rData_0_endOfLine;
  wire       [32:0]   tmp_rData_0_pixel_0;
  wire       [31:0]   tmp_rData_0_pixel_0_1;
  wire                when_StreamFifoHighPerf_l38;
  wire                when_StreamFifoHighPerf_l42;
  reg [32:0] ram [0:511];

  assign tmp_pushPtr_valueNext_1 = pushPtr_willIncrement;
  assign tmp_pushPtr_valueNext = {8'd0, tmp_pushPtr_valueNext_1};
  assign tmp_popPtr_valueNext_1 = popPtr_willIncrement;
  assign tmp_popPtr_valueNext = {8'd0, tmp_popPtr_valueNext_1};
  assign tmp_ram_port = {push_payload_0_endOfLine,{push_payload_0_pixel_3,{push_payload_0_pixel_2,{push_payload_0_pixel_1,push_payload_0_pixel_0}}}};
  always @(posedge clk) begin
    if(popEvent_ready) begin
      tmp_ram_port0 <= ram[popPtr_value];
    end
  end

  always @(posedge clk) begin
    if(tmp_1) begin
      ram[pushPtr_value] <= tmp_ram_port;
    end
  end

  always @(*) begin
    tmp_1 = 1'b0;
    if(pushing) begin
      tmp_1 = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing) begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willClear = 1'b0;
    if(flush) begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = (pushPtr_value == 9'h1ff);
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @(*) begin
    pushPtr_valueNext = (pushPtr_value + tmp_pushPtr_valueNext);
    if(pushPtr_willClear) begin
      pushPtr_valueNext = 9'h0;
    end
  end

  always @(*) begin
    popPtr_willIncrement = 1'b0;
    if(popping) begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    popPtr_willClear = 1'b0;
    if(flush) begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = (popPtr_value == 9'h1ff);
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  always @(*) begin
    popPtr_valueNext = (popPtr_value + tmp_popPtr_valueNext);
    if(popPtr_willClear) begin
      popPtr_valueNext = 9'h0;
    end
  end

  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign pushing = (push_valid && push_ready);
  assign popping = (popEvent_valid && popEvent_ready);
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign push_ready = (! full);
  assign popEvent_valid = ((! empty) && (! (tmp_popEvent_valid && (! full))));
  assign tmp_rData_0_pixel_0 = tmp_ram_port0[32 : 0];
  assign tmp_rData_0_pixel_0_1 = tmp_rData_0_pixel_0[31 : 0];
  assign rData_0_pixel_0 = tmp_rData_0_pixel_0_1[7 : 0];
  assign rData_0_pixel_1 = tmp_rData_0_pixel_0_1[15 : 8];
  assign rData_0_pixel_2 = tmp_rData_0_pixel_0_1[23 : 16];
  assign rData_0_pixel_3 = tmp_rData_0_pixel_0_1[31 : 24];
  assign rData_0_endOfLine = tmp_rData_0_pixel_0[32];
  always @(*) begin
    popEvent_ready = pop_ready;
    if(when_StreamFifoHighPerf_l38) begin
      popEvent_ready = 1'b1;
    end
  end

  assign when_StreamFifoHighPerf_l38 = (! rValid);
  assign pop_valid = rValid;
  assign pop_payload_0_pixel_0 = rData_0_pixel_0;
  assign pop_payload_0_pixel_1 = rData_0_pixel_1;
  assign pop_payload_0_pixel_2 = rData_0_pixel_2;
  assign pop_payload_0_pixel_3 = rData_0_pixel_3;
  assign pop_payload_0_endOfLine = rData_0_endOfLine;
  assign when_StreamFifoHighPerf_l42 = (pushing != popping);
  always @(posedge clk) begin
    if(reset) begin
      pushPtr_value <= 9'h0;
      popPtr_value <= 9'h0;
      risingOccupancy <= 1'b0;
      tmp_popEvent_valid <= 1'b0;
      rValid <= 1'b0;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value <= popPtr_valueNext;
      tmp_popEvent_valid <= (popPtr_valueNext == pushPtr_value);
      if(popEvent_ready) begin
        rValid <= popEvent_valid;
      end
      if(when_StreamFifoHighPerf_l42) begin
        risingOccupancy <= pushing;
      end
      if(flush) begin
        rValid <= 1'b0;
        risingOccupancy <= 1'b0;
      end
    end
  end


endmodule
