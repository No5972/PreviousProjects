#include<iostream>
#include<windows.h>
//#include <sys/stat.h>
#include <time.h>
#include <string.h>
#include <conio.h>
#include <io.h>
using namespace std;

int nfile=0;
int ifile[17];
void mainmenu();
void detailed(int nf);


char *getfileline(char *p,int n, char *str){
	FILE *fp;
	int i;
	if ((fp=fopen(p,"r"))==NULL){
		//printf("打开文件错误\n");
		return NULL;
	}
	for(i=1;i<n;i++)
		if ((fgets(str,1000,fp))==NULL) {
			fclose(fp);
			return NULL;
		}
	fgets(str,1000,fp);
	fclose(fp);
	return str;
}

void drawtitle() {
	cout<<"███████████████████████████████████████"<<endl;
	cout<<"█████████5972 C语言通讯录管理系统 V0.01  Build 0208█████████"<<endl;
	cout<<"███████████████████████████████████████"<<endl;
}
 
void SetColor(unsigned short ForeColor,unsigned short BackGroundColor)
{HANDLE hCon=GetStdHandle(STD_OUTPUT_HANDLE);
SetConsoleTextAttribute(hCon,(ForeColor%16)|(BackGroundColor%16*16));}
 
void gotoxy(int Wide,int High) //control the cursor
{
	HANDLE hOut;
	COORD pos= {Wide, High};
	hOut = GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleCursorPosition(hOut, pos);
	//SetConsoleTextAttribute(hOut, 0x01|0x05);
}

void changeitem(int nf, int line) {
	char p[10]; FILE *ofp; char filenum[20]; char tempfile[20]; char k; char temp[512];
	char sub[1000]={NULL}; int j; char tmp[5]; 
	char data[8][15]={"姓　　名","电　　话","单位电话","移动电话","传　　真","电子邮箱","联系地址","邮　　编"};
	itoa(nf, filenum, 10);
	itoa(nf, tempfile, 10);
	//strcat("data\\",filenum);
	strcat(filenum, ".txt");
	strcat(tempfile, "_temp.txt");
	getfileline(filenum, line, temp);
	gotoxy(22,10); cout<<"┏━━━━━━━━━━━━━━━━━┓";
	gotoxy(22,11); cout<<"┃　　　　　　"<<data[line-1]<<"　　　　　　　┃";
	gotoxy(22,12); cout<<"┃当前：　　　　　　　　　　　　　　┃";
	gotoxy(22,13); cout<<"┃输入修改值：　　　　　　　　　　　┃";
	gotoxy(22,14); cout<<"┃确认<Enter>　返回<Esc>　　　　　　┃";
	gotoxy(22,15); cout<<"┗━━━━━━━━━━━━━━━━━┛";
	gotoxy(30,12); cout<<temp;
	gotoxy(36,13); 
	while(((k=getch())!=0x1B)&&(k!=0x0D)) {
		if (k==0x08&&strlen(sub)!=0) {
			sub[strlen(sub)-1]='\0';
			cout<<"\b ";
		}
		//cout<<k;
		gotoxy(36,13);
		cout<<"　　　　　　　　　　　";
		sprintf(tmp,"%c",k);
		if (k!=0x08) 
			strcat(sub,tmp);
		gotoxy(36,13);
		cout<<sub;
	} 
	if (k==0x0D) {
		if ((ofp=fopen(tempfile,"w"))!=NULL) {
			for (int i=1;i<line;i++) {
				getfileline(filenum,i,p);
				fputs(p,ofp);
			}
			fputs(sub,ofp);
			fputs("\n",ofp);
			for (i=line+1;i<=8;i++) {
				getfileline(filenum,i,p);
				fputs(p,ofp);
			}
		}
		fclose(ofp);
	}
	fcloseall();
	SetColor(7,0);
	remove(filenum);  //unable to remove
	rename(tempfile,filenum);
	system("pause");
	system("cls");
	//cout<<sub<<endl;
	//fcloseall();
	//exit(0);
	detailed(nf);
}

