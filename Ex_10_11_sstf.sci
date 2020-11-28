//This Source file is written by Nikita Rath (18BLC1131), VIT Chennai
//Function for SSTF
function [] = sstf(a,head,n)
    printf("Order of Track   ");
    seek_count = 0;
    ihead=head;
    //Initialise the requests yet to be executed with -1
    for i = 1:n
        done(i) = -1;
    end
    x = 1;
    //Traversing through requests
    for i = 1:n
        j = 0;
        shortest = 100000;
        for k = 1:n
            //Get shortest distance of remaining requests from previous request
            if(abs(head - a(k)) < shortest && done(k) == -1) then
                j = k;
                shortest = abs(head - a(k));
            end
        end
        //Request executed
        done(j) = 1;
        //Increment seek_count with the shortest distance
        seek_count = seek_count + shortest;
        head = a(j);
        queue(x) = head;
        x = x + 1;
        printf("   T%d   ",i);
    end
    printf("  T%d   ",i+1);
    printf("\nNo. of Cylinders");
    printf("   %d ",ihead);
    //Order of request execution
    for i = 1:x-1
        printf("   %4d ",queue(i));
    end
    //Total distance
    printf("\n  Total distance : %d", seek_count);
endfunction
