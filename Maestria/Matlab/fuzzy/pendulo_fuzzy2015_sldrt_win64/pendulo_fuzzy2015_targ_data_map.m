  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 3;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (pendulo_fuzzy2015_P)
    ;%
      section.nData     = 56;
      section.data(56)  = dumData; %prealloc
      
	  ;% pendulo_fuzzy2015_P.AnalogOutput_MaxMissedTicks
	  section.data(1).logicalSrcIdx = 4;
	  section.data(1).dtTransOffset = 0;
	
	  ;% pendulo_fuzzy2015_P.AnalogOutput1_MaxMissedTicks
	  section.data(2).logicalSrcIdx = 5;
	  section.data(2).dtTransOffset = 1;
	
	  ;% pendulo_fuzzy2015_P.AnalogInput_MaxMissedTicks
	  section.data(3).logicalSrcIdx = 6;
	  section.data(3).dtTransOffset = 2;
	
	  ;% pendulo_fuzzy2015_P.AnalogInput1_MaxMissedTicks
	  section.data(4).logicalSrcIdx = 7;
	  section.data(4).dtTransOffset = 3;
	
	  ;% pendulo_fuzzy2015_P.AnalogOutput_YieldWhenWaiting
	  section.data(5).logicalSrcIdx = 8;
	  section.data(5).dtTransOffset = 4;
	
	  ;% pendulo_fuzzy2015_P.AnalogOutput1_YieldWhenWaiting
	  section.data(6).logicalSrcIdx = 9;
	  section.data(6).dtTransOffset = 5;
	
	  ;% pendulo_fuzzy2015_P.AnalogInput_YieldWhenWaiting
	  section.data(7).logicalSrcIdx = 10;
	  section.data(7).dtTransOffset = 6;
	
	  ;% pendulo_fuzzy2015_P.AnalogInput1_YieldWhenWaiting
	  section.data(8).logicalSrcIdx = 11;
	  section.data(8).dtTransOffset = 7;
	
	  ;% pendulo_fuzzy2015_P.mf1_a
	  section.data(9).logicalSrcIdx = 12;
	  section.data(9).dtTransOffset = 8;
	
	  ;% pendulo_fuzzy2015_P.mf2_a
	  section.data(10).logicalSrcIdx = 13;
	  section.data(10).dtTransOffset = 12;
	
	  ;% pendulo_fuzzy2015_P.mf3_a
	  section.data(11).logicalSrcIdx = 14;
	  section.data(11).dtTransOffset = 16;
	
	  ;% pendulo_fuzzy2015_P.mf4_a
	  section.data(12).logicalSrcIdx = 15;
	  section.data(12).dtTransOffset = 20;
	
	  ;% pendulo_fuzzy2015_P.mf5_a
	  section.data(13).logicalSrcIdx = 16;
	  section.data(13).dtTransOffset = 24;
	
	  ;% pendulo_fuzzy2015_P.mf6_a
	  section.data(14).logicalSrcIdx = 17;
	  section.data(14).dtTransOffset = 28;
	
	  ;% pendulo_fuzzy2015_P.mf7_a
	  section.data(15).logicalSrcIdx = 18;
	  section.data(15).dtTransOffset = 32;
	
	  ;% pendulo_fuzzy2015_P.mf8_a
	  section.data(16).logicalSrcIdx = 19;
	  section.data(16).dtTransOffset = 36;
	
	  ;% pendulo_fuzzy2015_P.mf9_a
	  section.data(17).logicalSrcIdx = 20;
	  section.data(17).dtTransOffset = 40;
	
	  ;% pendulo_fuzzy2015_P.mf10_a
	  section.data(18).logicalSrcIdx = 21;
	  section.data(18).dtTransOffset = 44;
	
	  ;% pendulo_fuzzy2015_P.mf11_a
	  section.data(19).logicalSrcIdx = 22;
	  section.data(19).dtTransOffset = 48;
	
	  ;% pendulo_fuzzy2015_P.mf12_a
	  section.data(20).logicalSrcIdx = 23;
	  section.data(20).dtTransOffset = 52;
	
	  ;% pendulo_fuzzy2015_P.mf13_a
	  section.data(21).logicalSrcIdx = 24;
	  section.data(21).dtTransOffset = 56;
	
	  ;% pendulo_fuzzy2015_P.mf14_a
	  section.data(22).logicalSrcIdx = 25;
	  section.data(22).dtTransOffset = 60;
	
	  ;% pendulo_fuzzy2015_P.mf15_a
	  section.data(23).logicalSrcIdx = 26;
	  section.data(23).dtTransOffset = 64;
	
	  ;% pendulo_fuzzy2015_P.mf16_a
	  section.data(24).logicalSrcIdx = 27;
	  section.data(24).dtTransOffset = 68;
	
	  ;% pendulo_fuzzy2015_P.mf1_b
	  section.data(25).logicalSrcIdx = 28;
	  section.data(25).dtTransOffset = 72;
	
	  ;% pendulo_fuzzy2015_P.mf2_b
	  section.data(26).logicalSrcIdx = 29;
	  section.data(26).dtTransOffset = 73;
	
	  ;% pendulo_fuzzy2015_P.mf3_b
	  section.data(27).logicalSrcIdx = 30;
	  section.data(27).dtTransOffset = 74;
	
	  ;% pendulo_fuzzy2015_P.mf4_b
	  section.data(28).logicalSrcIdx = 31;
	  section.data(28).dtTransOffset = 75;
	
	  ;% pendulo_fuzzy2015_P.mf5_b
	  section.data(29).logicalSrcIdx = 32;
	  section.data(29).dtTransOffset = 76;
	
	  ;% pendulo_fuzzy2015_P.mf6_b
	  section.data(30).logicalSrcIdx = 33;
	  section.data(30).dtTransOffset = 77;
	
	  ;% pendulo_fuzzy2015_P.mf7_b
	  section.data(31).logicalSrcIdx = 34;
	  section.data(31).dtTransOffset = 78;
	
	  ;% pendulo_fuzzy2015_P.mf8_b
	  section.data(32).logicalSrcIdx = 35;
	  section.data(32).dtTransOffset = 79;
	
	  ;% pendulo_fuzzy2015_P.mf9_b
	  section.data(33).logicalSrcIdx = 36;
	  section.data(33).dtTransOffset = 80;
	
	  ;% pendulo_fuzzy2015_P.mf10_b
	  section.data(34).logicalSrcIdx = 37;
	  section.data(34).dtTransOffset = 81;
	
	  ;% pendulo_fuzzy2015_P.mf11_b
	  section.data(35).logicalSrcIdx = 38;
	  section.data(35).dtTransOffset = 82;
	
	  ;% pendulo_fuzzy2015_P.mf12_b
	  section.data(36).logicalSrcIdx = 39;
	  section.data(36).dtTransOffset = 83;
	
	  ;% pendulo_fuzzy2015_P.mf13_b
	  section.data(37).logicalSrcIdx = 40;
	  section.data(37).dtTransOffset = 84;
	
	  ;% pendulo_fuzzy2015_P.mf14_b
	  section.data(38).logicalSrcIdx = 41;
	  section.data(38).dtTransOffset = 85;
	
	  ;% pendulo_fuzzy2015_P.mf15_b
	  section.data(39).logicalSrcIdx = 42;
	  section.data(39).dtTransOffset = 86;
	
	  ;% pendulo_fuzzy2015_P.mf16_b
	  section.data(40).logicalSrcIdx = 43;
	  section.data(40).dtTransOffset = 87;
	
	  ;% pendulo_fuzzy2015_P.mf1_mu
	  section.data(41).logicalSrcIdx = 44;
	  section.data(41).dtTransOffset = 88;
	
	  ;% pendulo_fuzzy2015_P.mf1_mu_f
	  section.data(42).logicalSrcIdx = 45;
	  section.data(42).dtTransOffset = 89;
	
	  ;% pendulo_fuzzy2015_P.mf1_mu_a
	  section.data(43).logicalSrcIdx = 46;
	  section.data(43).dtTransOffset = 90;
	
	  ;% pendulo_fuzzy2015_P.mf1_mu_k
	  section.data(44).logicalSrcIdx = 47;
	  section.data(44).dtTransOffset = 91;
	
	  ;% pendulo_fuzzy2015_P.mf2_mu
	  section.data(45).logicalSrcIdx = 48;
	  section.data(45).dtTransOffset = 92;
	
	  ;% pendulo_fuzzy2015_P.mf2_mu_h
	  section.data(46).logicalSrcIdx = 49;
	  section.data(46).dtTransOffset = 93;
	
	  ;% pendulo_fuzzy2015_P.mf2_mu_f
	  section.data(47).logicalSrcIdx = 50;
	  section.data(47).dtTransOffset = 94;
	
	  ;% pendulo_fuzzy2015_P.mf2_mu_n
	  section.data(48).logicalSrcIdx = 51;
	  section.data(48).dtTransOffset = 95;
	
	  ;% pendulo_fuzzy2015_P.mf1_sigma
	  section.data(49).logicalSrcIdx = 52;
	  section.data(49).dtTransOffset = 96;
	
	  ;% pendulo_fuzzy2015_P.mf1_sigma_i
	  section.data(50).logicalSrcIdx = 53;
	  section.data(50).dtTransOffset = 97;
	
	  ;% pendulo_fuzzy2015_P.mf1_sigma_c
	  section.data(51).logicalSrcIdx = 54;
	  section.data(51).dtTransOffset = 98;
	
	  ;% pendulo_fuzzy2015_P.mf1_sigma_f
	  section.data(52).logicalSrcIdx = 55;
	  section.data(52).dtTransOffset = 99;
	
	  ;% pendulo_fuzzy2015_P.mf2_sigma
	  section.data(53).logicalSrcIdx = 56;
	  section.data(53).dtTransOffset = 100;
	
	  ;% pendulo_fuzzy2015_P.mf2_sigma_b
	  section.data(54).logicalSrcIdx = 57;
	  section.data(54).dtTransOffset = 101;
	
	  ;% pendulo_fuzzy2015_P.mf2_sigma_o
	  section.data(55).logicalSrcIdx = 58;
	  section.data(55).dtTransOffset = 102;
	
	  ;% pendulo_fuzzy2015_P.mf2_sigma_j
	  section.data(56).logicalSrcIdx = 59;
	  section.data(56).dtTransOffset = 103;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 12;
      section.data(12)  = dumData; %prealloc
      
	  ;% pendulo_fuzzy2015_P.AnalogOutput_Channels
	  section.data(1).logicalSrcIdx = 60;
	  section.data(1).dtTransOffset = 0;
	
	  ;% pendulo_fuzzy2015_P.AnalogOutput1_Channels
	  section.data(2).logicalSrcIdx = 61;
	  section.data(2).dtTransOffset = 1;
	
	  ;% pendulo_fuzzy2015_P.AnalogInput_Channels
	  section.data(3).logicalSrcIdx = 62;
	  section.data(3).dtTransOffset = 2;
	
	  ;% pendulo_fuzzy2015_P.AnalogInput1_Channels
	  section.data(4).logicalSrcIdx = 63;
	  section.data(4).dtTransOffset = 3;
	
	  ;% pendulo_fuzzy2015_P.AnalogOutput_RangeMode
	  section.data(5).logicalSrcIdx = 64;
	  section.data(5).dtTransOffset = 4;
	
	  ;% pendulo_fuzzy2015_P.AnalogOutput1_RangeMode
	  section.data(6).logicalSrcIdx = 65;
	  section.data(6).dtTransOffset = 5;
	
	  ;% pendulo_fuzzy2015_P.AnalogInput_RangeMode
	  section.data(7).logicalSrcIdx = 66;
	  section.data(7).dtTransOffset = 6;
	
	  ;% pendulo_fuzzy2015_P.AnalogInput1_RangeMode
	  section.data(8).logicalSrcIdx = 67;
	  section.data(8).dtTransOffset = 7;
	
	  ;% pendulo_fuzzy2015_P.AnalogOutput_VoltRange
	  section.data(9).logicalSrcIdx = 68;
	  section.data(9).dtTransOffset = 8;
	
	  ;% pendulo_fuzzy2015_P.AnalogOutput1_VoltRange
	  section.data(10).logicalSrcIdx = 69;
	  section.data(10).dtTransOffset = 9;
	
	  ;% pendulo_fuzzy2015_P.AnalogInput_VoltRange
	  section.data(11).logicalSrcIdx = 70;
	  section.data(11).dtTransOffset = 10;
	
	  ;% pendulo_fuzzy2015_P.AnalogInput1_VoltRange
	  section.data(12).logicalSrcIdx = 71;
	  section.data(12).dtTransOffset = 11;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 50;
      section.data(50)  = dumData; %prealloc
      
	  ;% pendulo_fuzzy2015_P.Out1_Y0
	  section.data(1).logicalSrcIdx = 72;
	  section.data(1).dtTransOffset = 0;
	
	  ;% pendulo_fuzzy2015_P.One_Value
	  section.data(2).logicalSrcIdx = 73;
	  section.data(2).dtTransOffset = 1;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value
	  section.data(3).logicalSrcIdx = 74;
	  section.data(3).dtTransOffset = 2;
	
	  ;% pendulo_fuzzy2015_P.TransferFcn3_A
	  section.data(4).logicalSrcIdx = 75;
	  section.data(4).dtTransOffset = 3;
	
	  ;% pendulo_fuzzy2015_P.TransferFcn3_C
	  section.data(5).logicalSrcIdx = 76;
	  section.data(5).dtTransOffset = 4;
	
	  ;% pendulo_fuzzy2015_P.Gain_Gain
	  section.data(6).logicalSrcIdx = 77;
	  section.data(6).dtTransOffset = 5;
	
	  ;% pendulo_fuzzy2015_P.TransferFcn4_A
	  section.data(7).logicalSrcIdx = 78;
	  section.data(7).dtTransOffset = 6;
	
	  ;% pendulo_fuzzy2015_P.TransferFcn4_C
	  section.data(8).logicalSrcIdx = 79;
	  section.data(8).dtTransOffset = 7;
	
	  ;% pendulo_fuzzy2015_P.Gain_Gain_a
	  section.data(9).logicalSrcIdx = 80;
	  section.data(9).dtTransOffset = 8;
	
	  ;% pendulo_fuzzy2015_P.TransferFcn2_A
	  section.data(10).logicalSrcIdx = 81;
	  section.data(10).dtTransOffset = 9;
	
	  ;% pendulo_fuzzy2015_P.TransferFcn2_C
	  section.data(11).logicalSrcIdx = 82;
	  section.data(11).dtTransOffset = 10;
	
	  ;% pendulo_fuzzy2015_P.Gain_Gain_p
	  section.data(12).logicalSrcIdx = 83;
	  section.data(12).dtTransOffset = 11;
	
	  ;% pendulo_fuzzy2015_P.TransferFcn1_A
	  section.data(13).logicalSrcIdx = 84;
	  section.data(13).dtTransOffset = 12;
	
	  ;% pendulo_fuzzy2015_P.TransferFcn1_C
	  section.data(14).logicalSrcIdx = 85;
	  section.data(14).dtTransOffset = 13;
	
	  ;% pendulo_fuzzy2015_P.Gain_Gain_f
	  section.data(15).logicalSrcIdx = 86;
	  section.data(15).dtTransOffset = 14;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value_n
	  section.data(16).logicalSrcIdx = 87;
	  section.data(16).dtTransOffset = 15;
	
	  ;% pendulo_fuzzy2015_P.Gain_Gain_o
	  section.data(17).logicalSrcIdx = 88;
	  section.data(17).dtTransOffset = 16;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value_l
	  section.data(18).logicalSrcIdx = 89;
	  section.data(18).dtTransOffset = 17;
	
	  ;% pendulo_fuzzy2015_P.Gain_Gain_fc
	  section.data(19).logicalSrcIdx = 90;
	  section.data(19).dtTransOffset = 18;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value_g
	  section.data(20).logicalSrcIdx = 91;
	  section.data(20).dtTransOffset = 19;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value_e
	  section.data(21).logicalSrcIdx = 92;
	  section.data(21).dtTransOffset = 20;
	
	  ;% pendulo_fuzzy2015_P.Gain_Gain_i
	  section.data(22).logicalSrcIdx = 93;
	  section.data(22).dtTransOffset = 21;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value_ed
	  section.data(23).logicalSrcIdx = 94;
	  section.data(23).dtTransOffset = 22;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value_i
	  section.data(24).logicalSrcIdx = 95;
	  section.data(24).dtTransOffset = 23;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value_h
	  section.data(25).logicalSrcIdx = 96;
	  section.data(25).dtTransOffset = 24;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value_b
	  section.data(26).logicalSrcIdx = 97;
	  section.data(26).dtTransOffset = 25;
	
	  ;% pendulo_fuzzy2015_P.Gain_Gain_od
	  section.data(27).logicalSrcIdx = 98;
	  section.data(27).dtTransOffset = 26;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value_gk
	  section.data(28).logicalSrcIdx = 99;
	  section.data(28).dtTransOffset = 27;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value_k
	  section.data(29).logicalSrcIdx = 100;
	  section.data(29).dtTransOffset = 28;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value_m
	  section.data(30).logicalSrcIdx = 101;
	  section.data(30).dtTransOffset = 29;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value_k4
	  section.data(31).logicalSrcIdx = 102;
	  section.data(31).dtTransOffset = 30;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value_nw
	  section.data(32).logicalSrcIdx = 103;
	  section.data(32).dtTransOffset = 31;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value_gz
	  section.data(33).logicalSrcIdx = 104;
	  section.data(33).dtTransOffset = 32;
	
	  ;% pendulo_fuzzy2015_P.Weight_Value_ew
	  section.data(34).logicalSrcIdx = 105;
	  section.data(34).dtTransOffset = 33;
	
	  ;% pendulo_fuzzy2015_P.Zero_Value
	  section.data(35).logicalSrcIdx = 106;
	  section.data(35).dtTransOffset = 34;
	
	  ;% pendulo_fuzzy2015_P.MidRange_Value
	  section.data(36).logicalSrcIdx = 107;
	  section.data(36).dtTransOffset = 35;
	
	  ;% pendulo_fuzzy2015_P.Switch_Threshold
	  section.data(37).logicalSrcIdx = 108;
	  section.data(37).dtTransOffset = 36;
	
	  ;% pendulo_fuzzy2015_P.Constant6_Value
	  section.data(38).logicalSrcIdx = 109;
	  section.data(38).dtTransOffset = 37;
	
	  ;% pendulo_fuzzy2015_P.Constant7_Value
	  section.data(39).logicalSrcIdx = 110;
	  section.data(39).dtTransOffset = 38;
	
	  ;% pendulo_fuzzy2015_P.Constant8_Value
	  section.data(40).logicalSrcIdx = 111;
	  section.data(40).dtTransOffset = 39;
	
	  ;% pendulo_fuzzy2015_P.Constant1_Value
	  section.data(41).logicalSrcIdx = 112;
	  section.data(41).dtTransOffset = 40;
	
	  ;% pendulo_fuzzy2015_P.Constant2_Value
	  section.data(42).logicalSrcIdx = 113;
	  section.data(42).dtTransOffset = 41;
	
	  ;% pendulo_fuzzy2015_P.Constant5_Value
	  section.data(43).logicalSrcIdx = 114;
	  section.data(43).dtTransOffset = 42;
	
	  ;% pendulo_fuzzy2015_P.Constant3_Value
	  section.data(44).logicalSrcIdx = 115;
	  section.data(44).dtTransOffset = 43;
	
	  ;% pendulo_fuzzy2015_P.Constant4_Value
	  section.data(45).logicalSrcIdx = 116;
	  section.data(45).dtTransOffset = 44;
	
	  ;% pendulo_fuzzy2015_P.Constant_Value
	  section.data(46).logicalSrcIdx = 117;
	  section.data(46).dtTransOffset = 45;
	
	  ;% pendulo_fuzzy2015_P.Constant5_Value_g
	  section.data(47).logicalSrcIdx = 118;
	  section.data(47).dtTransOffset = 46;
	
	  ;% pendulo_fuzzy2015_P.Gain1_Gain
	  section.data(48).logicalSrcIdx = 119;
	  section.data(48).dtTransOffset = 47;
	
	  ;% pendulo_fuzzy2015_P.Saturation_UpperSat
	  section.data(49).logicalSrcIdx = 120;
	  section.data(49).dtTransOffset = 48;
	
	  ;% pendulo_fuzzy2015_P.Saturation_LowerSat
	  section.data(50).logicalSrcIdx = 121;
	  section.data(50).dtTransOffset = 49;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 3;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (pendulo_fuzzy2015_B)
    ;%
      section.nData     = 15;
      section.data(15)  = dumData; %prealloc
      
	  ;% pendulo_fuzzy2015_B.TransferFcn3
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% pendulo_fuzzy2015_B.TransferFcn4
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% pendulo_fuzzy2015_B.TransferFcn2
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% pendulo_fuzzy2015_B.TransferFcn1
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% pendulo_fuzzy2015_B.Merge
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% pendulo_fuzzy2015_B.Switch
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% pendulo_fuzzy2015_B.Product4
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% pendulo_fuzzy2015_B.Product5
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
	  ;% pendulo_fuzzy2015_B.Product6
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 8;
	
	  ;% pendulo_fuzzy2015_B.SumofElements
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 9;
	
	  ;% pendulo_fuzzy2015_B.Derivative2
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 10;
	
	  ;% pendulo_fuzzy2015_B.Add
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 11;
	
	  ;% pendulo_fuzzy2015_B.Derivative3
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 12;
	
	  ;% pendulo_fuzzy2015_B.Saturation
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 13;
	
	  ;% pendulo_fuzzy2015_B.kf
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 14;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% pendulo_fuzzy2015_B.IfActionSubsystem1.In1
	  section.data(1).logicalSrcIdx = 15;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% pendulo_fuzzy2015_B.IfActionSubsystem.In1
	  section.data(1).logicalSrcIdx = 16;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(3) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 5;
    sectIdxOffset = 3;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (pendulo_fuzzy2015_DW)
    ;%
      section.nData     = 8;
      section.data(8)  = dumData; %prealloc
      
	  ;% pendulo_fuzzy2015_DW.TimeStampA
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% pendulo_fuzzy2015_DW.LastUAtTimeA
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% pendulo_fuzzy2015_DW.TimeStampB
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% pendulo_fuzzy2015_DW.LastUAtTimeB
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% pendulo_fuzzy2015_DW.TimeStampA_k
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% pendulo_fuzzy2015_DW.LastUAtTimeA_m
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% pendulo_fuzzy2015_DW.TimeStampB_i
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% pendulo_fuzzy2015_DW.LastUAtTimeB_m
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 9;
      section.data(9)  = dumData; %prealloc
      
	  ;% pendulo_fuzzy2015_DW.AnalogOutput_PWORK
	  section.data(1).logicalSrcIdx = 8;
	  section.data(1).dtTransOffset = 0;
	
	  ;% pendulo_fuzzy2015_DW.AnalogOutput1_PWORK
	  section.data(2).logicalSrcIdx = 9;
	  section.data(2).dtTransOffset = 1;
	
	  ;% pendulo_fuzzy2015_DW.AnalogInput_PWORK
	  section.data(3).logicalSrcIdx = 10;
	  section.data(3).dtTransOffset = 2;
	
	  ;% pendulo_fuzzy2015_DW.AnalogInput1_PWORK
	  section.data(4).logicalSrcIdx = 11;
	  section.data(4).dtTransOffset = 3;
	
	  ;% pendulo_fuzzy2015_DW.Scope2_PWORK.LoggedData
	  section.data(5).logicalSrcIdx = 12;
	  section.data(5).dtTransOffset = 4;
	
	  ;% pendulo_fuzzy2015_DW.Scope3_PWORK.LoggedData
	  section.data(6).logicalSrcIdx = 13;
	  section.data(6).dtTransOffset = 5;
	
	  ;% pendulo_fuzzy2015_DW.Scope_PWORK.LoggedData
	  section.data(7).logicalSrcIdx = 14;
	  section.data(7).dtTransOffset = 6;
	
	  ;% pendulo_fuzzy2015_DW.Et2_PWORK.LoggedData
	  section.data(8).logicalSrcIdx = 15;
	  section.data(8).dtTransOffset = 7;
	
	  ;% pendulo_fuzzy2015_DW.Et3_PWORK.LoggedData
	  section.data(9).logicalSrcIdx = 16;
	  section.data(9).dtTransOffset = 11;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% pendulo_fuzzy2015_DW.If_ActiveSubsystem
	  section.data(1).logicalSrcIdx = 17;
	  section.data(1).dtTransOffset = 0;
	
	  ;% pendulo_fuzzy2015_DW.ActionOne_SubsysRanBC
	  section.data(2).logicalSrcIdx = 18;
	  section.data(2).dtTransOffset = 1;
	
	  ;% pendulo_fuzzy2015_DW.Actionu1_SubsysRanBC
	  section.data(3).logicalSrcIdx = 19;
	  section.data(3).dtTransOffset = 2;
	
	  ;% pendulo_fuzzy2015_DW.If_ActiveSubsystem_f
	  section.data(4).logicalSrcIdx = 20;
	  section.data(4).dtTransOffset = 3;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% pendulo_fuzzy2015_DW.IfActionSubsystem1.IfActionSubsystem_SubsysRanBC
	  section.data(1).logicalSrcIdx = 21;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(4) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% pendulo_fuzzy2015_DW.IfActionSubsystem.IfActionSubsystem_SubsysRanBC
	  section.data(1).logicalSrcIdx = 22;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(5) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 1222529345;
  targMap.checksum1 = 318638355;
  targMap.checksum2 = 2040392141;
  targMap.checksum3 = 941031672;

