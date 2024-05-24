clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
imtool close all;  % Close all imtool figures.
clear;  % Erase all existing variables.
workspace;  % Make sure the workspace panel is showing.
format longg;
format compact;
fontSize = 14;
num=input('Enter a power of 10 between 2 and 15: ');
iter=0;
x=linspace(-10,10,500);
maxiter=1000;
if (num<2 || num>15 || rem(num,1)~=0)
  disp('Invalid input');
  num=input('Enter an INTEGER power of 10 between 2 and 15: ');
end
f=( ((sqrt(log(x.^(2) + 1)))/ (cosh(x)) - x + pi - (20/3)*exp(-abs(x/10))));
x0= input( 'Please enter a value for x0: ');
x1= input( 'Please enter a vlaue for x1: ');
f0=( ((sqrt(log(x0^(2) + 1)))/ (cosh(x0)) - x0 + pi - (20/3)*exp(-abs(x0/10))));
f1=( ((sqrt(log(x1^(2) + 1)))/ (cosh(x1)) - x1 + pi - (20/3)*exp(-abs(x1/10))));
convergenceLimit = 10^(-num);
while (iter<1000)
  x2= x1-f1 * [(x0 -x1)/ (f0-f1)];
  f2=( ((sqrt(log(x2^(2) + 1)))/ (cosh(x2)) - x2 + pi - (20/3)*exp(-abs(x2/10))));
  iterationDifference = abs(x2-x1);
  fprintf('%d, difference = %f\n', iter, iterationDifference);
  if (iterationDifference < convergenceLimit)
    root=x2;
    disp(root);
    subplot(2,1,1);
    scatter(x,f);
    xlabel('x', 'Fontsize', fontSize);
    ylabel('f', 'Fontsize', fontSize);
    title('f vs. x', 'Fontsize', fontSize);
    grid on
    hold on
    subplot(2,1,2);
    scatter(x2,iterationDifference);
    xlabel('x2', 'Fontsize', fontSize);
    ylabel('iterationDifference', 'Fontsize', fontSize);
    title('Difference vs. x2', 'Fontsize', fontSize);
    grid on
    hold on  
    % Enlarge figure to full screen.
    set(gcf, 'units','normalized','outerposition',[0 0 1 1]);
    msgbox('Please see the plots.');
    break;
  else
    x0=x1;
    x1=x2;
    f0=f1;
    f1=f2;
  end
  message = sprintf('That was iteration %d, with a difference of %f\nDo you want to continue?',...
    iter, iterationDifference);
  button = questdlg(message, 'Continue?', 'Yes', 'No', 'Yes');
  drawnow;  % Refresh screen to get rid of dialog box remnants.
  if strcmpi(button, 'No')
    break;
  end
  iter=iter+1;
end
if (iter >= maxiter)
  disp('Convergence was not achieved');
end