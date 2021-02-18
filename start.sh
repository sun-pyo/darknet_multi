#!/bin/bash


res1=$(date +%s.%N)


for i in {1..30}
do
#	sudo /usr/local/cuda/bin/nvprof --profile-from-start off --export-profile timeline-$i.prop -f 
./darknet -num $i classifier predict cfg/imagenet1k.data cfg/densenet201.cfg densenet201.weights data/eagle.jpg &
done
'''
for i in {2..3}
do
./darknet -num $i classifier predict cfg/imagenet1k.data cfg/resnet152.cfg resnet152.weights data/eagle.jpg &
done
for i in {4..5}
do
./darknet -num $i classifier predict cfg/imagenet1k.data cfg/vgg-16.cfg vgg-16.weights data/eagle.jpg &
done
for i in {6..7}
do
./darknet -num $i classifier predict cfg/imagenet1k.data cfg/alexnet.cfg alexnet.weights data/eagle.jpg &
done
for i in {9..}
do
#	sudo /usr/local/cuda/bin/nvprof --profile-from-start off --export-profile timeline-$i.prop -f 
./darknet -num $i classifier predict cfg/imagenet1k.data cfg/resnet152.cfg resnet152.weights data/eagle.jpg &
done

for i in {17..18}
do
#	sudo /usr/local/cuda/bin/nvprof --profile-from-start off --export-profile timeline-$i.prop -f 
./darknet -num $i classifier predict cfg/imagenet1k.data cfg/vgg-16.cfg vgg-16.weights data/eagle.jpg &
done

for i in {19..20}
do
	#sudo /usr/local/cuda/bin/nvprof --profile-from-start off --export-profile timeline-$i.prop -f 
	./darknet -num $i classifier predict cfg/imagenet1k.data cfg/alexnet.cfg alexnet.weights data/eagle.jpg &
done
	#./darknet -num 2 classifier predict cfg/imagenet1k.data cfg/densenet201.cfg densenet201.weights data/eagle.jpg &
	#./darknet -num 3 classifier predict cfg/imagenet1k.data cfg/densenet201.cfg densenet201.weights data/eagle.jpg &
	#./darknet -num 4  classifier predict cfg/imagenet1k.data cfg/densenet201.cfg densenet201.weights data/eagle.jpg &
#./darknet -num 5 classifier predict cfg/imagenet1k.data cfg/resnet152.cfg resnet152.weights data/eagle.jpg &
	#./darknet -num 6 classifier predict cfg/imagenet1k.data cfg/resnet152.cfg resnet152.weights data/eagle.jpg &
	#./darknet -num 7 classifier predict cfg/imagenet1k.data cfg/resnet152.cfg resnet152.weights data/eagle.jpg &


	#./darknet -num 8 classifier predict cfg/imagenet1k.data cfg/resnet152.cfg resnet152.weights data/eagle.jpg 
'''

# do stuff in here

res2=$(date +%s.%N)
dt=$(echo "$res2 - $res1" | bc)
dd=$(echo "$dt/86400" | bc)
dt2=$(echo "$dt-86400*$dd" | bc)
dh=$(echo "$dt2/3600" | bc)
dt3=$(echo "$dt2-3600*$dh" | bc)
dm=$(echo "$dt3/60" | bc)
ds=$(echo "$dt3-60*$dm" | bc)

LC_NUMERIC=C printf "Total runtime: %d:%02d:%02d:%02.4f\n" $dd $dh $dm $ds


