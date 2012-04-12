$(function() {
  $("#ldap-auth").hide();
  $("#db-auth").hide();
  $("#submitform").hide();
  $("#db_auth_true").click(function() {
    $("#ldap-auth").hide();
    $("#db-auth").show();
    $("#submitform").show();
  });

  $("#db_auth_false").click(function() {
    $("#ldap-auth").show();
    $("#db-auth").hide();
    $("#submitform").show();
  });      
});
