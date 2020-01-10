# SootingGame
FPGA-project-team9
        
**Input/Output unit:**

操控按鈕( (s1,s2左右移動) 、 (s3射擊) 、 (s4開始) ) :
![image](https://github.com/yzxjyzxj52/SootingGame/blob/master/202016_200106_0004.jpg)

關卡選擇和暫停(藍色部分s1、s2控制關卡總共有四個關卡,s4是暫停):
![image](https://github.com/yzxjyzxj52/SootingGame/blob/master/202016_200106_0003.jpg)

計時倒數:
![image](https://github.com/yzxjyzxj52/SootingGame/blob/master/202016_200106_0002.jpg)

實際遊玩畫面:
![image](https://github.com/yzxjyzxj52/SootingGame/blob/master/202016_200106_0001.jpg)

**功能說明:**
  在限定時間內將敵人打完。
  
**程式模組說明:**

        module project (
         input l, //往右 接到4-bit sw S1 
         input r, //往左 接到4-bit sw S2 
         input CLK, //時間 FPGA內建時鐘PIN_22
         input shoot, //射擊 接到4-bit sw S3
         input pause, //HIGH為暫停 LOW為繼續 接到8-bit DIPSW DSW8
         input [1:0] background, //以2進位表示0到3 來選擇1到4個關卡 接到8-bit DIPSW DSW5 DSW6
         input start, //選好關卡後按下開始遊戲 接到4-bit sw S4 
         output  reg [2:0] c, // 控制亮哪排8X8 LED 接到 8X8 LED 的S0~S2         
         output  [7:0] cr, //控制亮紅色 接到 8X8 LED 的CR1 ~ CR8
         output  [7:0] cg, //控制亮綠色 接到 8X8 LED 的CG1 ~ CG8
         output  [7:0] cb, //控制亮藍色 接到 8X8 LED 的CB1 ~ CB8
         output EN, //Enable = 1 時8X8 LED才會亮 接到8X8 LED的EN
         output  [6:0] clock //剩餘時間顯示 接到7-SEG X4 的A~G
        );

**Demo video:**
https://www.youtube.com/watch?v=pRmtF7EtWlE&feature=youtu.be




https://drive.google.com/open?id=1CW8G2y5ubgJoRUhm4S20XUHHpmMa5r5H