void detailed(int nf) {
	char temp[512]; char filenum[20]; char k;
	int j=0,j0=0;
	//struct stat buffer;
	char data[8][15]={"姓名：　　","电话：　　","单位电话：","移动电话：","传真：　　","电子邮箱：","联系地址：","邮编：　　"};
	system("cls");
	drawtitle();
	cout<<endl<<"______________________________________________________________________________"<<endl;
	itoa(nf, filenum, 10);
	//strcat("data\\",filenum);
	strcat(filenum, ".txt");
	for (int i=0;i<=7;i++) {
		if (getfileline(filenum, i+1, temp)!=NULL) {
			int len=strlen(temp);
			if (temp[len-1]=='\n') temp[len-1]='\0';
			cout<<data[i]<<"　"<<temp<<endl; //print current item
		}
	}
	FILETIME *LastAccessTime=new FILETIME;
	FILETIME *CreationTime=new FILETIME;
	FILETIME *LastWriteTime=new FILETIME;
	SYSTEMTIME *STime=new SYSTEMTIME;
	SYSTEMTIME *TTime=new SYSTEMTIME;
	HFILE hFile; long tmp;
	//STime=new SYSTEMTIME;
	hFile=_lopen(filenum,OF_READ);
	tmp=GetFileTime((HANDLE*)hFile,CreationTime,LastAccessTime,LastWriteTime);
	FileTimeToSystemTime(CreationTime,STime);
	FileTimeToSystemTime(LastWriteTime,TTime);
	//stat(filenum, &buffer);
	gotoxy(0,23);
	cout<<"修改选定项<C> 返回<Esc> 移动光标<Up/Down> 创建时间："
		<<STime->wYear<<"-"
		<<STime->wMonth<<"-"
		<<STime->wDay<<" "
		<<STime->wHour<<":"
		<<STime->wMinute<<":"
		<<STime->wSecond<<endl;
	cout<<"修改时间："
		<<TTime->wYear<<"-"
		<<TTime->wMonth<<"-"
		<<TTime->wDay<<" "
		<<TTime->wHour<<":"
		<<TTime->wMinute<<":"
		<<TTime->wSecond
		<<" 当前1/1492";
	do {
		SetColor(7,0);
		gotoxy(0,j0+5);
		if (getfileline(filenum, j0+1, temp)!=NULL) {
			int len=strlen(temp);
			if (temp[len-1]=='\n') temp[len-1]='\0';
			cout<<data[j0]<<"　"<<temp; //print current item
			//nlist++;
		}
		SetColor(0,7);
		gotoxy(0,j+5);
		if (getfileline(filenum, j+1, temp)!=NULL) {
			int len=strlen(temp);
			if (temp[len-1]=='\n') temp[len-1]='\0';
			cout<<data[j]<<"　"<<temp; //print current item
			//nlist++;
		}
		j0=j;
		switch (k=getch()) {
			case 80: if (j<7) j++; break;
			case 72: if (j>0) j--; break;
			case 13: 
				//gotoxy(0,18);
				//cout<<"                     "; gotoxy(0,18);
				//cout<<"What you select is "<<j+5<<endl;
				/*
				gotoxy(10,12); cout<<"┏━━━━━━━━━━━━━━━━━┓";
				gotoxy(11,12); cout<<"┃　　　　　　　电话　　　　　　　　┃";
				gotoxy(11,12); cout<<"┃当前：00000001　　　　　　　　　　┃";
				gotoxy(11,12); cout<<"┃输入修改值：　　　　　　　　　　　┃";
				gotoxy(11,12); cout<<"┃确认<Enter>　返回<Esc>　　　　　　┃";
				gotoxy(11,12); cout<<"┗━━━━━━━━━━━━━━━━━┛";
				*/
				changeitem(nf,j+1);
				break;
			case 27: SetColor(7,0); system("cls"); mainmenu(); break;
			default: break;
		}
	} while (k!=0x1B);
}

