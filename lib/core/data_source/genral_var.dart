class StudentInfo{
  String studentId='';
  String studentIMEI='';
  setValues({required String studentId,required String studentIMEI}){
    this.studentId=studentId;
    this.studentIMEI=studentIMEI;
  }
  setStudentId({required String studentId}){
    this.studentId=studentId;
  }
}