import 'package:flutter/material.dart';

void main() {
  runApp(MatrixMultiplyApp());
}

class MatrixMultiplyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matrix Multiplier',
      home: MatrixMultiplyScreen(),
    );
  }
}

class MatrixMultiplyScreen extends StatefulWidget {
  @override
  _MatrixMultiplyScreenState createState() => _MatrixMultiplyScreenState();
}

class _MatrixMultiplyScreenState extends State<MatrixMultiplyScreen> {
  int s11 = 0;
  int s12 = 0;
  int s13 = 0;
  int s21 = 0;
  int s22 = 0;
  int s23 = 0;
  int s31 = 0;
  int s32 = 0;
  int s33 = 0;
  int t11 = 0;
  int t12 = 0;
  int t13 = 0;
  int t21 = 0;
  int t22 = 0;
  int t23 = 0;
  int t31 = 0;
  int t32 = 0;
  int t33 = 0;
  int p11 = 0;
  int p12 = 0;
  int p13 = 0;
  int p21 = 0;
  int p22 = 0;
  int p23 = 0;
  int p31 = 0;
  int p32 = 0;
  int p33 = 0;

  void updateS(int row, int col) {
    setState(() {
      if (row == 0 && col == 0) {
        s11 = (s11 + 1) % 10;
      } else if (row == 0 && col == 1) {
        s12 = (s12 + 1) % 10;
      } else if (row == 0 && col == 2) {
        s13 = (s13 + 1) % 10;
      } else if (row == 1 && col == 0) {
        s21 = (s21 + 1) % 10;
      } else if (row == 1 && col == 1) {
        s22 = (s22 + 1) % 10;
      } else if (row == 1 && col == 2) {
        s23 = (s23 + 1) % 10;
      } else if (row == 2 && col == 0) {
        s31 = (s31 + 1) % 10;
      } else if (row == 2 && col == 1) {
        s32 = (s32 + 1) % 10;
      } else if (row == 2 && col == 2) {
        s33 = (s33 + 1) % 10;
      }
    });
  }

  void updateT(int row, int col) {
    setState(() {
      if (row == 0 && col == 0) {
        t11 = (t11 + 1) % 10;
      }  else if (row == 0 && col == 1) {
        t12 = (t12 + 1) % 10;
      } else if (row == 0 && col == 2) {
        t13 = (t13 + 1) % 10;
      } else if (row == 1 && col == 0) {
        t21 = (t21 + 1) % 10;
      } else if (row == 1 && col == 1) {
        t22 = (t22 + 1) % 10;
      } else if (row == 1 && col == 2) {
        t23 = (t23 + 1) % 10;
      } else if (row == 2 && col == 0) {
        t31 = (t31 + 1) % 10;
      } else if (row == 2 && col == 1) {
        t32 = (t32 + 1) % 10;
      } else if (row == 2 && col == 2) {
        t33 = (t33 + 1) % 10;
      }
    });
  }
 void updateP() {
   setState(() {
   p11=(s11*t11 + s12*t21 + s13*t31)%10;
   p12=(s11*t12+s12*t22+s13*t32)%10;
   p13=(s11*t13+s12*t23+s13*t33)%10;
   p21=(s21*t11+s22*t21+s23*t31)%10;
   p22=(s21*t12+s22*t22+s23*t32)%10;
   p23=(s21*t13+s22*t23+s23*t33)%10;
   p31=(s31*t11+s32*t21+s33*t31)%10;
   p32=(s31*t12+s32*t22+s33*t32)%10;
   p33=(s31*t13+s32*t23+s33*t33)%10;
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matrix Multiplier'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "Matrix Multiplier",
            //   style: TextStyle(fontSize: 20),
            // ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    _buildMatrixCell(s11, 0, 0, updateS),
                    _buildMatrixCell(s21, 1, 0, updateS),
                    _buildMatrixCell(s31, 2, 0, updateS),
                  ],
                ),

                Column(
                  children: [
                    _buildMatrixCell(s12, 0, 1, updateS),
                    _buildMatrixCell(s22, 1, 1, updateS),
                    _buildMatrixCell(s32, 2, 1, updateS),
                  ],
                ),

                Column(
                  children: [
                    _buildMatrixCell(s13, 0, 2, updateS),
                    _buildMatrixCell(s23, 1, 2, updateS),
                    _buildMatrixCell(s33, 2, 2, updateS),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text("x", style: TextStyle(fontSize: 30)),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    _buildMatrixCell(t11, 0, 0, updateT),
                    _buildMatrixCell(t21, 1, 0, updateT),
                    _buildMatrixCell(t31, 2, 0, updateT),
                  ],
                ),


                Column(
                  children: [
                    _buildMatrixCell(t12, 0, 1, updateT),
                    _buildMatrixCell(t22, 1, 1, updateT),
                    _buildMatrixCell(t32, 2, 1, updateT),
                  ],
                ),


                Column(
                  children: [
                    _buildMatrixCell(t13, 0, 2, updateT),
                    _buildMatrixCell(t23, 1, 2, updateT),
                    _buildMatrixCell(t33, 2, 2, updateT),
                  ],
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  _buildCell(p11),
                  _buildCell(p21),
                  _buildCell(p31),
                ],
              ),
              Column(
                children: [
                  _buildCell(p12),
                  _buildCell(p22),
                  _buildCell(p32),
                ],
              ),
              Column(
                children: [
                  _buildCell(p13),
                  _buildCell(p23),
                  _buildCell(p33),
                ],
              ),
            ],
          ),



      ],
        ),

      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        updateP();

        },
        backgroundColor: Colors.purple[200],
        foregroundColor: Colors.purple[600],
        label: Text('MULTIPLY'),
      ),
    );
  }

  Widget _buildMatrixCell(int value, int row, int col, Function(int, int) onPressed) {
    return GestureDetector(
      onTap: () => onPressed(row, col),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Center(
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }



  Widget _buildCell(int text) {
  return Container(
    height:50,
    width:50,
  padding: EdgeInsets.all(5.0), // Adjust padding as needed
  decoration: BoxDecoration(
  border: Border.all(),
  ),
  child:Center(
  child: Text(
    text.toString(),
    style:TextStyle(fontSize: 30),
  ),),
  );
  }


}


