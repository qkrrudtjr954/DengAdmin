package dto;

import java.io.Serializable;

public class AnimalBbsDto implements Serializable {

   private int seq;
   private String title; // 제목
   private String name; // 이름
   private int age; // 나이
   private String kinds; // 견종
   private String type; // 분류
   private String location; // 지역
   private int medicine; // 예방접종 여부
   private int neutralization; // 중성화
   private int gender; // 성별
   private String descripttion; // 특이사항
   private String pic1; // 사진URL
   private String content; // 내용
   private int userSeq; // 작성자
   private String contact; // 연락처
   private String description; // 기타사항
   private String reg_date; // 등록날짜
   private String last_update; // 마지막 수정날짜
   private int del;
   private int readcount;
   private String user_email;

   public AnimalBbsDto() {
   }

   public AnimalBbsDto(int seq, String title, String name, int age, String kinds, String type, String location,
         int medicine, int neutralization, int gender, String descripttion, String pic1, String content, int userSeq,
         String contact, String description, String reg_date, String last_update, int del, int readcount,
         String user_email) {
      super();
      this.seq = seq;
      this.title = title;
      this.name = name;
      this.age = age;
      this.kinds = kinds;
      this.type = type;
      this.location = location;
      this.medicine = medicine;
      this.neutralization = neutralization;
      this.gender = gender;
      this.descripttion = descripttion;
      this.pic1 = pic1;
      this.content = content;
      this.userSeq = userSeq;
      this.contact = contact;
      this.description = description;
      this.reg_date = reg_date;
      this.last_update = last_update;
      this.del = del;
      this.readcount = readcount;
      this.user_email = user_email;
   }
   public AnimalBbsDto(String title, String name, int age, String kinds, String type, String location, int medicine,
         int neutralization, int gender, String descripttion, String pic1, String content, int userSeq,
         String contact, String description) {
      super();
      this.title = title;
      this.name = name;
      this.age = age;
      this.kinds = kinds;
      this.type = type;
      this.location = location;
      this.medicine = medicine;
      this.neutralization = neutralization;
      this.gender = gender;
      this.descripttion = descripttion;
      this.pic1 = pic1;
      this.content = content;
      this.userSeq = userSeq;
      this.contact = contact;
      this.description = description;
   }

   public AnimalBbsDto(String title, String content) {
      super();
      this.title = title;
      this.content = content;
   }

   public int getSeq() {
      return seq;
   }

   public void setSeq(int seq) {
      this.seq = seq;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public int getAge() {
      return age;
   }

   public void setAge(int age) {
      this.age = age;
   }

   public String getKinds() {
      return kinds;
   }

   public void setKinds(String kinds) {
      this.kinds = kinds;
   }

   public String getType() {
      return type;
   }

   public void setType(String type) {
      this.type = type;
   }

   public String getLocation() {
      return location;
   }

   public void setLocation(String location) {
      this.location = location;
   }

   public int getMedicine() {
      return medicine;
   }

   public void setMedicine(int medicine) {
      this.medicine = medicine;
   }

   public int getNeutralization() {
      return neutralization;
   }

   public void setNeutralization(int neutralization) {
      this.neutralization = neutralization;
   }

   public int getGender() {
      return gender;
   }

   public void setGender(int gender) {
      this.gender = gender;
   }

   public String getDescripttion() {
      return descripttion;
   }

   public void setDescripttion(String descripttion) {
      this.descripttion = descripttion;
   }

   public String getPic1() {
      return pic1;
   }

   public void setPic1(String pic1) {
      this.pic1 = pic1;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public int getUserSeq() {
      return userSeq;
   }

   public void setUserSeq(int userSeq) {
      this.userSeq = userSeq;
   }

   public String getContact() {
      return contact;
   }

   public void setContact(String contact) {
      this.contact = contact;
   }

   public String getDescription() {
      return description;
   }

   public void setDescription(String description) {
      this.description = description;
   }

   public String getReg_date() {
      return reg_date;
   }

   public void setReg_date(String reg_date) {
      this.reg_date = reg_date;
   }

   public String getLast_update() {
      return last_update;
   }

   public void setLast_update(String last_update) {
      this.last_update = last_update;
   }

   public int getDel() {
      return del;
   }

   public void setDel(int del) {
      this.del = del;
   }

   public int getReadcount() {
      return readcount;
   }

   public void setReadcount(int readcount) {
      this.readcount = readcount;
   }

   public String getUser_email() {
      return user_email;
   }

   public void setUser_email(String user_email) {
      this.user_email = user_email;
   }

   @Override
   public String toString() {
      return "AnimalBbsDto [seq=" + seq + ", title=" + title + ", name=" + name + ", age=" + age + ", kinds=" + kinds
            + ", type=" + type + ", location=" + location + ", medicine=" + medicine + ", neutralization="
            + neutralization + ", gender=" + gender + ", descripttion=" + descripttion + ", pic1=" + pic1
            + ", content=" + content + ", userSeq=" + userSeq + ", contact=" + contact + ", description="
            + description + ", reg_date=" + reg_date + ", last_update=" + last_update + ", del=" + del
            + ", readcount=" + readcount + ", user_email=" + user_email + "]";
   }
   

}