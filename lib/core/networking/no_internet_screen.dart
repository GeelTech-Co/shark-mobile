import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shark_mobile/core/themes/colors.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetScreen({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lottie/Website maintenance, website problems, 404.json',
              ),
              SizedBox(height: 20.h),
              Text(
                "no_internet_connection".tr(),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.darkBlue,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'check_connection_and_try_again'.tr(),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ColorsManager.lightGray,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primary,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.w,
                    vertical: 12.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: onRetry,
                child: Text(
                  'try_again'.tr(),
                  style: TextStyle(fontSize: 16.sp, color: ColorsManager.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NetworkAwareWidget extends StatefulWidget {
  final Widget child;
  const NetworkAwareWidget({super.key, required this.child});

  @override
  State<NetworkAwareWidget> createState() => _NetworkAwareWidgetState();
}

class _NetworkAwareWidgetState extends State<NetworkAwareWidget> {
  bool hasConnection = true;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    // Check initial connectivity status
    _checkConnectivity();
    // Listen to connectivity changes
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      final result = results.isNotEmpty
          ? results.first
          : ConnectivityResult.none;
      _handleConnectivityChange(result);
    });
  }

  @override
  void dispose() {
    // Dispose of the subscription to prevent memory leaks
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  // Handle connectivity change events
  void _handleConnectivityChange(ConnectivityResult result) {
    _checkConnectivity();
  }

  // Check connectivity and actual internet access
  Future<void> _checkConnectivity() async {
    try {
      final connectivityResults = await Connectivity().checkConnectivity();
      bool isConnected =
          connectivityResults.isNotEmpty &&
          connectivityResults.any(
            (result) =>
                result == ConnectivityResult.wifi ||
                result == ConnectivityResult.mobile ||
                result == ConnectivityResult.ethernet,
          );

      // Verify actual internet access if connected
      if (isConnected) {
        isConnected = await _hasInternetAccess();
      }

      // Only update state if the widget is still mounted and the connection status has changed
      if (mounted && hasConnection != isConnected) {
        setState(() {
          hasConnection = isConnected;
        });
      }
    } catch (e, stackTrace) {
      // Log error for debugging
      debugPrint('Connectivity check error: $e\n$stackTrace');
      if (mounted && hasConnection != false) {
        setState(() {
          hasConnection = false;
        });
      }
    }
  }

  // Check actual internet access by pinging a server
  Future<bool> _hasInternetAccess() async {
    try {
      final result = await InternetAddress.lookup(
        'google.com',
      ).timeout(const Duration(seconds: 5), onTimeout: () => []);
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      debugPrint('Internet access check failed: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return hasConnection
        ? widget.child
        : NoInternetScreen(
            onRetry: _checkConnectivity, // Retry checks connectivity again
          );
  }
}
