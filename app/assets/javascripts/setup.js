// Because relrod says I should do it this way.
$(function() {
  $("#ldap-auth").hide();
  $("#db-auth").hide();
  $("#db_auth_true").click(function() { $("#ldap-auth").hide(); $("#db-auth").show(); } )
  $("#db_auth_false").click(function() {$("#ldap-auth").show(); $("#db-auth").hide(); } )
});
