//////-------------------------------------------------------------------------
//////    Color_Mapper.sv                                                    --
//////    Stephen Kempf                                                      --
//////    3-1-06                                                             --
//////                                                                       --
//////    Modified by David Kesler  07-16-2008                               --
//////    Translated by Joe Meng    07-07-2013                               --
//////    Modified by Po-Han Huang  10-06-2017                               --
//////                                                                       --
//////    Fall 2017 Distribution                                             --
//////                                                                       --
//////    For use with ECE 385 Lab 8                                         --
//////    University of Illinois ECE Department                              --
//////-------------------------------------------------------------------------
////
////// color_mapper: Decide which color to be output to VGA for each pixel.
////module  color_mapper ( input        [23:0] color,            // Whether current pixel belongs to ball 
////                       input			[23:0] color2,color3,
////							  input			ismole,VGA_VS,
////							  input        issoil,ischuizi,//   or background (computed in ball.sv)
////                       input        [9:0] DrawX, DrawY,       // Current pixel coordinates
////							  input			[9:0] MouseX,MouseY,
////							  input 			isunder,
////                       output logic [7:0] VGA_R, VGA_G, VGA_B // VGA RGB output
////                     );
////							
////    
//////    logic [7:0] Red, Green, Blue;
////
//////    
//////    // Assign color based on is_ball signal
////
////   //MOUSE
////	logic [9:0] mx,my;
////	always_ff @(posedge VGA_VS)
////	begin
////		mx<=MouseX;
////		my<=MouseY;
////	end
////	int distx,disty,size;
////	assign distx=mx-DrawX;
////	assign disty=my-DrawY;
////	assign size=10;
////    always_comb
////    begin
////		if	((distx*distx + disty*disty <= size*size))
////		begin
////			VGA_R=8'hff;
////			VGA_G=8'h7f;
////			VGA_B=8'h27;
////		end
////		else
////		begin
//////			  if (DrawY>=336)
//////			  begin
//////					VGA_R = 8'hb4; 
//////					VGA_G = 8'hee;
//////					VGA_B = 8'hb4;
//////			  end
//////			  else if (issoil&&DrawY>=330 &&color2===24'hffffff)
//////				begin
//////					VGA_R = 8'hb4; 
//////					VGA_G = 8'hee;
//////					VGA_B = 8'hb4;
//////				end
//////				if (issoil&&ismole&&color2===24'hffffff&&color===24'hffffff)
//////				begin
//////					VGA_R = 8'hb4; 
//////					VGA_G = 8'hee;
//////					VGA_B = 8'hb4;
//////				end
//////			  else if (issoil&&ismole&&color2===24'hffffff)
//////				begin
//////					VGA_R = color[23:16];
//////					VGA_G = color[15:8];
//////					VGA_B = color[7:0];
//////				end
//////				else if(issoil&&color2===24'hffffff)
//////				begin
//////					VGA_R = 8'hb4; 
//////					VGA_G = 8'hee;
//////					VGA_B = 8'hb4;
//////				end
////////				else if (issoil ==1'b1&&color2===24'hffffff)
////////			  begin
////////					VGA_R = 8'hb4; 
////////					VGA_G = 8'hee;
////////					VGA_B = 8'hb4;
////////			  end
//////			 else if	(issoil&&color2===24'h000000)
//////			begin
//////			VGA_R = 8'hb4; 
//////					VGA_G = 8'hee;
//////					VGA_B = 8'hb4;
//////			end
//////			  else if (issoil ==1'b1)
//////			  begin
//////					VGA_R = color2[23:16];
//////					VGA_G = color2[15:8];
//////					VGA_B = color2[7:0];
//////			  end
//////			  else if (isunder===1'b1&&issoil===1'b1)
//////              begin
//////                    VGA_R = color2[23:16];
//////                    VGA_G = color2[15:8];
//////                    VGA_B = color2[7:0];
//////              end
//////              else if (isunder===1'b1)
//////              begin
//////                    VGA_R = 8'hb4; 
//////                    VGA_G = 8'hee;
//////                    VGA_B = 8'hb4;
//////              end
//////			 else if (isunder == 1'b1) 
//////			  begin
//////					// White ball
//////					VGA_R = 8'hb4;
//////					VGA_G = 8'hee;
//////					VGA_B = 8'hb4;
//////			  end
//////			 else if (ismole == 1'b1) 
//////			  begin
//////					// White ball
//////					VGA_R = color[23:16];
//////					VGA_G = color[15:8];
//////					VGA_B = color[7:0];
//////			  end
////			  if (ismole == 1'b1&&color===24'hffffff) 
////			  begin
////					// White ball
////					VGA_R = 8'hb4; 
////					VGA_G = 8'hee;
////					VGA_B = 8'hb4;
////			  end
////			 else if (ismole == 1'b1) 
////			  begin
////					// White ball
////					VGA_R = color[23:16];
////					VGA_G = color[15:8];
////					VGA_B = color[7:0];
////			  end
////			  else 
////			  begin
////					// Background with nice color gradient
////					VGA_R = 8'hb4; 
////					VGA_G = 8'hee;
////					VGA_B = 8'hb4;
////			  end
////		end
////    end 
////    
////endmodule
////-------------------------------------------------------------------------
////    Color_Mapper.sv                                                    --
////    Stephen Kempf                                                      --
////    3-1-06                                                             --
////                                                                       --
////    Modified by David Kesler  07-16-2008                               --
////    Translated by Joe Meng    07-07-2013                               --
////    Modified by Po-Han Huang  10-06-2017                               --
////                                                                       --
////    Fall 2017 Distribution                                             --
////                                                                       --
////    For use with ECE 385 Lab 8                                         --
////    University of Illinois ECE Department                              --
////-------------------------------------------------------------------------
//
//// color_mapper: Decide which color to be output to VGA for each pixel.
//module  color_mapper ( input        [23:0] color,          // Whether current pixel belongs to ball 
//                       input			[23:0] color2, color3,color4,
//							  input			ismole,VGA_VS,
//							  input        issoil,isdigit,istime,isend,	//   or background (computed in ball.sv)
//                       input        [9:0] DrawX, DrawY,       // Current pixel coordinates
//							  input			[9:0] MouseX,MouseY,
//							  input			down,
//                       output logic [7:0] VGA_R, VGA_G, VGA_B // VGA RGB output
//                     );
//							
//    
////    logic [7:0] Red, Green, Blue;
//
////    
////    // Assign color based on is_ball signal
//
//   //MOUSE
//	logic [9:0] mx,my;
//	always_ff @(posedge VGA_VS)
//	begin
//		mx<=MouseX;
//		my<=MouseY;
//	end
//	int distx,disty,size;
//	assign distx=mx-DrawX;
//	assign disty=my-DrawY;
//	assign size=6;
//    always_comb
//    begin
//		if	((distx*distx)+(disty*disty)<=size*size)
//		begin
//			VGA_R=8'hdf;
//			VGA_G=8'hb5;
//			VGA_B=8'haa;
//		end
//		else
//		begin
////			  if (DrawY>=336)
////			  begin
////					VGA_R = 8'hb4; 
////					VGA_G = 8'hee;
////					VGA_B = 8'hb4;
////			  end
////			  else if (issoil&&DrawY>=330 &&color2===24'hffffff)
////				begin
////					VGA_R = 8'hb4; 
////					VGA_G = 8'hee;
////					VGA_B = 8'hb4;
////				end
//            if(isend)
//				begin
//				 VGA_R = 8'hb4;
//				 VGA_G = 8'hee;
//				 VGA_B = 8'hb4;
//				end
//            else if(istime)
//				begin
//				 VGA_R = color4[23:16];
//				 VGA_G = color4[15:8];
//				 VGA_B = color4[7:0];
//				end
//            else if(isdigit)
//				begin
//				 VGA_R = color3[23:16];
//				 VGA_G = color3[15:8];
//				 VGA_B = color3[7:0];
//				end
//				else if (issoil&&ismole&&color2===24'hffffff&&color===24'hffffff)
//				begin
//					VGA_R = 8'hb4; 
//					VGA_G = 8'hee;
//					VGA_B = 8'hb4;
//				end
//			  else if (issoil&&ismole&&color2===24'hffffff)
//				begin
//					VGA_R = color[23:16];
//					VGA_G = color[15:8];
//					VGA_B = color[7:0];
//				end
//				else if(issoil&&color2===24'hffffff)
//				begin
//					VGA_R = 8'hb4; 
//					VGA_G = 8'hee;
//					VGA_B = 8'hb4;
//				end
////				else if (issoil ==1'b1&&color2===24'hffffff)
////			  begin
////					VGA_R = 8'hb4; 
////					VGA_G = 8'hee;
////					VGA_B = 8'hb4;
////			  end
//			  else if (issoil ==1'b1&&color2==24'h000000)
//			  begin
//					VGA_R = 8'hb4; 
//					VGA_G = 8'hee;
//					VGA_B = 8'hb4;
//			  end
//			  else if (issoil ==1'b1)
//			  begin
//					VGA_R = color2[23:16];
//					VGA_G = color2[15:8];
//					VGA_B = color2[7:0];
//			  end
//			  
//			  else if(down&&((DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd260 && DrawY <= 10'd260+10'd85)||
//				  (DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd260 && DrawY <= 10'd260+10'd85) ||
//				  (DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd260 && DrawY <= 10'd260+10'd85) ||
//				  (DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd415 && DrawY <= 10'd415+10'd85)   ||
//				  (DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd415 && DrawY <= 10'd415+10'd75) ||
//				  (DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd415 && DrawY <= 10'd415+10'd75)))
//				  begin
//				   VGA_R = 8'hb4; 
//					VGA_G = 8'hee;
//					VGA_B = 8'hb4;
//				  end
//			  else if (ismole == 1'b1&&color===24'hffffff) 
//			  begin
//					// White ball
//					VGA_R = 8'hb4; 
//					VGA_G = 8'hee;
//					VGA_B = 8'hb4;
//			  end
//			 else if (ismole == 1'b1) 
//			  begin
//					// White ball
//					VGA_R = color[23:16];
//					VGA_G = color[15:8];
//					VGA_B = color[7:0];
//			  end
//			  else 
//			  begin
//					VGA_R = 8'hb4;
//					VGA_G = 8'hee;
//					VGA_B = 8'hb4;
//			  end
//			  
//			  
//		end
//    end 
//
//    
//endmodule