int getlist(int page) {
	int i;
	char temp[512]; int nlist=-1; char filenum[20];
	for(i=page*17;i<=17;i++) {
		itoa(i, filenum, 10);
		//strcat("data\\",filenum);
		strcat(filenum, ".txt");
		if (getfileline(filenum, 1, temp)!=NULL) { //file exist
			int len=strlen(temp);
			if (temp[len-1]=='\n') temp[len-1]='\0';
			cout<<temp; //print current item
			nlist++;
			ifile[nlist]=i;
			cout<<"\t\t\t\t\t\t\t\t";
		}
		if (getfileline(filenum, 2, temp)!=NULL) {
			int len=strlen(temp);
			if (temp[len-1]=='\n') temp[len-1]='\0';
			cout<<temp<<endl; //print current item
		}
		//fclose(fplist);
	}
	return nlist;
}

void mainmenu() {
	int i=0,j=0,j0=0;
	char k; char temp[512]; int nlist=0; char filenum[20];
	drawtitle();
	cout<<"姓名\t\t\t\t\t\t\t\t电话"<<endl;
	cout<<"______________________________________________________________________________"<<endl;
	nlist=getlist(0);
	gotoxy(0,23);
	cout<<"添加记录<A> 删除选中记录<Del> 查看详细记录<Enter> 换页<PgUp/PgDn> 跳页<P>"<<endl;
	cout<<"退出<Esc> 移动光标<Up/Down> 排序方式<O> 查找<S> 当前"<<1<<"/"<<(1+nfile/17);
	do {
		//system("cls");
		SetColor(7,0);
		gotoxy(0,j0+5);
		//previos item
		itoa(ifile[j0], filenum, 10);
		//strcat("data\\",filenum);
		strcat(filenum, ".txt");
		if (getfileline(filenum, 1, temp)!=NULL) {
			int len=strlen(temp);
			if (temp[len-1]=='\n') temp[len-1]='\0';
			cout<<temp; //print current item
			//nlist++;
		}
		cout<<"\t\t\t\t\t\t\t\t";
		if (getfileline(filenum, 2, temp)!=NULL) {
			int len=strlen(temp);
			if (temp[len-1]=='\n') temp[len-1]='\0';
			cout<<temp<<endl; //print current item
		}
		gotoxy(0,j+5);
		SetColor(0,7);
		//newly selected item
		itoa(ifile[j], filenum, 10);
		//strcat("data\\",filenum);
		strcat(filenum, ".txt");
		if (getfileline(filenum, 1, temp)!=NULL) {
			int len=strlen(temp);
			if (temp[len-1]=='\n') temp[len-1]='\0';
			cout<<temp; //print current item
			//nlist++;
		}
		cout<<"\t\t\t\t\t\t\t\t";
		if (getfileline(filenum, 2, temp)!=NULL) {
			int len=strlen(temp);
			if (temp[len-1]=='\n') temp[len-1]='\0';
			cout<<temp<<endl; //print current item
		}
		SetColor(7,0);
		//k=getch();
		//cout<<(int)k;
		j0=j;
		switch (k=getch()) {
			case 80: if (j<nlist) j++; break;
			case 72: if (j>0) j--; break;
			case 13: 
				//gotoxy(0,18);
				//cout<<"                     "; gotoxy(0,18);
				//cout<<"What you select is "<<j+5<<endl;
				detailed(ifile[j]);
				break;
			case 27: system("cls"); fcloseall(); exit(0); break;
			default: break;
		}
	} while (k!=0x1B);
}

int main()
{
	mainmenu();
	long Handle;
	struct _finddata_t FileInfo;
	if((Handle=_findfirst("*.txt",&FileInfo))==-1L) 
		nfile++; //printf("没有找到匹配的项目\n"); 
	else
	{
		nfile++; //printf("%s\n",FileInfo.name);  
		while( _findnext(Handle,&FileInfo)==0)
			nfile++; //printf("%s\n",FileInfo.name);
		_findclose(Handle);
	}
	//printf("%d",nfile);
	return 0;
}