class Subject {
  String? subID;
  String? subName;
  int? credit;
  bool checked;

  Subject(this.subID, this.subName, this.credit, this.checked);
  static List<Subject> getsubject() {
    return [
      Subject('0215001', 'Mobile App', 3, false),
      Subject('0215002', 'Chatbot', 3, false),
      Subject('0215003', 'Database', 4, false),
      Subject('0215004', 'Decision Support System', 3, false),
      Subject('0215005', 'Web Application', 3, false),
    ];
  }
}
