function manualValidate(ev) {
  ev.target.checkValidity();
return false;
}
$("#form").bind("submit", manualValidate);