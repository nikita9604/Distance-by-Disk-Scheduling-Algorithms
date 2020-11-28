//This Source file is written by Nikita Rath (18BLC1131), VIT Chennai
//Function for FCFS
function [] = fcfs(a,head,n)
    printf("Order of Track   ");
    seek_count = 0;
    ihead=head;
    //Traversing through requests
    for i = 1:n
        cur_track = a(i);
        //Distance between the current and previous request
        distance = abs(cur_track - head);
        //Increment seek_count with the distance
        seek_count = seek_count + distance;
        head = cur_track;
        printf("   T%d   ",i);
    end
    printf("  T%d   ",i+1);
    printf("\nNo. of Cylinders");
    printf("   %d ",ihead);
    //Order of request execution
    for i = 1:n
        printf("   %4d ",a(i));
    end
    //Total distance
    printf("\n  Total distance : %d", seek_count);
endfunction
