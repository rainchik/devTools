docker_containers_array=`docker ps --format "{{.Names}}"`

for docker_container_name in ${docker_containers_array[@]}
  do
  echo $docker_container_name
  volumes_array=(`docker inspect $docker_container_name | jq '.[] | .GraphDriver | .Data | .LowerDir' -r | grep -o -P '[a-f0-9]{64}'`)

  for volume in ${volumes_array[@]};
    do
    du -sh "/var/lib/docker/overlay2/"$volume
    done
done