// color_mapper: Decide which color to be output to VGA for each pixel.
module  color_mapper ( input        [23:0] color,            // Whether current pixel belongs to ball 
                       input			[23:0] color2, color3,color4,
							  input			ismole,VGA_VS,
							  input        issoil,isdigit,istime,isend,isstart,isgame,	//   or background (computed in ball.sv)
                       input        [9:0] DrawX, DrawY,       // Current pixel coordinates
							  input			[9:0] MouseX,MouseY,
							  input			down,clickdown,
							  input        [23:0] bg_rgb,
							  input 			[8:0]up,
                       output logic [7:0] VGA_R, VGA_G, VGA_B // VGA RGB output
                     );
							
    
//    logic [7:0] Red, Green, Blue;

//    
//    // Assign color based on is_ball signal

   //MOUSE
	logic [9:0] mx,my;
	always_ff @(posedge VGA_VS)
	begin
		mx<=MouseX;
		my<=MouseY;
	end
	int distx,disty,size;
	assign distx=mx-DrawX;
	assign disty=my-DrawY;
	assign size=6;
   always_comb
    begin
	 if((distx*distx)+(disty*disty)<=size*size)
		begin
			VGA_R=8'hdf;
			VGA_G=8'hb5;
			VGA_B=8'haa;
		end
	 else
		begin
			if(isstart)
				begin
