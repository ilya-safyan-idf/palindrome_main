class PalidromeResponse {
  final bool isPalidrome;

  PalidromeResponse({required this.isPalidrome});

  factory PalidromeResponse.fromJson(Map<String, dynamic> json) {
    return PalidromeResponse(isPalidrome: json['isPalindrome']);
  }
}
