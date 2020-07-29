package mono.com.facebook.internal;


public class CollectionMapper_OnErrorListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.facebook.internal.CollectionMapper.OnErrorListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onError:(Lcom/facebook/FacebookException;)V:GetOnError_Lcom_facebook_FacebookException_Handler:Xamarin.Facebook.Internal.CollectionMapper/IOnErrorListenerInvoker, Xamarin.Facebook.Share.Android\n" +
			"";
		mono.android.Runtime.register ("Xamarin.Facebook.Internal.CollectionMapper+IOnErrorListenerImplementor, Xamarin.Facebook.Share.Android", CollectionMapper_OnErrorListenerImplementor.class, __md_methods);
	}


	public CollectionMapper_OnErrorListenerImplementor ()
	{
		super ();
		if (getClass () == CollectionMapper_OnErrorListenerImplementor.class)
			mono.android.TypeManager.Activate ("Xamarin.Facebook.Internal.CollectionMapper+IOnErrorListenerImplementor, Xamarin.Facebook.Share.Android", "", this, new java.lang.Object[] {  });
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
