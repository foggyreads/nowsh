#/usr/bin

Remove__main()
{
    if [ -d /Workspace/Code/$1 ];
    then
        rm -rf /Workspace/Code/$1;
        find /Workspace/Code/nginx.conf.d -type f -name "$1*.conf" -delete;
    fi;
}

Remove()
{
    Remove__main $1;
}