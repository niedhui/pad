function setMonster(monster) {
  var source = $("#monster-template").html()
  var template = Handlebars.compile(source)
  var result = template({monster: monster})
  $(".monster").append(result)
}

