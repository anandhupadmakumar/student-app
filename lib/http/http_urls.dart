class HttpUrls {
  static String baseUrl = 'https://trinityapi.trackbox.in';
  // static String baseUrl = 'http://DESKTOP-IK6ME8M:3515';https://de01-103-214-232-130.ngrok-free.app

  // static String baseUrl = 'https://puny-shoes-repeat.loca.lt';
  // static String baseUrl = 'https://nine-icons-joke.loca.lt';
  // static String baseUrl = 'https://6e78-103-214-232-130.ngrok-free.app';

  // static String baseUrl='http://DESKTOP-ST1542P:3509';
  // static String baseUrl='http://DESKTOP-RATELVD:3514';
  // static String baseUrl = 'http://DESKTOP-NLO2RMM:3514';
  // static String baseUrl = 'http://DESKTOP-CNJB3P7:3514';
  // static String baseUrl = 'https://smooth-socks-attend.loca.lt';

  //endpoints
  static String login = '/api/authaccount/login';


    static String courseSearch = '/Public_Data/Public_Search_Course/';
  

  static String agentLogin = '/Login/Agent_Login/';

  static String getOtp = '/public_Data/Get_OTP/';
  static String checkOtp = '/public_Data/Check_OTP/';
  static String notificationUrl = '/Customer_Request_Notification';
  static String notificationUrlReschedule =
      '/Task_Reschedule_Request_Notification';

  static String saveCustomerRequest = '/Customer/Save_Customer_Request/';
  static String getCustomerEquipments = '/Customer/Get_Customer_Location_Equipments/';

  static String getCustomerPlace = '/Customer/get_Customer_Place/';
  static String saveEnquiries = '/public_Data/Save_Enquiries/';
  static String getCustomerTask = '/Customer/Get_Customer_Task/';

  static String getUserTask = '/Customer/Get_User_Task/';
  static String getUserTaskDateRange = '/Customer/Get_User_Task_Date_Range/';

  static String getTaskDetails = '/Customer/Get_Task_Details/';
  static String saveTaskDetails = '/Customer/save_task_details/';
  static String getTestEquipment = '/Customer/Get_Test_Equpitment/';
  static String getTestDocument = '/Customer/Get_Test_Document/';
  static String saveTaskTest = '/Customer/Save_Task_Test/';
  static String searchExpiringInspections =
      '/Customer/Search_Expiring_Inspection_Report_App/';
  static String getTestppe = '/Customer/Get_Test_PPE/';
  static String saveTaskRiskAssistants = '/Customer/Save_Task_Risk_Assistants/';
  static String saveTaskRiskAssistantsPhysicalHazard =
      '/Customer/Save_Task_Risk_Assistants_physical_hazard/';
  static String saveTaskRiskAssistantsSafetyHzard =
      '/Customer/Save_Task_Risk_Assistants_safety_hazard/';
  static String saveTaskRiskAssistantsChemicalHazard =
      '/Customer/Save_Task_Risk_Assistants_chemical_hazard/';
  static String saveTaskRiskAssistantsBiologicalHazard =
      '/Customer/Save_Task_Risk_Assistants_biological_hazard/';
  static String saveTaskRiskAssistantsErgonomicsHazard =
      '/Customer/Save_Task_Risk_Assistants_ergonomics_hazard/';
  static String getTotalEquipments = '/Customer/Get_Total_Equipments/';

  static String saveTaskStop = '/Customer/Save_Task_Stop/';

  static String savePublicInspection = '/public_Data/Save_Public_Inspection/';
  static String saveCustomerReschedule = '/Customer/Save_Customer_Reschedule/';

  static String getFullUsers = '/Customer/Get_Full_Users/';

  static String changeTaskUser = '/Customer/Change_Task_User/';
  static String checkVersion = '/Public_Data/Check_Version/';
}
