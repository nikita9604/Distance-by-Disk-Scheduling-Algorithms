//This Source file is written by Nikita Rath (18BLC1131), VIT Chennai
//Function for  C-SCAN
function [] = cscan(a,head,n)
    printf("Order of Track   ");
    seek_count = 0;
    ihead = head;
    maximum = 4999;
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
    //Request ordering begins
    i = 1;
    //Traversing to the right side
    for j = 1:temp1-1
        i  = i + 1;
        queue(i) = queue1(j);
    end
    //Reaches the maximum disk limit
    queue(i+1) = maximum;
    //Turns to the minimum disk limit
    queue(i+2) = 0;
    i = temp1+2;
    //Traversing to the left side
    for j = 1:temp2-1
        i = i + 1;
        queue(i) = queue2(j);
    end
    queue(1)=head;
    //Traversing through final request order
    for j = 1:n+2
        //Calculate the distance between requests
        distance = abs(queue(j+1)-queue(j));
        //Increment seek_count with the distance
        seek_count = seek_count + distance;
        //Order of request execution
        printf("   T%d   ",j);
        //printf(" - %d",queue(j+1));
    end
    printf(" T%d   ",j+1);
    printf("\nNo. of Cylinders");
    printf("   %d ",ihead);
    //Order of request execution
    for j = 1:n+2
        printf("   %4d ",queue(j+1));
    end
    //Total distance
    printf("\n  Total distance : %d", seek_count);
endfunction
