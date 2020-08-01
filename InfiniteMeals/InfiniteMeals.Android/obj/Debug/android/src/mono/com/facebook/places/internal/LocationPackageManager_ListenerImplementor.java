package mono.com.facebook.places.internal;


public class LocationPackageManager_ListenerImplementor
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.facebook.places.internal.LocationPackageManager.Listener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onLocationPackage:(Lcom/facebook/places/internal/LocationPackage;)V:GetOnLocationPackage_Lcom_facebook_places_internal_LocationPackage_Handler:Xamarin.Facebook.Places.Internal.LocationPackageManager/IListenerInvoker, Xamarin.Facebook.Places.Android\n" +
			"";
		mono.android.Runtime.register ("Xamarin.Facebook.Places.Internal.LocationPackageManager+IListenerImplementor, Xamarin.Facebook.Places.Android", LocationPackageManager_ListenerImplementor.class, __md_methods);
	}


	public LocationPackageManager_ListenerImplementor ()
	{
		super ();
		if (getClass () == LocationPackageManager_ListenerImplementor.class)
			mono.android.TypeManager.Activate ("Xamarin.Facebook.Places.Internal.LocationPackageManager+IListenerImplementor, Xamarin.Facebook.Places.Android", "", this, new java.lang.Object[] {  });
	}


	public void onLocationPackage (com.facebook.places.internal.LocationPackage p0)
	{
		n_onLocationPackage (p0);
	}

	private native void n_onLocationPackage (com.facebook.places.internal.LocationPackage p0);

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
