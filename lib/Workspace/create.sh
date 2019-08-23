#/usr/bin

Workspace_setup_tools()
{
    sudo npm install -g create-react-app;
}

Workspace__create()
{
    if [ ! -d /Workspace ];
    then
        mkdir /Workspace/{Code,Write,Read,See,Sort,Think};
        Workspace_setup_tools;
        echo "Workspace created.";
    else
        echo "Workspace exists already.";
    fi;
    cd /Workspace;
}
