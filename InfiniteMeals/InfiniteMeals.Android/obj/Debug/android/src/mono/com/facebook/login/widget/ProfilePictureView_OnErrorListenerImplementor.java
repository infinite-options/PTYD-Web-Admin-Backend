package mono.com.facebook.login.widget;


public class ProfilePictureView_OnErrorListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.facebook.login.widget.ProfilePictureView.OnErrorListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onError:(Lcom/facebook/FacebookException;)V:GetOnError_Lcom_facebook_FacebookException_Handler:Xamarin.Facebook.Login.Widget.ProfilePictureView/IOnErrorListenerInvoker, Xamarin.Facebook.Login.Android\n" +
			"";
		mono.android.Runtime.register ("Xamarin.Facebook.Login.Widget.ProfilePictureView+IOnErrorListenerImplementor, Xamarin.Facebook.Login.Android", ProfilePictureView_OnErrorListenerImplementor.class, __md_methods);
	}


	public ProfilePictureView_OnErrorListenerImplementor ()
	{
		super ();
		if (getClass () == ProfilePictureView_OnErrorListenerImplementor.class)
			mono.android.TypeManager.Activate ("Xamarin.Facebook.Login.Widget.ProfilePictureView+IOnErrorListenerImplementor, Xamarin.Facebook.Login.Android", "", this, new java.lang.Object[] {  });
	}


	public void onError (com.facebook.FacebookException p0)
	{
		n_onError (p0);
	}

	private native void n_onError (com.facebook.FacebookException p0);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
