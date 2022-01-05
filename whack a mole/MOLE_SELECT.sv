module MOLE_SELECT(
       input Clk,  frame_clk,RESET,
       input UP_EXPORT,
		 input DOWN_EXPORT,
		 input CLICK_EXPORT,
		 input WAIT_EXPORT,
       input [9:0] TLX_SOIL,TLY_SOIL,
       input [9:0] DrawX, DrawY, 
		 input DOWN_EXPORT2,
		 input CLICK_EXPORT2,
		 input UP_EXPORT2,
		input [2:0]choice,
		 output ismole,
		 output isunder,
		 output [23:0] out,
		 output logic DOWN_DONE,UP_DONE,CLICK_DONE,
		 output logic[9:0] mole_PosX_export,mole_PosY_export
		 );
		 
		 logic [9:0] mole_PosX_down,mole_PosY_down,mole_PosX_up,mole_PosY_up,mole_PosX_click,mole_PosY_click,mole_PosX,mole_PosY;
		 logic ismole_down,ismole_up,ismole_click,isunder_up,isunder_down,isunder_click;
		 logic [23:0] out_down,out_up,out_click;
		 
		 MOLE_UP Mole_Up(.Clk(Clk),.RESET(RESET),
		                 .frame_clk(frame_clk),
							  .UP_EXPORT2(UP_EXPORT2),
							  .DrawX(DrawX),
							  .DrawY(DrawY),
							  .TLX_SOIL(TLX_SOIL),
							  .TLY_SOIL(TLY_SOIL),
							  .mole_PosX(mole_PosX_up),
							  .mole_PosY(mole_PosY_up),
							  .UP_DONE(UP_DONE),
							  .out(out_up),
							  .ismole(ismole_up),
//							  .isunder(isunder_up)
							  .choice(choice)
		                );
		 

		 MOLE_DOWN Mole_Down(.Clk(Clk),
								.frame_clk(frame_clk),
								.TLX_SOIL(TLX_SOIL),
								.TLY_SOIL(TLY_SOIL),
								.DrawX(DrawX),
								.DrawY(DrawY),
								.DOWN_EXPORT2(DOWN_EXPORT2),
								.mole_PosX(mole_PosX_down),
								.mole_PosY(mole_PosY_down),
								.ismole(ismole_down),
								.out(out_down),
								.DOWN_DONE(DOWN_DONE),
//								.isunder(isunder_down),
								.choice(choice)
								);
								
		MOLE_CLICKDOWN Mole_Clickdown(.Clk(Clk),
		                              .frame_clk(frame_clk),
												.CLICKDOWN_EXPORT2(CLICK_EXPORT2),
												.DrawX(DrawX),
												.DrawY(DrawY),
												.TLX_SOIL(TLX_SOIL),
												.TLY_SOIL(TLY_SOIL),
												.CLICK_DONE(CLICK_DONE),
												.out(out_click),
												.ismole(ismole_click),
//												.isunder(isunder_click),
												.mole_PosX(mole_PosX_click),
												.mole_PosY(mole_PosY_click)
		                  );
								
//		module  MOLE_CLICKDOWN(
//               input Clk,  frame_clk,
//               input [9:0] TLX_SOIL,TLY_SOIL,
//               input [9:0]   DrawX, DrawY, 
//					input CLICKDOWN_EXPORT2,
////					output logic [9:0] mole_PosX, mole_PosY,
//					output logic ismole,
//					output logic [23:0] out,
//					output logic CLICK_DONE
//				);

		always_comb
		  begin
		    mole_PosX=10'd0;
			 mole_PosY=10'd0;
			 ismole = 1'b0;
			 isunder=1'b0;
			 out = 24'd0;
			 mole_PosX_export=10'd0;
			 mole_PosY_export=10'd0;
			 if(UP_EXPORT)
				begin
			     mole_PosX=mole_PosX_up;
			     mole_PosY=mole_PosY_up;
				  ismole = ismole_up;
//				  isunder=isunder_down;
				  out = out_up;
				  mole_PosX_export = mole_PosX_up;
				  mole_PosY_export = mole_PosY_up;
				end
			 else
				begin
					if(DOWN_EXPORT)
						begin
						  mole_PosX=mole_PosX_down;
			           mole_PosY=mole_PosY_down;
				        ismole = ismole_down;
//						  isunder=isunder_down;
				        out = out_down;
						  mole_PosX_export = mole_PosX_down;
				        mole_PosY_export = mole_PosY_down;
						end
					else
					begin
					  if(CLICK_EXPORT)
					    begin
						   ismole = ismole_click;
//							isunder=isunder_click;
				         out = out_click;
							mole_PosX=mole_PosX_click;
			            mole_PosY=mole_PosY_click;
							mole_PosX_export = mole_PosX_click;
				         mole_PosY_export = mole_PosY_click;
						 end
					end
				end
		  end
								
				


endmodule
