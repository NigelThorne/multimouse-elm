var gulp = require("gulp");

require("elm-expressway/gulpfile")(gulp, "Elm", "Client.elm");

gulp.task("default", ["elm-expressway_default"]);
