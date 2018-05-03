  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 5;
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
    ;% Auto data (kjqvozxyvv)
    ;%
      section.nData     = 8;
      section.data(8)  = dumData; %prealloc
      
	  ;% kjqvozxyvv.PIDController_D
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% kjqvozxyvv.PIDController_I
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% kjqvozxyvv.DiscreteDerivative_ICPrevScaled
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% kjqvozxyvv.DiscreteDerivative1_ICPrevScale
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% kjqvozxyvv.PIDController_LowerSaturationLi
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% kjqvozxyvv.PIDController_N
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% kjqvozxyvv.PIDController_P
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% kjqvozxyvv.PIDController_UpperSaturationLi
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% kjqvozxyvv.DiscreteDerivative2_ICPrevScale
	  section.data(1).logicalSrcIdx = 8;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 39;
      section.data(39)  = dumData; %prealloc
      
	  ;% kjqvozxyvv.Delay_InitialCondition
	  section.data(1).logicalSrcIdx = 9;
	  section.data(1).dtTransOffset = 0;
	
	  ;% kjqvozxyvv.Integrator_gainval
	  section.data(2).logicalSrcIdx = 10;
	  section.data(2).dtTransOffset = 1;
	
	  ;% kjqvozxyvv.Integrator_IC
	  section.data(3).logicalSrcIdx = 11;
	  section.data(3).dtTransOffset = 2;
	
	  ;% kjqvozxyvv.Filter_gainval
	  section.data(4).logicalSrcIdx = 12;
	  section.data(4).dtTransOffset = 3;
	
	  ;% kjqvozxyvv.Filter_IC
	  section.data(5).logicalSrcIdx = 13;
	  section.data(5).dtTransOffset = 4;
	
	  ;% kjqvozxyvv.LSBtoV_Gain
	  section.data(6).logicalSrcIdx = 14;
	  section.data(6).dtTransOffset = 5;
	
	  ;% kjqvozxyvv.MomentSensorOffset_Value
	  section.data(7).logicalSrcIdx = 15;
	  section.data(7).dtTransOffset = 6;
	
	  ;% kjqvozxyvv.MomentSensorGainNmV_Gain
	  section.data(8).logicalSrcIdx = 16;
	  section.data(8).dtTransOffset = 7;
	
	  ;% kjqvozxyvv.DiscreteFIRFilter_InitialStates
	  section.data(9).logicalSrcIdx = 17;
	  section.data(9).dtTransOffset = 8;
	
	  ;% kjqvozxyvv.DiscreteFIRFilter_Coefficients
	  section.data(10).logicalSrcIdx = 18;
	  section.data(10).dtTransOffset = 9;
	
	  ;% kjqvozxyvv.MomentDeadZone_Start
	  section.data(11).logicalSrcIdx = 19;
	  section.data(11).dtTransOffset = 19;
	
	  ;% kjqvozxyvv.MomentDeadZone_End
	  section.data(12).logicalSrcIdx = 20;
	  section.data(12).dtTransOffset = 20;
	
	  ;% kjqvozxyvv.DesiredMotorPosbs_extension_Amp
	  section.data(13).logicalSrcIdx = 21;
	  section.data(13).dtTransOffset = 21;
	
	  ;% kjqvozxyvv.DesiredMotorPosbs_extension_Fre
	  section.data(14).logicalSrcIdx = 22;
	  section.data(14).dtTransOffset = 22;
	
	  ;% kjqvozxyvv.Constant1_Value
	  section.data(15).logicalSrcIdx = 23;
	  section.data(15).dtTransOffset = 23;
	
	  ;% kjqvozxyvv.ExtensionConversion_Gain
	  section.data(16).logicalSrcIdx = 24;
	  section.data(16).dtTransOffset = 24;
	
	  ;% kjqvozxyvv.RPMConversion_Gain
	  section.data(17).logicalSrcIdx = 25;
	  section.data(17).dtTransOffset = 25;
	
	  ;% kjqvozxyvv.TSamp_WtEt
	  section.data(18).logicalSrcIdx = 26;
	  section.data(18).dtTransOffset = 26;
	
	  ;% kjqvozxyvv.DiscreteFIRFilter6_InitialState
	  section.data(19).logicalSrcIdx = 27;
	  section.data(19).dtTransOffset = 27;
	
	  ;% kjqvozxyvv.DiscreteFIRFilter6_Coefficients
	  section.data(20).logicalSrcIdx = 28;
	  section.data(20).dtTransOffset = 28;
	
	  ;% kjqvozxyvv.BipolarVoffset_Value
	  section.data(21).logicalSrcIdx = 29;
	  section.data(21).dtTransOffset = 38;
	
	  ;% kjqvozxyvv.ActualCurrentGainAV_Gain
	  section.data(22).logicalSrcIdx = 30;
	  section.data(22).dtTransOffset = 39;
	
	  ;% kjqvozxyvv.DiscreteFIRFilter2_InitialState
	  section.data(23).logicalSrcIdx = 31;
	  section.data(23).dtTransOffset = 40;
	
	  ;% kjqvozxyvv.DiscreteFIRFilter2_Coefficients
	  section.data(24).logicalSrcIdx = 32;
	  section.data(24).dtTransOffset = 41;
	
	  ;% kjqvozxyvv.thetaz_dOffset_Value
	  section.data(25).logicalSrcIdx = 33;
	  section.data(25).dtTransOffset = 51;
	
	  ;% kjqvozxyvv.degs_Gain
	  section.data(26).logicalSrcIdx = 34;
	  section.data(26).dtTransOffset = 52;
	
	  ;% kjqvozxyvv.DiscreteFIRFilter3_InitialState
	  section.data(27).logicalSrcIdx = 35;
	  section.data(27).dtTransOffset = 53;
	
	  ;% kjqvozxyvv.DiscreteFIRFilter3_Coefficients
	  section.data(28).logicalSrcIdx = 36;
	  section.data(28).dtTransOffset = 54;
	
	  ;% kjqvozxyvv.TSamp_WtEt_jva4kknxrp
	  section.data(29).logicalSrcIdx = 37;
	  section.data(29).dtTransOffset = 64;
	
	  ;% kjqvozxyvv.DiscreteFIRFilter1_InitialState
	  section.data(30).logicalSrcIdx = 38;
	  section.data(30).dtTransOffset = 65;
	
	  ;% kjqvozxyvv.DiscreteFIRFilter1_Coefficients
	  section.data(31).logicalSrcIdx = 39;
	  section.data(31).dtTransOffset = 66;
	
	  ;% kjqvozxyvv.x_ddOffset_Value
	  section.data(32).logicalSrcIdx = 40;
	  section.data(32).dtTransOffset = 76;
	
	  ;% kjqvozxyvv.xgs_Gain
	  section.data(33).logicalSrcIdx = 41;
	  section.data(33).dtTransOffset = 77;
	
	  ;% kjqvozxyvv.DiscreteFIRFilter4_InitialState
	  section.data(34).logicalSrcIdx = 42;
	  section.data(34).dtTransOffset = 78;
	
	  ;% kjqvozxyvv.DiscreteFIRFilter4_Coefficients
	  section.data(35).logicalSrcIdx = 43;
	  section.data(35).dtTransOffset = 79;
	
	  ;% kjqvozxyvv.y_ddOffset_Value
	  section.data(36).logicalSrcIdx = 44;
	  section.data(36).dtTransOffset = 89;
	
	  ;% kjqvozxyvv.ygs_Gain
	  section.data(37).logicalSrcIdx = 45;
	  section.data(37).dtTransOffset = 90;
	
	  ;% kjqvozxyvv.DiscreteFIRFilter5_InitialState
	  section.data(38).logicalSrcIdx = 46;
	  section.data(38).dtTransOffset = 91;
	
	  ;% kjqvozxyvv.DiscreteFIRFilter5_Coefficients
	  section.data(39).logicalSrcIdx = 47;
	  section.data(39).dtTransOffset = 92;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% kjqvozxyvv.Delay_DelayLength
	  section.data(1).logicalSrcIdx = 48;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(4) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% kjqvozxyvv.LSBtoV3_Gain
	  section.data(1).logicalSrcIdx = 49;
	  section.data(1).dtTransOffset = 0;
	
	  ;% kjqvozxyvv.LSBtoV1_Gain
	  section.data(2).logicalSrcIdx = 50;
	  section.data(2).dtTransOffset = 1;
	
	  ;% kjqvozxyvv.LSBtoV2_Gain
	  section.data(3).logicalSrcIdx = 51;
	  section.data(3).dtTransOffset = 2;
	
	  ;% kjqvozxyvv.LSBtoV4_Gain
	  section.data(4).logicalSrcIdx = 52;
	  section.data(4).dtTransOffset = 3;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(5) = section;
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
    nTotSects     = 5;
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
    ;% Auto data (hsn4sl4dozq)
    ;%
      section.nData     = 24;
      section.data(24)  = dumData; %prealloc
      
	  ;% hsn4sl4dozq.dqha0y0crz
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% hsn4sl4dozq.ltqhms0scd
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% hsn4sl4dozq.pcatxu5h2b
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% hsn4sl4dozq.ey1evekj1i
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% hsn4sl4dozq.klwhs0hk5a
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 7;
	
	  ;% hsn4sl4dozq.hyc5v00bbs
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 8;
	
	  ;% hsn4sl4dozq.nnobrawjjy
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 9;
	
	  ;% hsn4sl4dozq.dnlwwv4sti
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 10;
	
	  ;% hsn4sl4dozq.ct0kljkh0a
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 11;
	
	  ;% hsn4sl4dozq.dzkuqyzta4
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 12;
	
	  ;% hsn4sl4dozq.hlkpvuvour
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 13;
	
	  ;% hsn4sl4dozq.oyljma5tz1
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 14;
	
	  ;% hsn4sl4dozq.ncjcem4cb3
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 15;
	
	  ;% hsn4sl4dozq.kzxxzdauu2
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 16;
	
	  ;% hsn4sl4dozq.dchz2m5jsp
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 17;
	
	  ;% hsn4sl4dozq.oa0lw13rjs
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 18;
	
	  ;% hsn4sl4dozq.ndl5wfbrpx
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 19;
	
	  ;% hsn4sl4dozq.dozqti1iue
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 20;
	
	  ;% hsn4sl4dozq.dzbazsfrqo
	  section.data(19).logicalSrcIdx = 18;
	  section.data(19).dtTransOffset = 21;
	
	  ;% hsn4sl4dozq.czo1e340y5
	  section.data(20).logicalSrcIdx = 19;
	  section.data(20).dtTransOffset = 22;
	
	  ;% hsn4sl4dozq.psqbbkcznr
	  section.data(21).logicalSrcIdx = 20;
	  section.data(21).dtTransOffset = 23;
	
	  ;% hsn4sl4dozq.i5wvx3tmzd
	  section.data(22).logicalSrcIdx = 21;
	  section.data(22).dtTransOffset = 24;
	
	  ;% hsn4sl4dozq.ja0xxwe4bv
	  section.data(23).logicalSrcIdx = 22;
	  section.data(23).dtTransOffset = 25;
	
	  ;% hsn4sl4dozq.lgux4ayn0c
	  section.data(24).logicalSrcIdx = 23;
	  section.data(24).dtTransOffset = 26;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% hsn4sl4dozq.k2syxcijzk
	  section.data(1).logicalSrcIdx = 24;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% hsn4sl4dozq.bjjnso1thb
	  section.data(1).logicalSrcIdx = 25;
	  section.data(1).dtTransOffset = 0;
	
	  ;% hsn4sl4dozq.ax4izzfx4z
	  section.data(2).logicalSrcIdx = 26;
	  section.data(2).dtTransOffset = 1;
	
	  ;% hsn4sl4dozq.f1ntowbovp
	  section.data(3).logicalSrcIdx = 27;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(3) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% hsn4sl4dozq.jp5rwrojt1
	  section.data(1).logicalSrcIdx = 28;
	  section.data(1).dtTransOffset = 0;
	
	  ;% hsn4sl4dozq.h5pqr3cmof
	  section.data(2).logicalSrcIdx = 29;
	  section.data(2).dtTransOffset = 4;
	
	  ;% hsn4sl4dozq.ly2iczhhac
	  section.data(3).logicalSrcIdx = 30;
	  section.data(3).dtTransOffset = 8;
	
	  ;% hsn4sl4dozq.gyeosksxj4
	  section.data(4).logicalSrcIdx = 31;
	  section.data(4).dtTransOffset = 12;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(4) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% hsn4sl4dozq.dtvruxvvrm
	  section.data(1).logicalSrcIdx = 32;
	  section.data(1).dtTransOffset = 0;
	
	  ;% hsn4sl4dozq.m5ibpa5dnw
	  section.data(2).logicalSrcIdx = 33;
	  section.data(2).dtTransOffset = 54;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(5) = section;
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
    nTotSects     = 4;
    sectIdxOffset = 5;
    
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
    ;% Auto data (cazrqmmbaux)
    ;%
      section.nData     = 16;
      section.data(16)  = dumData; %prealloc
      
	  ;% cazrqmmbaux.lauuignjpk
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% cazrqmmbaux.ehtqdxxsst
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% cazrqmmbaux.iun4jj2451
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% cazrqmmbaux.levw3ztjne
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% cazrqmmbaux.lvshpi4lox
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% cazrqmmbaux.gp4hl5lpxq
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% cazrqmmbaux.ptrdn45wdx
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% cazrqmmbaux.efzzka3bv3
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 15;
	
	  ;% cazrqmmbaux.cpxqmveisy
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 16;
	
	  ;% cazrqmmbaux.ct5njjxrw2
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 25;
	
	  ;% cazrqmmbaux.h2bxr4gpdd
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 34;
	
	  ;% cazrqmmbaux.eanlt2gwug
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 43;
	
	  ;% cazrqmmbaux.kw0fjlxyuv
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 44;
	
	  ;% cazrqmmbaux.cqbmmboa5t
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 53;
	
	  ;% cazrqmmbaux.mk4pababj2
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 62;
	
	  ;% cazrqmmbaux.io41sqtbcl
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 71;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% cazrqmmbaux.ahszwo5lqz.LoggedData
	  section.data(1).logicalSrcIdx = 16;
	  section.data(1).dtTransOffset = 0;
	
	  ;% cazrqmmbaux.i1us5dyol4.LoggedData
	  section.data(2).logicalSrcIdx = 17;
	  section.data(2).dtTransOffset = 3;
	
	  ;% cazrqmmbaux.m0umh0vytu.LoggedData
	  section.data(3).logicalSrcIdx = 18;
	  section.data(3).dtTransOffset = 5;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 8;
      section.data(8)  = dumData; %prealloc
      
	  ;% cazrqmmbaux.bjvg5lnv2y
	  section.data(1).logicalSrcIdx = 19;
	  section.data(1).dtTransOffset = 0;
	
	  ;% cazrqmmbaux.kj5zxijd1y
	  section.data(2).logicalSrcIdx = 20;
	  section.data(2).dtTransOffset = 1;
	
	  ;% cazrqmmbaux.l2ampej4i3
	  section.data(3).logicalSrcIdx = 21;
	  section.data(3).dtTransOffset = 2;
	
	  ;% cazrqmmbaux.jbdh1q5xid
	  section.data(4).logicalSrcIdx = 22;
	  section.data(4).dtTransOffset = 3;
	
	  ;% cazrqmmbaux.h0bylq2w0f
	  section.data(5).logicalSrcIdx = 23;
	  section.data(5).dtTransOffset = 4;
	
	  ;% cazrqmmbaux.izx1b2ugxx
	  section.data(6).logicalSrcIdx = 24;
	  section.data(6).dtTransOffset = 5;
	
	  ;% cazrqmmbaux.jir0xwdbgj
	  section.data(7).logicalSrcIdx = 25;
	  section.data(7).dtTransOffset = 6;
	
	  ;% cazrqmmbaux.nl5eomb0g1
	  section.data(8).logicalSrcIdx = 26;
	  section.data(8).dtTransOffset = 7;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% cazrqmmbaux.gf00ovkn30
	  section.data(1).logicalSrcIdx = 27;
	  section.data(1).dtTransOffset = 0;
	
	  ;% cazrqmmbaux.dkewvmutvq
	  section.data(2).logicalSrcIdx = 28;
	  section.data(2).dtTransOffset = 1;
	
	  ;% cazrqmmbaux.phbnmvwdby
	  section.data(3).logicalSrcIdx = 29;
	  section.data(3).dtTransOffset = 2;
	
	  ;% cazrqmmbaux.h1r2hl2bqo
	  section.data(4).logicalSrcIdx = 30;
	  section.data(4).dtTransOffset = 3;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(4) = section;
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


  targMap.checksum0 = 2156291764;
  targMap.checksum1 = 207798538;
  targMap.checksum2 = 598394117;
  targMap.checksum3 = 994088406;

