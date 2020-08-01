package mono.com.facebook.internal;


public class WebDialog_OnCompleteListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.facebook.internal.WebDialog.OnCompleteListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onComplete:(Landroid/os/Bundle;Lcom/facebook/FacebookException;)V:GetOnComplete_Landroid_os_Bundle_Lcom_facebook_FacebookException_Handler:Xamarin.Facebook.Internal.WebDialog/IOnCompleteListenerInvoker, Xamarin.Facebook.Common.Android\n" +
			"";
		mono.android.Runtime.register ("Xamarin.Facebook.Internal.WebDialog+IOnCompleteListenerImplementor, Xamarin.Facebook.Common.Android", WebDialog_OnCompleteListenerImplementor.class, __md_methods);
	}


	public WebDialog_OnCompleteListenerImplementor ()
	{
		super ();
		if (getClass () == WebDialog_OnCompleteListenerImplementor.class)
			mono.android.TypeManager.Activate ("Xamarin.Facebook.Internal.WebDialog+IOnCompleteListenerImplementor, Xamarin.Facebook.Common.Android", "", this, new java.lang.Object[] {  });
	}


	public void onComplete (android.os.Bundle p0, com.facebook.FacebookException p1)
	{
		n_onComplete (p0, p1);
	}

	private native void n_onComplete (android.os.Bundle p0, com.facebook.FacebookException p1);

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
