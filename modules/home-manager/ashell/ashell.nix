{ config, pkgs, ... }:
{
home.packages = [ pkgs.ashell ];


services.ashell = {
enable = true;


config = {
bar = {
position = "top";
height = 30;
margin = 0;
padding = 0;


left = [
{
type = "workspaces";
persistent = [1 2 3 4 5];
showIcons = false;
spacing = 4;
}
];


center = [
{
type = "window";
format = "[ {title} ]";
maxLength = 60;
}
];


right = [
{
type = "clock";
format = "%d.%m.%Y | %H:%M";
}
];


# Uncomment to enable tray
# right = [
# { type = "tray"; iconSize = 14; spacing = 4; }
# { type = "clock"; format = "%d.%m.%Y | %H:%M"; }
# ];
};
};


theme = ./style.css;
};
}
