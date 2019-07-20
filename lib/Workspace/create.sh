#/usr/bin


Workspace__create()
{
    if [ ! -d /Workspace ];
    then
        mkdir /Workspace/{Code,Write,See,Sort,Think};
        echo "Workspace created.";
    else
        echo "Workspace exists already.";
    fi;
    cd /Workspace;
}