//				  if(DrawX-140 <= 150 && DrawX-140 >= 0 && 
//				  DrawY-360 >= 0 && DrawY-360 <=80 )
//				   begin
//						VGA_R=8'hb4;
//						VGA_G=8'hee;
//						VGA_B=8'hb4;
//					end
//					else
//					begin
					VGA_R=bg_rgb[23:16];
					VGA_G=bg_rgb[15:8];
					VGA_B=bg_rgb[7:0];
//					end
				end
			else if(isgame)
				begin
//			  if (DrawY>=336)
//			  begin
//					VGA_R = 8'hb4; 
//					VGA_G = 8'hee;
//					VGA_B = 8'hb4;
//			  end
//			  else if (issoil&&DrawY>=330 &&color2===24'hffffff)
//				begin
//					VGA_R = 8'hb4; 
//					VGA_G = 8'hee;
//					VGA_B = 8'hb4;
//				end
            
            if(istime && color4 != 24'h535353)
				begin
					VGA_R = 8'hb4; 
					VGA_G = 8'hee;
					VGA_B = 8'hb4;
				end
				else if(istime)
				begin
					VGA_R = color4[23:16];
					VGA_G = color4[15:8];
					VGA_B = color4[7:0];
				end
            else if(isdigit && color3 != 24'h535353)
				begin
					VGA_R = 8'hb4; 
					VGA_G = 8'hee;
					VGA_B = 8'hb4;
				end
				else if(isdigit)
				begin
					VGA_R = color3[23:16];
					VGA_G = color3[15:8];
					VGA_B = color3[7:0];
				end
				else if (issoil&&ismole&&color2===24'hffffff&&color===24'hffffff)
				begin
					VGA_R = 8'hb4; 
					VGA_G = 8'hee;
					VGA_B = 8'hb4;
				end
				else if (issoil&&ismole&&color2===24'hffffff&&((DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd165 && DrawY <= 10'd205)||
				  (DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd165 && DrawY <= 10'd205) ||
				  (DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd165 && DrawY <= 10'd205) ||
				  (DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd335 && DrawY <= 10'd375)   ||
				  (DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd335 && DrawY <= 10'd375) ||
				  (DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd335 && DrawY <= 10'd375)))
				begin
					VGA_R = color[23:16];
					VGA_G = color[15:8];
					VGA_B = color[7:0];
				end
				else if(issoil&&color2===24'hffffff)
				begin
					VGA_R = 8'hb4; 
					VGA_G = 8'hee;
					VGA_B = 8'hb4;
				end
//				else if (issoil ==1'b1&&color2===24'hffffff)
//			  begin
//					VGA_R = 8'hb4; 
//					VGA_G = 8'hee;
//					VGA_B = 8'hb4;
//			  end
			  else if (issoil ==1'b1&&color2==24'h000000)
			  begin
					VGA_R = 8'hb4; 
					VGA_G = 8'hee;
					VGA_B = 8'hb4;
			  end
			  else if (issoil ==1'b1)
			  begin
					VGA_R = color2[23:16];
					VGA_G = color2[15:8];
					VGA_B = color2[7:0];
			  end
			  
			  else if((down)&&((DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd195 && DrawY <= 10'd205+10'd105)||
				  (DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd195 && DrawY <= 10'd205+10'd95) ||
				  (DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd195 && DrawY <= 10'd205+10'd95) ||
				  (DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd400 && DrawY <= 10'd405+10'd105)   ||
				  (DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd400 && DrawY <= 10'd405+10'd75) ||
				  (DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd400 && DrawY <= 10'd405+10'd75)))
				  begin
				   VGA_R = 8'hb4; 
					VGA_G = 8'hee;
					VGA_B = 8'hb4;
				  end
				else if((clickdown)&&((DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd195 && DrawY <= 10'd195+10'd135)||
				  (DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd195 && DrawY <= 10'd195+10'd135) ||
				  (DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd195 && DrawY <= 10'd195+10'd135) ||
				  (DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd395 && DrawY <= 10'd405+10'd105)   ||
				  (DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd395 && DrawY <= 10'd405+10'd75) ||
				  (DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd395 && DrawY <= 10'd405+10'd75)))
				  begin
				   VGA_R = 8'hb4; 
					VGA_G = 8'hee;
					VGA_B = 8'hb4;
				  end
			else if((up[3]&&(DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd205 && DrawY <= 10'd205+10'd105))||(up[4]&&(DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd205 && DrawY <= 10'd205+10'd105))||
						(up[5]&&(DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd205 && DrawY <= 10'd205+10'd105))||(up[6]&&(DrawX >= 10'd70 && DrawX <= 10'd70+10'd100 && DrawY >= 10'd415 && DrawY <= 10'd415+10'd85))||
							(up[7]&&(DrawX >= 10'd270 && DrawX <= 10'd270+10'd100 && DrawY >= 10'd415 && DrawY <= 10'd415+10'd75))||(up[8]&&(DrawX >= 10'd470 && DrawX <= 10'd470+10'd100 && DrawY >= 10'd415 && DrawY <= 10'd415+10'd75))	
								)
				  begin
				   VGA_R = 8'hb4; 
					VGA_G = 8'hee;
					VGA_B = 8'hb4;
				  end
						
			  else if (ismole == 1'b1&&color===24'hffffff) 
			  begin
					// White ball
					VGA_R = 8'hb4; 
					VGA_G = 8'hee;
					VGA_B = 8'hb4;
			  end
				else if (ismole == 1'b1) 
			  begin
					// White ball
					VGA_R = color[23:16];
					VGA_G = color[15:8];
					VGA_B = color[7:0];
			  end
			  else 
			  begin
					// Background with nice color gradient
					VGA_R = 8'hb4; 
					VGA_G = 8'hee;
					VGA_B = 8'hb4;
			  end
		end
		else
		begin
//		  if(DrawX-140 <= 150 && DrawX-140 >= 0 && 
//				  DrawY-360 >= 0 && DrawY-360 <=80 )
//				begin
//					VGA_R=8'hb4;
//					VGA_G=8'hee;
//					VGA_B=8'hb4;
//				end
		  if(isdigit && color3 != 24'h535353)
				begin
					VGA_R = 8'h00; 
					VGA_G = 8'h00;
					VGA_B = 8'h00;
				end
			else if(isdigit)
				begin
					VGA_R = 8'hff;
					VGA_G = 8'hff;
					VGA_B = 8'hff;
				end
			else
				begin
					VGA_R=bg_rgb[23:16];
					VGA_G=bg_rgb[15:8];
					VGA_B=bg_rgb[7:0];
				end
		end

	 end
end

    
endmodule

