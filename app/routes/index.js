exports.index = function(req, res) {
  res.render('index');
};

exports.partials = function(req, res) {
  res.render('app/partials/' + req.params.name);
};
