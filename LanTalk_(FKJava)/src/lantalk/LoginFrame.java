package lantalk;


import java.awt.*;
import java.awt.event.*;
import java.net.InetAddress;
import javax.swing.*;

// ��¼�õĶԻ���
public class LoginFrame extends JDialog
{
	public JLabel tip;
	public JTextField userField = new JTextField("" , 20);
	public JComboBox<Integer> iconList = new JComboBox<>(
		new Integer[]{1, 2, 3, 4, 5 , 6, 7, 8 ,9 ,10});
	private JButton loginBn = new JButton("��¼");
	// �����������
	private LanTalk chatFrame;
	// ����ͨ�ŵĹ���ʵ��
	public static ComUtil comUtil;
	// �����������ڳ�ʼ���ĵ�¼�Ի���
	public LoginFrame(LanTalk parent , String msg)
	{
		super(parent , "�������ֺ��¼" , true);
		this.chatFrame = parent;
		setLayout(new GridLayout(5, 1));
		JPanel jp = new JPanel();
		tip = new JLabel(msg);
		tip.setFont(new Font("Serif" , Font.BOLD , 16));
		jp.add(tip);
		add(jp);
		add(getPanel("�û���" , userField));
		//�����һ��ͷ��Ԥ���Ĺ���
		JLabel icon=new JLabel("");
		icon.setBackground(Color.BLACK); 
		icon.setPreferredSize(new Dimension(105, 40));
		icon.setIcon(new ImageIcon("ico/" + (iconList.getSelectedIndex()+1) + ".gif"));
		iconList.setPreferredSize(new Dimension(224, 20));
		iconList.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(final ItemEvent e) {
				// TODO Auto-generated method stub
				icon.setIcon(new ImageIcon("ico/" + (iconList.getSelectedIndex()+1) + ".gif"));
			}
		}); 
		add(getPanel("ͷ    ��" , iconList));
		JPanel bp = new JPanel();
		loginBn.addActionListener(new MyActionListener(this));
		bp.add(getPanel("Ԥ    ��", icon));
		bp.add(loginBn);
		add(bp);
		pack();
		addWindowListener(new WindowAdapter() {
			 public void windowClosing(WindowEvent e) {
				 System.exit(0);
			 }
		});
		setVisible(true);
	}
	// ���߷������÷�����һ���ַ����������ϳ�JPanel����
	private JPanel getPanel(String name , JComponent jf)
	{
		try {
			InetAddress addr=InetAddress.getLocalHost();
			String oup=addr.getHostAddress();
			userField.setText(oup+":30001");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JPanel jp = new JPanel();
		jp.add(new JLabel(name + "��"));
		jp.add(jf);
		return jp;
	}
	// �÷������ڸı��¼�������������ʾ��Ϣ
	public void setTipMsg(String tip)
	{
		this.tip.setText(tip);
	}
	// ����һ���¼�������
	class MyActionListener implements ActionListener
	{
		private LoginFrame loginFrame;
		public MyActionListener(LoginFrame loginFrame)
		{
			this.loginFrame = loginFrame;
		}
		// ����굥���¼�����ʱ
		public void actionPerformed(ActionEvent evt)
		{
			try
			{
				// ��ʼ������ͨ����
				comUtil = new ComUtil(chatFrame);
				if (userField.getText().equals("")) {
					try {
						InetAddress addr=InetAddress.getLocalHost();
						String oup=addr.getHostAddress();
						userField.setText(oup+":30001");
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				final String loginMsg = YeekuProtocol.PRESENCE + userField.getText()
					+ YeekuProtocol.SPLITTER + iconList.getSelectedObjects()[0]
					+ YeekuProtocol.PRESENCE;
				comUtil.broadCast(loginMsg);
				// ������ʱ��ÿ20��㲥һ��������Ϣ
				javax.swing.Timer timer = new javax.swing.Timer(1000 * 10
					, event-> comUtil.broadCast(loginMsg));
				timer.start();
				loginFrame.setVisible(false);
				chatFrame.setVisible(true);
			}
			catch (Exception ex)
			{
				loginFrame.setTipMsg("ȷ��30001�˿ڿ��У�������������");
			}
		}
	}
}