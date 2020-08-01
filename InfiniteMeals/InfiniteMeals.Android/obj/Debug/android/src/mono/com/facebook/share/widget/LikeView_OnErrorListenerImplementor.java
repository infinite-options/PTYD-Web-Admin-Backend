package mono.com.facebook.share.widget;


public class LikeView_OnErrorListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.facebook.share.widget.LikeView.OnErrorListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onError:(Lcom/facebook/FacebookException;)V:GetOnError_Lcom_facebook_FacebookException_Handler:Xamarin.Facebook.Share.Widget.LikeView/IOnErrorListenerInvoker, Xamarin.Facebook.Common.Android\n" +
			"";
		mono.android.Runtime.register ("Xamarin.Facebook.Share.Widget.LikeView+IOnErrorListenerImplementor, Xamarin.Facebook.Common.Android", LikeView_OnErrorListenerImplementor.class, __md_methods);
	}


	public LikeView_OnErrorListenerImplementor ()
	{
		super ();
		if (getClass () == LikeView_OnErrorListenerImplementor.class)
			mono.android.TypeManager.Activate ("Xamarin.Facebook.Share.Widget.LikeView+IOnErrorListenerImplementor, Xamarin.Facebook.Common.Android", "", this, new java.lang.Object[] {  });
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
