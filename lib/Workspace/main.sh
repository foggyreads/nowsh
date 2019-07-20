#/usr/bin

Workspace()
{

    nwork_p='/home/'$(whoami)'/Now/lib/Workspace';
    if [ "create" = $1 ];
    then
        source $nwork_p/create.sh && Workspace__create;
    fi;


}