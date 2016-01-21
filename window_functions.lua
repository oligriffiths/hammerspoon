

function scaleWindow(window, amount)

    local frame = window:frame();

    frame.x = frame.x - amount;
    frame.y = frame.y - amount;
    frame.w = frame.w + amount*2;
    frame.h = frame.h + amount*2;

    window:setFrame(frame);
end