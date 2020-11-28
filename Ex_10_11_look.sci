//This Source file is written by Nikita Rath (18BLC1131), VIT Chennai
//Function for  LOOK
function [] = look(a,head,n)
    printf("Order of Track   ");
    seek_count = 0;
    ihead = head;
    previous_head = 1805;
    direction = head - previous_head;
    temp1 = 1;
    temp2 = 1;
    //Traversing through requests
    for i = 1:n
        //Request greater or less than head
        if(a(i)>=head) then
            queue1(temp1)=a(i);
            temp1 = temp1 + 1;
        else
            queue2(temp2)=a(i);
            temp2 = temp2 + 1;
        end
    end
    //Sort request greater than head (Ascending)
    for i = 1:temp1-2
        for j = i+1:temp1-1
            if (queue1(i) > queue1(j)) then
                temp = queue1(i);
                queue1(i) = queue1(j);
                queue1(j) = temp;
            end
        end
    end
    //Sort request less than head (Ascending)
    for i = 1:temp2-2
        for j = i+1:temp2-1
            if (queue2(i) > queue2(j)) then
                temp = queue2(i);
                queue2(i) = queue2(j);
                queue2(j) = temp;
            end
        end
    end
    loop = 2;
    j = 1;
    //For traversing through right and left of the head
    while (loop>0)
        //Left side or Right side
        if(direction<0)
            //Traversing to the left side (decrementing)
            for i=temp2-1:-1:1
                queue(j) = queue2(i);
                j = j + 1;
                //Calculate the distance between requests
                distance = abs(queue2(i) - head);
                //Increment seek_count with the distance
                seek_count = seek_count + distance;
                head = queue2(i);
                printf("   T%d   ",j-1);
            end
            //Turn towards right side
            direction = 1;
        elseif(direction>0)
             //Traversing to the right side
             for i=1:temp1-1
                 queue(j) = queue1(i);
                 j = j + 1;
                 //Calculate the distance between requests
                 distance = abs(queue1(i) - head);
                 //Increment seek_count with the distance
                 seek_count = seek_count + distance;
                 head = queue1(i);
                 printf("   T%d   ",j-1);
             end
             //Turn towards left side
             direction = -1;
         end
         loop = loop - 1;
    end
    printf("  T%d   ",j);
    printf("\nNo. of Cylinders");
    printf("   %d ",ihead);
    //Order of request execution
    for i = 1:j-1
        printf("   %4d ",queue(i));
    end
    //Total distance
    printf("\n  Total distance : %d", seek_count);
endfunction
