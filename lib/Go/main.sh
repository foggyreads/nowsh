#/usr/bin

Go()
{
    Go__main $@;
}

Go__main()
{
    p=$(find /Workspace/Code -maxdepth 2 -type d -iname "*$1*" | head -n 1);
    if [ -d $p/htdocs ];
    then
        cd $p/htdocs;
    elif [ -d $p/www ];
    then
        cd $p/www;
    else
        echo "Project not found.";
    fi;
}