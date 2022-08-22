  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 4;
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
    ;% Auto data (LQR_V2_P)
    ;%
      section.nData     = 12;
      section.data(12)  = dumData; %prealloc
      
	  ;% LQR_V2_P.k1
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% LQR_V2_P.k2
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% LQR_V2_P.k3
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% LQR_V2_P.k4
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% LQR_V2_P.AnalogOutput_MaxMissedTicks
	  section.data(5).logicalSrcIdx = 8;
	  section.data(5).dtTransOffset = 4;
	
	  ;% LQR_V2_P.AnalogOutput1_MaxMissedTicks
	  section.data(6).logicalSrcIdx = 9;
	  section.data(6).dtTransOffset = 5;
	
	  ;% LQR_V2_P.AnalogInput_MaxMissedTicks
	  section.data(7).logicalSrcIdx = 10;
	  section.data(7).dtTransOffset = 6;
	
	  ;% LQR_V2_P.AnalogInput1_MaxMissedTicks
	  section.data(8).logicalSrcIdx = 11;
	  section.data(8).dtTransOffset = 7;
	
	  ;% LQR_V2_P.AnalogOutput_YieldWhenWaiting
	  section.data(9).logicalSrcIdx = 12;
	  section.data(9).dtTransOffset = 8;
	
	  ;% LQR_V2_P.AnalogOutput1_YieldWhenWaiting
	  section.data(10).logicalSrcIdx = 13;
	  section.data(10).dtTransOffset = 9;
	
	  ;% LQR_V2_P.AnalogInput_YieldWhenWaiting
	  section.data(11).logicalSrcIdx = 14;
	  section.data(11).dtTransOffset = 10;
	
	  ;% LQR_V2_P.AnalogInput1_YieldWhenWaiting
	  section.data(12).logicalSrcIdx = 15;
	  section.data(12).dtTransOffset = 11;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 12;
      section.data(12)  = dumData; %prealloc
      
	  ;% LQR_V2_P.AnalogOutput_Channels
	  section.data(1).logicalSrcIdx = 16;
	  section.data(1).dtTransOffset = 0;
	
	  ;% LQR_V2_P.AnalogOutput1_Channels
	  section.data(2).logicalSrcIdx = 17;
	  section.data(2).dtTransOffset = 1;
	
	  ;% LQR_V2_P.AnalogInput_Channels
	  section.data(3).logicalSrcIdx = 18;
	  section.data(3).dtTransOffset = 2;
	
	  ;% LQR_V2_P.AnalogInput1_Channels
	  section.data(4).logicalSrcIdx = 19;
	  section.data(4).dtTransOffset = 3;
	
	  ;% LQR_V2_P.AnalogOutput_RangeMode
	  section.data(5).logicalSrcIdx = 20;
	  section.data(5).dtTransOffset = 4;
	
	  ;% LQR_V2_P.AnalogOutput1_RangeMode
	  section.data(6).logicalSrcIdx = 21;
	  section.data(6).dtTransOffset = 5;
	
	  ;% LQR_V2_P.AnalogInput_RangeMode
	  section.data(7).logicalSrcIdx = 22;
	  section.data(7).dtTransOffset = 6;
	
	  ;% LQR_V2_P.AnalogInput1_RangeMode
	  section.data(8).logicalSrcIdx = 23;
	  section.data(8).dtTransOffset = 7;
	
	  ;% LQR_V2_P.AnalogOutput_VoltRange
	  section.data(9).logicalSrcIdx = 24;
	  section.data(9).dtTransOffset = 8;
	
	  ;% LQR_V2_P.AnalogOutput1_VoltRange
	  section.data(10).logicalSrcIdx = 25;
	  section.data(10).dtTransOffset = 9;
	
	  ;% LQR_V2_P.AnalogInput_VoltRange
	  section.data(11).logicalSrcIdx = 26;
	  section.data(11).dtTransOffset = 10;
	
	  ;% LQR_V2_P.AnalogInput1_VoltRange
	  section.data(12).logicalSrcIdx = 27;
	  section.data(12).dtTransOffset = 11;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 39;
      section.data(39)  = dumData; %prealloc
      
	  ;% LQR_V2_P.Constant9_Value
	  section.data(1).logicalSrcIdx = 28;
	  section.data(1).dtTransOffset = 0;
	
	  ;% LQR_V2_P.Constant_Value
	  section.data(2).logicalSrcIdx = 29;
	  section.data(2).dtTransOffset = 1;
	
	  ;% LQR_V2_P.Constant1_Value
	  section.data(3).logicalSrcIdx = 30;
	  section.data(3).dtTransOffset = 2;
	
	  ;% LQR_V2_P.SignalGenerator1_Amplitude
	  section.data(4).logicalSrcIdx = 31;
	  section.data(4).dtTransOffset = 3;
	
	  ;% LQR_V2_P.SignalGenerator1_Frequency
	  section.data(5).logicalSrcIdx = 32;
	  section.data(5).dtTransOffset = 4;
	
	  ;% LQR_V2_P.TransferFcn3_A
	  section.data(6).logicalSrcIdx = 33;
	  section.data(6).dtTransOffset = 5;
	
	  ;% LQR_V2_P.TransferFcn3_C
	  section.data(7).logicalSrcIdx = 34;
	  section.data(7).dtTransOffset = 6;
	
	  ;% LQR_V2_P.TransferFcn4_A
	  section.data(8).logicalSrcIdx = 35;
	  section.data(8).dtTransOffset = 7;
	
	  ;% LQR_V2_P.TransferFcn4_C
	  section.data(9).logicalSrcIdx = 36;
	  section.data(9).dtTransOffset = 8;
	
	  ;% LQR_V2_P.Constant_Value_b
	  section.data(10).logicalSrcIdx = 37;
	  section.data(10).dtTransOffset = 9;
	
	  ;% LQR_V2_P.SignalGenerator_Amplitude
	  section.data(11).logicalSrcIdx = 38;
	  section.data(11).dtTransOffset = 10;
	
	  ;% LQR_V2_P.SignalGenerator_Frequency
	  section.data(12).logicalSrcIdx = 39;
	  section.data(12).dtTransOffset = 11;
	
	  ;% LQR_V2_P.TransferFcn2_A
	  section.data(13).logicalSrcIdx = 40;
	  section.data(13).dtTransOffset = 12;
	
	  ;% LQR_V2_P.TransferFcn2_C
	  section.data(14).logicalSrcIdx = 41;
	  section.data(14).dtTransOffset = 13;
	
	  ;% LQR_V2_P.TransferFcn1_A
	  section.data(15).logicalSrcIdx = 42;
	  section.data(15).dtTransOffset = 14;
	
	  ;% LQR_V2_P.TransferFcn1_C
	  section.data(16).logicalSrcIdx = 43;
	  section.data(16).dtTransOffset = 15;
	
	  ;% LQR_V2_P.Saturation_UpperSat
	  section.data(17).logicalSrcIdx = 44;
	  section.data(17).dtTransOffset = 16;
	
	  ;% LQR_V2_P.Saturation_LowerSat
	  section.data(18).logicalSrcIdx = 45;
	  section.data(18).dtTransOffset = 17;
	
	  ;% LQR_V2_P.Constant6_Value
	  section.data(19).logicalSrcIdx = 46;
	  section.data(19).dtTransOffset = 18;
	
	  ;% LQR_V2_P.Saturation_UpperSat_k
	  section.data(20).logicalSrcIdx = 47;
	  section.data(20).dtTransOffset = 19;
	
	  ;% LQR_V2_P.Saturation_LowerSat_d
	  section.data(21).logicalSrcIdx = 48;
	  section.data(21).dtTransOffset = 20;
	
	  ;% LQR_V2_P.Constant7_Value
	  section.data(22).logicalSrcIdx = 49;
	  section.data(22).dtTransOffset = 21;
	
	  ;% LQR_V2_P.Constant8_Value
	  section.data(23).logicalSrcIdx = 50;
	  section.data(23).dtTransOffset = 22;
	
	  ;% LQR_V2_P.in_min_Value
	  section.data(24).logicalSrcIdx = 51;
	  section.data(24).dtTransOffset = 23;
	
	  ;% LQR_V2_P.out_max_Value
	  section.data(25).logicalSrcIdx = 52;
	  section.data(25).dtTransOffset = 24;
	
	  ;% LQR_V2_P.out_min_Value
	  section.data(26).logicalSrcIdx = 53;
	  section.data(26).dtTransOffset = 25;
	
	  ;% LQR_V2_P.in_max_Value
	  section.data(27).logicalSrcIdx = 54;
	  section.data(27).dtTransOffset = 26;
	
	  ;% LQR_V2_P.TransferFcn6_A
	  section.data(28).logicalSrcIdx = 55;
	  section.data(28).dtTransOffset = 27;
	
	  ;% LQR_V2_P.TransferFcn6_C
	  section.data(29).logicalSrcIdx = 56;
	  section.data(29).dtTransOffset = 28;
	
	  ;% LQR_V2_P.Constant5_Value
	  section.data(30).logicalSrcIdx = 57;
	  section.data(30).dtTransOffset = 29;
	
	  ;% LQR_V2_P.Constant3_Value
	  section.data(31).logicalSrcIdx = 58;
	  section.data(31).dtTransOffset = 30;
	
	  ;% LQR_V2_P.Constant4_Value
	  section.data(32).logicalSrcIdx = 59;
	  section.data(32).dtTransOffset = 31;
	
	  ;% LQR_V2_P.in_min_Value_g
	  section.data(33).logicalSrcIdx = 60;
	  section.data(33).dtTransOffset = 32;
	
	  ;% LQR_V2_P.out_max_Value_j
	  section.data(34).logicalSrcIdx = 61;
	  section.data(34).dtTransOffset = 33;
	
	  ;% LQR_V2_P.out_min_Value_f
	  section.data(35).logicalSrcIdx = 62;
	  section.data(35).dtTransOffset = 34;
	
	  ;% LQR_V2_P.in_max_Value_o
	  section.data(36).logicalSrcIdx = 63;
	  section.data(36).dtTransOffset = 35;
	
	  ;% LQR_V2_P.Constant10_Value
	  section.data(37).logicalSrcIdx = 64;
	  section.data(37).dtTransOffset = 36;
	
	  ;% LQR_V2_P.TransferFcn5_A
	  section.data(38).logicalSrcIdx = 65;
	  section.data(38).dtTransOffset = 37;
	
	  ;% LQR_V2_P.TransferFcn5_C
	  section.data(39).logicalSrcIdx = 66;
	  section.data(39).dtTransOffset = 38;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% LQR_V2_P.ManualSwitch1_CurrentSetting
	  section.data(1).logicalSrcIdx = 67;
	  section.data(1).dtTransOffset = 0;
	
	  ;% LQR_V2_P.ManualSwitch_CurrentSetting
	  section.data(2).logicalSrcIdx = 68;
	  section.data(2).dtTransOffset = 1;
	
	  ;% LQR_V2_P.ManualSwitch_CurrentSetting_f
	  section.data(3).logicalSrcIdx = 69;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(4) = section;
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
    ;% Auto data (LQR_V2_B)
    ;%
      section.nData     = 20;
      section.data(20)  = dumData; %prealloc
      
	  ;% LQR_V2_B.TransferFcn3
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% LQR_V2_B.Subtract1
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% LQR_V2_B.TransferFcn4
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% LQR_V2_B.TransferFcn2
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% LQR_V2_B.Add1
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% LQR_V2_B.TransferFcn1
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% LQR_V2_B.Add1_o
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% LQR_V2_B.Saturation
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
	  ;% LQR_V2_B.Saturation_j
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 8;
	
	  ;% LQR_V2_B.Product5
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 9;
	
	  ;% LQR_V2_B.Product6
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 10;
	
	  ;% LQR_V2_B.AnalogInput1
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 11;
	
	  ;% LQR_V2_B.SumofElements4
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 12;
	
	  ;% LQR_V2_B.Derivative2
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 13;
	
	  ;% LQR_V2_B.TransferFcn6
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 14;
	
	  ;% LQR_V2_B.Add
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 15;
	
	  ;% LQR_V2_B.SumofElements5
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 16;
	
	  ;% LQR_V2_B.TransferFcn5
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 17;
	
	  ;% LQR_V2_B.Derivative1
	  section.data(19).logicalSrcIdx = 18;
	  section.data(19).dtTransOffset = 18;
	
	  ;% LQR_V2_B.Derivative3
	  section.data(20).logicalSrcIdx = 19;
	  section.data(20).dtTransOffset = 19;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% LQR_V2_B.IfActionSubsystem1.In1
	  section.data(1).logicalSrcIdx = 20;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% LQR_V2_B.IfActionSubsystem.In1
	  section.data(1).logicalSrcIdx = 21;
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
    ;% Auto data (LQR_V2_DW)
    ;%
      section.nData     = 12;
      section.data(12)  = dumData; %prealloc
      
	  ;% LQR_V2_DW.TimeStampA
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% LQR_V2_DW.LastUAtTimeA
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% LQR_V2_DW.TimeStampB
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% LQR_V2_DW.LastUAtTimeB
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% LQR_V2_DW.TimeStampA_f
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% LQR_V2_DW.LastUAtTimeA_f
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% LQR_V2_DW.TimeStampB_p
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% LQR_V2_DW.LastUAtTimeB_d
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
	  ;% LQR_V2_DW.TimeStampA_k
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 8;
	
	  ;% LQR_V2_DW.LastUAtTimeA_m
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 9;
	
	  ;% LQR_V2_DW.TimeStampB_i
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 10;
	
	  ;% LQR_V2_DW.LastUAtTimeB_m
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 11;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 25;
      section.data(25)  = dumData; %prealloc
      
	  ;% LQR_V2_DW.AnalogOutput_PWORK
	  section.data(1).logicalSrcIdx = 12;
	  section.data(1).dtTransOffset = 0;
	
	  ;% LQR_V2_DW.AnalogOutput1_PWORK
	  section.data(2).logicalSrcIdx = 13;
	  section.data(2).dtTransOffset = 1;
	
	  ;% LQR_V2_DW.AnalogInput_PWORK
	  section.data(3).logicalSrcIdx = 14;
	  section.data(3).dtTransOffset = 2;
	
	  ;% LQR_V2_DW.AnalogInput1_PWORK
	  section.data(4).logicalSrcIdx = 15;
	  section.data(4).dtTransOffset = 3;
	
	  ;% LQR_V2_DW.Scope2_PWORK.LoggedData
	  section.data(5).logicalSrcIdx = 16;
	  section.data(5).dtTransOffset = 4;
	
	  ;% LQR_V2_DW.Scope5_PWORK.LoggedData
	  section.data(6).logicalSrcIdx = 17;
	  section.data(6).dtTransOffset = 5;
	
	  ;% LQR_V2_DW.Scope6_PWORK.LoggedData
	  section.data(7).logicalSrcIdx = 18;
	  section.data(7).dtTransOffset = 6;
	
	  ;% LQR_V2_DW.ToWorkspace1_PWORK.LoggedData
	  section.data(8).logicalSrcIdx = 19;
	  section.data(8).dtTransOffset = 7;
	
	  ;% LQR_V2_DW.ToWorkspace2_PWORK.LoggedData
	  section.data(9).logicalSrcIdx = 20;
	  section.data(9).dtTransOffset = 8;
	
	  ;% LQR_V2_DW.Scope1_PWORK.LoggedData
	  section.data(10).logicalSrcIdx = 21;
	  section.data(10).dtTransOffset = 9;
	
	  ;% LQR_V2_DW.Scope3_PWORK.LoggedData
	  section.data(11).logicalSrcIdx = 22;
	  section.data(11).dtTransOffset = 10;
	
	  ;% LQR_V2_DW.Scope4_PWORK.LoggedData
	  section.data(12).logicalSrcIdx = 23;
	  section.data(12).dtTransOffset = 11;
	
	  ;% LQR_V2_DW.Theta_P_PWORK.LoggedData
	  section.data(13).logicalSrcIdx = 24;
	  section.data(13).dtTransOffset = 12;
	
	  ;% LQR_V2_DW.ToWorkspace_PWORK.LoggedData
	  section.data(14).logicalSrcIdx = 25;
	  section.data(14).dtTransOffset = 13;
	
	  ;% LQR_V2_DW.ToWorkspace3_PWORK.LoggedData
	  section.data(15).logicalSrcIdx = 26;
	  section.data(15).dtTransOffset = 14;
	
	  ;% LQR_V2_DW.u1_PWORK.LoggedData
	  section.data(16).logicalSrcIdx = 27;
	  section.data(16).dtTransOffset = 15;
	
	  ;% LQR_V2_DW.ToWorkspace1_PWORK_k.LoggedData
	  section.data(17).logicalSrcIdx = 28;
	  section.data(17).dtTransOffset = 16;
	
	  ;% LQR_V2_DW.ToWorkspace2_PWORK_p.LoggedData
	  section.data(18).logicalSrcIdx = 29;
	  section.data(18).dtTransOffset = 17;
	
	  ;% LQR_V2_DW.ToWorkspace3_PWORK_o.LoggedData
	  section.data(19).logicalSrcIdx = 30;
	  section.data(19).dtTransOffset = 18;
	
	  ;% LQR_V2_DW.ToWorkspace4_PWORK.LoggedData
	  section.data(20).logicalSrcIdx = 31;
	  section.data(20).dtTransOffset = 19;
	
	  ;% LQR_V2_DW.U_PWORK.LoggedData
	  section.data(21).logicalSrcIdx = 32;
	  section.data(21).dtTransOffset = 20;
	
	  ;% LQR_V2_DW.th_PWORK.LoggedData
	  section.data(22).logicalSrcIdx = 33;
	  section.data(22).dtTransOffset = 21;
	
	  ;% LQR_V2_DW.th_p_PWORK.LoggedData
	  section.data(23).logicalSrcIdx = 34;
	  section.data(23).dtTransOffset = 22;
	
	  ;% LQR_V2_DW.x_PWORK.LoggedData
	  section.data(24).logicalSrcIdx = 35;
	  section.data(24).dtTransOffset = 23;
	
	  ;% LQR_V2_DW.x_p_PWORK.LoggedData
	  section.data(25).logicalSrcIdx = 36;
	  section.data(25).dtTransOffset = 24;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% LQR_V2_DW.If_ActiveSubsystem
	  section.data(1).logicalSrcIdx = 37;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% LQR_V2_DW.IfActionSubsystem1.IfActionSubsystem_SubsysRanBC
	  section.data(1).logicalSrcIdx = 38;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(4) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% LQR_V2_DW.IfActionSubsystem.IfActionSubsystem_SubsysRanBC
	  section.data(1).logicalSrcIdx = 39;
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


  targMap.checksum0 = 3116982799;
  targMap.checksum1 = 608063096;
  targMap.checksum2 = 964152682;
  targMap.checksum3 = 2580546118;

